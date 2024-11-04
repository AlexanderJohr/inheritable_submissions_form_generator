import 'dart:async';
import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:json_to_survey/src/store/store.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:postgres/postgres.dart';
import 'package:rxdart/rxdart.dart';

import '../view_model/view_models.dart';

const surveyChangesChannelName = "survey_changes";
const submissionChangesChannelName = "submission_changes";
const submissionLinkChangesChannelName = "submission_link_changes";
const choiceQuestionAnswerChangesChannelName = 'choice_question_answer_changes';
const concretisationChangesChannelName = "concretisation_changes";

enum NotifyChannel {
  survey,
  submission,
  submissionLink,
  choiceQuestionAnswer,
  concretisation;

  String get name {
    return switch (this) {
      NotifyChannel.survey => surveyChangesChannelName,
      NotifyChannel.submission => submissionChangesChannelName,
      NotifyChannel.submissionLink => submissionLinkChangesChannelName,
      NotifyChannel.choiceQuestionAnswer => choiceQuestionAnswerChangesChannelName,
      NotifyChannel.concretisation => concretisationChangesChannelName,
    };
  }

  static NotifyChannel fromString(String name) {
    return switch (name) {
      surveyChangesChannelName => NotifyChannel.survey,
      submissionChangesChannelName => NotifyChannel.submission,
      submissionLinkChangesChannelName => NotifyChannel.submissionLink,
      choiceQuestionAnswerChangesChannelName => NotifyChannel.choiceQuestionAnswer,
      concretisationChangesChannelName => NotifyChannel.concretisation,
      _ => throw ArgumentError("Unknown NotifyChannel name: $name"),
    };
  }
}

class PostgreSQLStore extends Store {
  BehaviorSubject<Connection> databaseConnectionSubject = BehaviorSubject<Connection>();

  Future<Connection> get databaseConnection => databaseConnectionSubject.first;

  final String host;
  final int port;
  final String databaseName;
  @override
  final String username;
  final String password;

  PostgreSQLStore(
      {required this.host,
      required this.port,
      required this.databaseName,
      required this.username,
      required this.password,
      required this.onSocketDone});

  bool validateSurveyTypes(BuiltList<Survey> surveyTypes) {
    return surveyTypes.every((surveyType) => surveyType.validate());
  }

  @override
  Future<BuiltList<Survey>> fetchSurveys() async {
    final database = await databaseConnection;

    final result = await database.execute("SELECT id, name, description, structure FROM survey;");

    final surveyTypes = Survey.fromResultList(result);

    validateSurveyTypes(surveyTypes);

    vm.surveyViewModel.add(surveyTypes);

    final choiceQuestionTypeResult = await database.execute("SELECT unnest(enum_range(NULL::choice_question_type))::text AS choice_question_type;");

    final choiceAnswerTypeResult = await database.execute("SELECT unnest(enum_range(NULL::choice_answer_type))::text AS choice_answer_type;");

    addChoiceQuestionTypesToCache(choiceQuestionTypeResult.map((row) => row.first.toString()).toBuiltSet());
    addChoiceAnswerTypesToCache(choiceAnswerTypeResult.map((row) => row.first.toString()).toBuiltSet());

    return surveyTypes;
  }

  @override
  Future<BuiltList<Submission>> fetchSubmissions({required int surveyId}) async {
    final database = await databaseConnection;
    final result =
        await database.execute("SELECT id, title, survey_id, created_by, created_date	FROM public.submission WHERE survey_id = $surveyId;");
    final submissions = Submission.fromResultList(result);

    vm.submissionViewModel.update(submissions);

    return submissions;
  }

  @override
  Future<BuiltList<ChoiceQuestionAnswer>> fetchGeneralSubmissionData(
      {required int surveyTypeId, required List<int> submissionIds, required List<String> questions}) async {
    if (submissionIds.isEmpty || questions.isEmpty) {
      return BuiltList();
    }

    final database = await databaseConnection;

    final submissionIdWhereExpression = submissionIds.map((id) => "submission_id = $id").join(" OR ");

    final questionsWhereExpression = questions.map((question) => "question = '$question'").join(" OR ");

    final query =
        "SELECT id, submission_id, question::text, linked_submission_id, answer::text, parent_id FROM public.choice_question_answer WHERE ($submissionIdWhereExpression) AND ($questionsWhereExpression);";

    final result = await database.execute(query);

    final choiceAnswers = ChoiceQuestionAnswer.fromResultList(result);

    vm.choiceQuestionAnswerViewModel.update(choiceAnswers);

    return choiceAnswers;
  }

  @override
  Future<BuiltList<SubmissionLink>> fetchSubmissionLinksForChildSubmission({required Submission submission}) async {
    final database = await databaseConnection;

    final result = await database.execute(
        "SELECT id, parent_id, child_id, choice_question_answer_parent, relationship FROM public.submission_link WHERE child_id = ${submission.id};");

    final submissionLinks = SubmissionLink.fromResultList(result);

    vm.submissionLinkViewModel.update(submissionLinks);

    return submissionLinks;
  }

  @override
  Future<BuiltList<SubmissionLink>> fetchSubmissionLinksForSubmission({required Submission submission}) async {
    final database = await databaseConnection;

    final result = await database.execute(
        "SELECT id, parent_id, child_id, choice_question_answer_parent, relationship FROM public.submission_link WHERE child_id = ${submission.id} OR parent_id = ${submission.id};");

    final submissionLinks = SubmissionLink.fromResultList(result);

    vm.submissionLinkViewModel.update(submissionLinks);

    return submissionLinks;
  }

  @override
  Future<Iterable<SubmissionLink>> fetchSubmissionLinksForSubmissions({
    required Iterable<Submission> submissions,
  }) async {
    final database = await databaseConnection;

    // Create a list of submission IDs
    final submissionIds = submissions.map((submission) => submission.id).join(',');

    // Fetch submission links for all the given submission IDs
    final result = await database.execute("SELECT id, parent_id, child_id, choice_question_answer_parent, relationship "
        "FROM public.submission_link "
        "WHERE child_id IN ($submissionIds) OR parent_id IN ($submissionIds);");

    // Parse the result into SubmissionLink objects
    final submissionLinks = SubmissionLink.fromResultList(result);

    // Update the view model with the new submission links
    vm.submissionLinkViewModel.update(submissionLinks);

    return submissionLinks;
  }

  @override
  Future<BuiltList<SubmissionLink>> fetchSubmissionLinks() async {
    final database = await databaseConnection;

    final result = await database.execute("SELECT id, parent_id, child_id, choice_question_answer_parent, relationship FROM public.submission_link;");

    final submissionLinks = SubmissionLink.fromResultList(result);

    vm.submissionLinkViewModel.update(submissionLinks);

    return submissionLinks;
  }

  @override
  Future<Iterable<ChoiceQuestionAnswer>> fetchChoiceAnswers({required Iterable<Submission> submissions}) async {
    final database = await databaseConnection;

    final surveyIdWhereExpression = submissions.map((submission) => "submission_id = ${submission.id}").join(" OR ");

    var query =
        "SELECT id, submission_id, question::text, linked_submission_id, answer::text, parent_id FROM public.choice_question_answer WHERE $surveyIdWhereExpression;";
    final result = await database.execute(query);

    final choiceAnswers = ChoiceQuestionAnswer.fromResultList(result);

    vm.choiceQuestionAnswerViewModel.update(choiceAnswers);

    return choiceAnswers;
  }

  @override
  Future<Iterable<Concretisation>> fetchConcretisations({required Iterable<int> choiceQuestionAnswerIds}) async {
    if (choiceQuestionAnswerIds.isEmpty) {
      return {};
    }

    final database = await databaseConnection;

    final whereCondition = choiceQuestionAnswerIds.map((id) => "choice_question_answer_id = $id").join(" OR ");

    final result = await database
        .execute("SELECT id, choice_question_answer_id, order_index, concretisation_value FROM public.concretisation WHERE $whereCondition;");

    final concretisations = Concretisation.fromResultList(result);

    vm.concretisationsViewModel.update(concretisations);

    return concretisations;
  }

  @override
  addChoiceAnswer(
      {required Submission submission,
      required int linkedSubmissionId,
      required SurveyEntryPath path,
      required String newQuestion,
      required String answer}) async {
    final database = await databaseConnection;

    await addEnumValuesIfNotPresent(questionIds: {newQuestion}, answerValues: {answer});
    final parentId = path.getParentId(vm: vm, submission: submission);
    final result = await database.execute("""
    INSERT INTO public.choice_question_answer(
	  submission_id, question, linked_submission_id, answer, parent_id)
	  VALUES (${submission.id}, '$newQuestion', $linkedSubmissionId, '$answer', ${parentId ?? "NULL"})
    RETURNING id, submission_id, question::text, linked_submission_id, answer::text, parent_id;""");

    final choiceAnswers = ChoiceQuestionAnswer.fromResultList(result);

    vm.choiceQuestionAnswerViewModel.update(choiceAnswers);
    final payload = jsonEncode({
      "timestamp": vm.choiceQuestionAnswerViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "INSERT",
      "changes": choiceAnswers.map((choiceAnswer) => choiceAnswer.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.choiceQuestionAnswer.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);
  }

  @override
  Future<BuiltList<ChoiceQuestionAnswer>> insertChoiceAnswers({required BuiltList<ChoiceQuestionAnswer> answers}) async {
    if (answers.isEmpty) {
      return BuiltList();
    }

    final database = await databaseConnection;

    await addEnumValuesIfNotPresent(questionIds: answers.map((u) => u.question).toSet(), answerValues: answers.map((u) => u.answer).toSet());

    final query = """
    INSERT INTO public.choice_question_answer(
    submission_id, question, linked_submission_id, answer, parent_id)
    VALUES 
    ${answers.map((a) => "(${a.submissionId},'${a.question}',${a.linkedSubmissionId},'${a.answer}',${a.parentId})").join(",\n")}
    RETURNING id, submission_id, question::text, linked_submission_id, answer::text, parent_id;""";

    final result = await database.execute(query);

    final choiceAnswers = ChoiceQuestionAnswer.fromResultList(result);

    vm.choiceQuestionAnswerViewModel.update(choiceAnswers);
    final payload = jsonEncode({
      "timestamp": vm.choiceQuestionAnswerViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "INSERT",
      "changes": choiceAnswers.map((choiceAnswer) => choiceAnswer.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.choiceQuestionAnswer.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return choiceAnswers;
  }

  @override
  Future<BuiltList<ChoiceQuestionAnswer>> updateChoiceAnswers({required BuiltSet<ChoiceQuestionAnswer> updates}) async {
    if (updates.isEmpty) {
      return BuiltList();
    }
    final database = await databaseConnection;

    await addEnumValuesIfNotPresent(questionIds: updates.map((u) => u.question).toSet(), answerValues: updates.map((u) => u.answer).toSet());

    final query = """
    UPDATE choice_question_answer cqa
    SET 
      submission_id = updated_rows.submission_id::integer,
      question = updated_rows.question::choice_question_type,
      linked_submission_id = updated_rows.linked_submission_id::integer,
      answer = updated_rows.answer::choice_answer_type,
      parent_id = updated_rows.parent_id::integer
    FROM (
      VALUES
        ${updates.map((a) => "(${a.id} ,${a.submissionId},'${a.question}',${a.linkedSubmissionId},'${a.answer}',${a.parentId})").join(",\n")}
    ) AS updated_rows(id, submission_id, question, linked_submission_id, answer, parent_id)
    WHERE
      cqa.id=updated_rows.id
    RETURNING cqa.id, cqa.submission_id, cqa.question::text, cqa.linked_submission_id, cqa.answer::text, cqa.parent_id;
    """;

    final result = await database.execute(query);

    final choiceAnswers = ChoiceQuestionAnswer.fromResultList(result);

    vm.choiceQuestionAnswerViewModel.update(choiceAnswers);

    final payload = jsonEncode({
      "timestamp": vm.choiceQuestionAnswerViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "UPDATE",
      "changes": choiceAnswers.map((choiceAnswer) => choiceAnswer.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.choiceQuestionAnswer.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return choiceAnswers;
  }

  /// Initializes the database by creating necessary types and tables if they do not exist.
  Future<void> initializeDatabase(Connection connection) async {
    // Begin a transaction to ensure all setup steps are atomic
    await connection.runTx((ctx) async {
      // 1. Create Enums
      await ctx.execute(r"""
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 
    FROM pg_type t
    JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE t.typname = 'choice_question_type' 
      AND n.nspname = 'public'
  ) THEN
    CREATE TYPE public.choice_question_type AS ENUM 
    ('last_status', 'id_bdl', 'id_foerd_per', 'komplex_typ');
  END IF;
END$$;      """);

      await ctx.execute(r"""
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 
    FROM pg_type t
    JOIN pg_namespace n ON n.oid = t.typnamespace
    WHERE t.typname = 'choice_answer_type' 
      AND n.nspname = 'public'
  ) THEN
    CREATE TYPE public.choice_answer_type AS ENUM ();
  END IF;
END$$;      
      """);

      // 2. Create Tables
      await ctx.execute("""
CREATE TABLE IF NOT EXISTS public.survey
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default" NOT NULL,
    structure jsonb NOT NULL,
    CONSTRAINT "survey _structure_pkey" PRIMARY KEY (id)
)
      """);

      await ctx.execute("""
CREATE TABLE IF NOT EXISTS public.submission
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    survey_id integer NOT NULL,
    title character varying COLLATE pg_catalog."default" NOT NULL,
    created_by character varying COLLATE pg_catalog."default" NOT NULL,
    created_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT survey_pkey PRIMARY KEY (id),
    CONSTRAINT survey_survey_type_id_fkey FOREIGN KEY (survey_id)
        REFERENCES public.survey (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
      """);

      await ctx.execute("""
CREATE TABLE IF NOT EXISTS public.choice_question_answer
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    submission_id integer NOT NULL,
    question choice_question_type NOT NULL,
    linked_submission_id integer NOT NULL,
    answer choice_answer_type NOT NULL,
    parent_id integer,
    CONSTRAINT choice_question_answers_pkey PRIMARY KEY (id),
    CONSTRAINT choice_question_answer_survey_id_question_linked_survey_id__key UNIQUE (submission_id, question, linked_submission_id, answer, parent_id),
    CONSTRAINT choice_question_answer_linked_survey_id_fkey FOREIGN KEY (linked_submission_id)
        REFERENCES public.submission (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT choice_question_answer_survey_id_fkey FOREIGN KEY (submission_id)
        REFERENCES public.submission (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT choice_question_answers_parent_id_fkey FOREIGN KEY (parent_id)
        REFERENCES public.choice_question_answer (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
      """);

      await ctx.execute("""
CREATE TABLE IF NOT EXISTS public.submission_link
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    relationship text COLLATE pg_catalog."default" NOT NULL,
    choice_question_answer_parent integer,
    CONSTRAINT submission_link_pkey PRIMARY KEY (id),
    CONSTRAINT survey_link_child_id_relationship_key UNIQUE (child_id, relationship),
    CONSTRAINT survey_link_parent_id_child_id_relationship_key UNIQUE (parent_id, child_id, relationship),
    CONSTRAINT survey_link_child_id_fkey FOREIGN KEY (child_id)
        REFERENCES public.submission (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT survey_link_choice_question_answer_parent_fkey FOREIGN KEY (choice_question_answer_parent)
        REFERENCES public.choice_question_answer (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID,
    CONSTRAINT survey_link_parent_id_fkey FOREIGN KEY (parent_id)
        REFERENCES public.submission (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
      """);

      await ctx.execute("""
CREATE TABLE IF NOT EXISTS public.question_detail
(
    id choice_question_type NOT NULL,
    title text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT question_details_pkey PRIMARY KEY (id)
)
      """);

      await ctx.execute("""
CREATE TABLE IF NOT EXISTS public.concretisation
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    choice_question_answer_id integer NOT NULL,
    order_index integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    concretisation_value jsonb NOT NULL,
    CONSTRAINT concretisation_pkey PRIMARY KEY (id),
    CONSTRAINT concretisation_choice_question_answer_id_fkey FOREIGN KEY (choice_question_answer_id)
        REFERENCES public.choice_question_answer (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
)
      """);

      await ctx.execute("""
CREATE UNIQUE INDEX IF NOT EXISTS choice_question_answer_unique_without_parent_id
    ON public.choice_question_answer USING btree
    (submission_id ASC NULLS LAST, question ASC NULLS LAST, linked_submission_id ASC NULLS LAST, answer ASC NULLS LAST)

      """);

      await ctx.execute("""
CREATE TABLE IF NOT EXISTS public.answer_detail
(
    question_id choice_question_type NOT NULL,
    value choice_answer_type NOT NULL,
    title text COLLATE pg_catalog."default" NOT NULL,
    temp integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    CONSTRAINT answer_details_pkey PRIMARY KEY (temp)
)

      """);

      // Add any additional tables or types here
    });
  }

  Future<void> connect() async {
    final postgreSQLConnection = await Connection.open(
        Endpoint(
          host: host,
          database: databaseName,
          username: username,
          password: password,
        ),
        settings: ConnectionSettings(sslMode: SslMode.disable, encoding: utf8));

    // Initialize the database schema
    await initializeDatabase(postgreSQLConnection);

    postgreSQLConnection.channels.all.listen((event) {
      final notifyChannel = NotifyChannel.fromString(event.channel);
      final payloadJsonString = event.payload;
      final payloadJson = jsonDecode(payloadJsonString);
      final changesJson = payloadJson["changes"] as List;
      final changesTimestamp = DateTime.parse(payloadJson["timestamp"]);

      switch (notifyChannel) {
        case NotifyChannel.survey:
          final choices = changesJson.map((choiceJson) => Survey.fromJson(choiceJson));
          if (vm.surveyViewModel.lastUpdateTimeStamp.isBefore(changesTimestamp)) {
            if (vm.surveyViewModel.lastUpdateTimeStamp.isBefore(changesTimestamp)) {
              vm.surveyViewModel.update(choices.whereNotNull());
            }
          }
        case NotifyChannel.submission:
          final choices = changesJson.map((choiceJson) => Submission.fromJson(choiceJson));
          if (vm.submissionViewModel.lastUpdateTimeStamp.isBefore(changesTimestamp)) {
            vm.submissionViewModel.update(choices.whereNotNull());
          }
        case NotifyChannel.submissionLink:
          final choices = changesJson.map((choiceJson) => SubmissionLink.fromJson(choiceJson));
          if (vm.submissionLinkViewModel.lastUpdateTimeStamp.isBefore(changesTimestamp)) {
            vm.submissionLinkViewModel.update(choices.whereNotNull());
          }
        case NotifyChannel.choiceQuestionAnswer:
          final choices = changesJson.map((choiceJson) => ChoiceQuestionAnswer.fromJson(choiceJson));
          if (vm.choiceQuestionAnswerViewModel.lastUpdateTimeStamp.isBefore(changesTimestamp)) {
            vm.choiceQuestionAnswerViewModel.update(choices.whereNotNull());
          }
        case NotifyChannel.concretisation:
          final choices = changesJson.map((choiceJson) => Concretisation.fromJson(choiceJson));
          if (vm.concretisationsViewModel.lastUpdateTimeStamp.isBefore(changesTimestamp)) {
            vm.concretisationsViewModel.update(choices.whereNotNull());
          }
      }
    });

    final listenChoiceQuestionAnswerChangesQuery = 'LISTEN ${NotifyChannel.choiceQuestionAnswer.name}';
    final listenSurveyChangesQuery = 'LISTEN ${NotifyChannel.survey.name}';
    final listenSubmissionChangesQuery = 'LISTEN ${NotifyChannel.submission.name}';
    final listenSubmissionLinkChangesQuery = 'LISTEN ${NotifyChannel.submissionLink.name}';
    final listenConcretisationChangesQuery = 'LISTEN ${NotifyChannel.concretisation.name}';

    await postgreSQLConnection.execute(listenChoiceQuestionAnswerChangesQuery);
    await postgreSQLConnection.execute(listenSurveyChangesQuery);
    await postgreSQLConnection.execute(listenSubmissionChangesQuery);
    await postgreSQLConnection.execute(listenSubmissionLinkChangesQuery);
    await postgreSQLConnection.execute(listenConcretisationChangesQuery);

    databaseConnectionSubject.value = postgreSQLConnection;
    postgreSQLConnection.closed.then((value) => onSocketDone());
  }

  VoidCallback onSocketDone;

  addEnumValuesIfNotPresent({required Set<String> questionIds, required Set<String> answerValues}) async {
    final database = await databaseConnection;

    final questionIdsNotInChache = questionIds.difference(choiceQuestionTypes.value.toSet());
    final answerIdsNotInChache = answerValues.difference(choiceAnswerTypes.value.toSet());

    final alterQuestionTypeQueries = {
      for (var questionId in questionIdsNotInChache) questionId: "ALTER TYPE public.choice_question_type ADD VALUE IF NOT EXISTS '$questionId';\n",
    };

    final alterAnswerTypeQueries = {
      for (var answerId in answerIdsNotInChache) answerId: "ALTER TYPE public.choice_answer_type ADD VALUE IF NOT EXISTS '$answerId';\n",
    };

    final futures = <Future>[];
    for (var entry in alterQuestionTypeQueries.entries) {
      final questionId = entry.key;
      final query = entry.value;

      final responseFuture = database.execute(query).then((value) {
        choiceQuestionTypes.value = choiceQuestionTypes.value.rebuild((b) => b.add(questionId));
      });
      futures.add(responseFuture);
    }

    for (var entry in alterAnswerTypeQueries.entries) {
      final answerId = entry.key;
      final query = entry.value;

      final responseFuture = database.execute(query).then((value) {
        choiceQuestionTypes.value = choiceQuestionTypes.value.rebuild((b) => b.add(answerId));
      });
      futures.add(responseFuture);
    }

    await Future.wait(futures);
  }

  @override
  removeChoiceQuestionAnswers({required Set<ChoiceQuestionAnswer> choiceQuestionAnswers}) async {
    if (choiceQuestionAnswers.isEmpty) {
      return;
    }

    final database = await databaseConnection;

    final whereCondition = choiceQuestionAnswers.map((answer) => "id = ${answer.id}").join(" OR ");

    final result = await database.execute("""DELETE FROM public.choice_question_answer WHERE $whereCondition
        Returning id, submission_id, question::text, linked_submission_id, answer::text, parent_id;""");

    final choiceAnswers = ChoiceQuestionAnswer.fromResultList(result);

    vm.choiceQuestionAnswerViewModel.remove(choiceAnswers);

    final payload = jsonEncode({
      "timestamp": vm.choiceQuestionAnswerViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "DELETE",
      "changes": choiceAnswers.map((choiceAnswer) => choiceAnswer.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.choiceQuestionAnswer.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);
  }

  @override
  addConcretisation({required ChoiceQuestionAnswer choiceQuestionAnswer, required ConcretisationValueBase concretisation}) async {
    final database = await databaseConnection;

    final concretisationJson = jsonEncode(serializers.serialize(concretisation));

    final result = await database.execute("""
    INSERT INTO public.concretisation(choice_question_answer_id, concretisation_value)
	  VALUES ('${choiceQuestionAnswer.id}', '$concretisationJson')
    RETURNING id, choice_question_answer_id, order_index, concretisation_value;""");

    final concretisations = Concretisation.fromResultList(result);

    vm.concretisationsViewModel.update(concretisations);

    final payload = jsonEncode({
      "timestamp": vm.concretisationsViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "INSERT",
      "changes": concretisations.map((concretisation) => concretisation.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.concretisation.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);
  }

  @override
  Future<BuiltList<Concretisation>> insertConcretisations({required BuiltSet<Concretisation> concretisations}) async {
    if (concretisations.isEmpty) {
      return BuiltList();
    }

    final database = await databaseConnection;

    final query = """
    INSERT INTO public.concretisation(choice_question_answer_id, concretisation_value)
   	VALUES 
    ${concretisations.map((c) => "(${c.choiceQuestionAnswerId},'${jsonEncode(serializers.serialize(c.concretisationValue))}')").join(",\n")};
    """;

    final result = await database.execute(query);

    final insertedConcretisations = Concretisation.fromResultList(result);

    vm.concretisationsViewModel.update(insertedConcretisations);

    final payload = jsonEncode({
      "timestamp": vm.concretisationsViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "INSERT",
      "changes": concretisations.map((concretisation) => concretisation.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.concretisation.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return insertedConcretisations;
  }

  @override
  deleteConcretisation({required BuiltSet<Concretisation> concretisations}) async {
    if (concretisations.isEmpty) {
      return;
    }

    final database = await databaseConnection;

    final whereCondition = concretisations.map((concretisation) => "id = ${concretisation.id}").join(" OR ");

    final result = await database.execute("""DELETE FROM public.concretisation WHERE $whereCondition
        RETURNING id, choice_question_answer_id, order_index, concretisation_value;""");

    final deletedConcretisations = Concretisation.fromResultList(result);

    vm.concretisationsViewModel.remove(deletedConcretisations);

    final payload = jsonEncode({
      "timestamp": vm.concretisationsViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "DELETE",
      "changes": concretisations.map((concretisation) => concretisation.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.concretisation.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);
  }

  @override
  updateConcretisation(Concretisation concretisation) async {
    final database = await databaseConnection;

    final concretisationJson = jsonEncode(serializers.serialize(concretisation.concretisationValue));

    final result = await database.execute("""
    UPDATE public.concretisation
	  SET concretisation_value='$concretisationJson'
	  WHERE id = '${concretisation.id}'
	  RETURNING id, choice_question_answer_id, order_index, concretisation_value;
    """);

    final concretisations = Concretisation.fromResultList(result);

    vm.concretisationsViewModel.update(concretisations);

    final payload = jsonEncode({
      "timestamp": vm.concretisationsViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "UPDATE",
      "changes": concretisations.map((concretisation) => concretisation.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.concretisation.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);
  }

  @override
  FutureOr<Submission> addSubmission({required Survey survey, required String submissionTitle, required String createdBy}) async {
    final database = await databaseConnection;

    final result = await database.execute("""
    INSERT INTO public.submission(
	  survey_id, title, created_by)
	  VALUES (${survey.id}, '$submissionTitle', '$createdBy')
    RETURNING id, survey_id, title, created_by, created_date""");

    final submissions = Submission.fromResultList(result);

    vm.submissionViewModel.update(submissions);
    final payload = jsonEncode({
      "timestamp": vm.submissionViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "INSERT",
      "changes": submissions.map((submission) => submission.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.submission.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return submissions.first;
  }

  @override
  Future<Submission> updateSubmission({required Submission original, required Submission updates}) async {
    if (original == updates) {
      return original;
    }

    final database = await databaseConnection;

    final query = """
    UPDATE public.submission
	  SET
    ${[
      if (original.surveyId != updates.surveyId) "survey_id=${updates.surveyId}",
      if (original.title != updates.title) "title='${updates.title}'",
      if (original.createdBy != updates.createdBy) "created_by='${updates.createdBy}'",
      if (original.createdDate != updates.createdDate) "created_date=${updates.createdDate}"
    ].join(", ")}
    WHERE id=${original.id}
    RETURNING id, survey_id, title, created_by, created_date;""";

    final result = await database.execute(query);

    final submissions = Submission.fromResultList(result);

    vm.submissionViewModel.update(submissions);

    final payload = jsonEncode({
      "timestamp": vm.submissionViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "UPDATE",
      "changes": submissions.map((submission) => submission.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.submission.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return submissions.first;
  }

  @override
  Future deleteInheritedPropertiesFromSubmission({required SubmissionLink submissionLink}) async {
    final database = await databaseConnection;

    final query = """
  DELETE FROM public.choice_question_answer
  WHERE submission_id = ${submissionLink.childId} AND linked_submission_id = ${submissionLink.parentId}
  RETURNING id, submission_id, question::text, linked_submission_id, answer::text, parent_id;""";

    final result = await database.execute(query);

    final choiceAnswers = ChoiceQuestionAnswer.fromResultList(result);

    vm.choiceQuestionAnswerViewModel.remove(choiceAnswers);
    final payload = jsonEncode({
      "timestamp": vm.choiceQuestionAnswerViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "DELETE",
      "changes": choiceAnswers.map((choiceAnswer) => choiceAnswer.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.choiceQuestionAnswer.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);
  }

  @override
  Future deleteSubmission({required Submission submission}) async {
    final database = await databaseConnection;

    final result = await database.execute("""DELETE FROM public.submission WHERE id = ${submission.id}
        RETURNING  id, survey_id, title, created_by, created_date;""");

    final deletedSubmissions = Submission.fromResultList(result);

    vm.submissionViewModel.remove(deletedSubmissions);

    final payload = jsonEncode({
      "timestamp": vm.submissionViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "DELETE",
      "changes": deletedSubmissions.map((submission) => submission.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.submission.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);
  }

  @override
  addSubmissionLink(
      {required ViewModel vm,
      required Submission submission,
      required SurveyEntryPath path,
      required LinkOtherSurveyQuestion question,
      required Submission linkedSubmission}) async {
    final database = await databaseConnection;

    final choiceQuestionAnswerParent = path.getParentId(submission: submission, vm: vm);

    final query = """
    INSERT INTO public.submission_link(
	  parent_id, child_id, choice_question_answer_parent, relationship)
	  VALUES (${linkedSubmission.id}, ${submission.id}, $choiceQuestionAnswerParent, '${question.id}')
    ON CONFLICT (child_id, relationship) 
    DO UPDATE SET parent_id = ${linkedSubmission.id}, choice_question_answer_parent = ${choiceQuestionAnswerParent ?? "NULL"}
    RETURNING id, parent_id, child_id, choice_question_answer_parent, relationship;""";

    final result = await database.execute(query);

    final submissionLinks = SubmissionLink.fromResultList(result);

    vm.submissionLinkViewModel.update(submissionLinks);
    final payload = jsonEncode({
      "timestamp": vm.submissionLinkViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "INSERT",
      "changes": submissionLinks.map((submissionLink) => submissionLink.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.submissionLink.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return submissionLinks.first;
  }

  @override
  Future<Iterable<SubmissionLink>> insertSubmissionLinks({
    required Iterable<SubmissionLink> submissionLinks,
  }) async {
    if (submissionLinks.isEmpty) {
      return {};
    }

    final database = await databaseConnection;

    final query = """
    INSERT INTO public.submission_link(
	  parent_id, child_id, relationship, choice_question_answer_parent)
	  VALUES 
    ${submissionLinks.map((l) => "(${l.parentId},${l.childId},'${l.relationship}',${l.choiceQuestionAnswerParent})").join(",\n")};
    """;

    final result = await database.execute(query);

    final insertedSubmissionLinks = SubmissionLink.fromResultList(result);

    vm.submissionLinkViewModel.update(insertedSubmissionLinks);
    final payload = jsonEncode({
      "timestamp": vm.submissionLinkViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "INSERT",
      "changes": submissionLinks.map((submissionLink) => submissionLink.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.submissionLink.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return insertedSubmissionLinks;
  }

  @override
  deleteSubmissionLink({required SubmissionLink submissionLink}) async {
    final database = await databaseConnection;

    final result = await database.execute("""DELETE FROM public.submission_link WHERE id = '${submissionLink.id}'
        RETURNING id, parent_id, child_id, choice_question_answer_parent, relationship;""");

    final submissionLinks = SubmissionLink.fromResultList(result);

    vm.submissionLinkViewModel.remove(submissionLinks);
    final payload = jsonEncode({
      "timestamp": vm.submissionLinkViewModel.lastUpdateTimeStamp.toIso8601String(),
      "operation": "DELETE",
      "changes": submissionLinks.map((submissionLink) => submissionLink.toJson()).toList()
    });
    final notifyQuery = "NOTIFY ${NotifyChannel.submissionLink.name}, '$payload'";
    print(notifyQuery);
    await database.execute(notifyQuery);

    return submissionLinks.first;
  }
}
