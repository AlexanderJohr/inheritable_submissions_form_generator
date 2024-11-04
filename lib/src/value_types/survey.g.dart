// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(CheckAllConditions.serializer)
      ..add(Choice.serializer)
      ..add(ChoiceAnswerValidationResult.serializer)
      ..add(ChoiceQuestionAnswer.serializer)
      ..add(ChoiceQuestionHasAnswersButPathIsDisabledError.serializer)
      ..add(ChoiceQuestionHasDuplicateAnswersError.serializer)
      ..add(ChoiceQuestionHasNoAnswersError.serializer)
      ..add(Concretisation.serializer)
      ..add(ContainsAnyOf.serializer)
      ..add(ContainsNoneOf.serializer)
      ..add(DecimalConcretisation.serializer)
      ..add(FreeTextQuestion.serializer)
      ..add(LinkOtherSurveyQuestion.serializer)
      ..add(MengenVorgabeConcretisation.serializer)
      ..add(MultipleChoiceQuestion.serializer)
      ..add(PathIsDisabledButHasAnsweredSubquestionsError.serializer)
      ..add(ReuseSurveyEntry.serializer)
      ..add(SingelChoiceQuestionHasToManyAnswersError.serializer)
      ..add(SingleChoiceQuestion.serializer)
      ..add(Submission.serializer)
      ..add(SubmissionLink.serializer)
      ..add(Survey.serializer)
      ..add(SurveyEntryPath.serializer)
      ..add(SurveyEntryPathElement.serializer)
      ..add(SurveyStructure.serializer)
      ..add(TextConcretisation.serializer)
      ..add(ZeitVorgabeConcretisation.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Choice)]),
          () => new ListBuilder<Choice>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Choice)]),
          () => new ListBuilder<Choice>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Condition)]),
          () => new ListBuilder<Condition>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntry)]),
          () => new ListBuilder<SurveyEntry>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntry)]),
          () => new ListBuilder<SurveyEntry>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntryPath)]),
          () => new ListBuilder<SurveyEntryPath>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntryPath)]),
          () => new ListBuilder<SurveyEntryPath>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntryPath)]),
          () => new ListBuilder<SurveyEntryPath>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntryPath)]),
          () => new ListBuilder<SurveyEntryPath>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntryPath)]),
          () => new ListBuilder<SurveyEntryPath>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntryPath)]),
          () => new ListBuilder<SurveyEntryPath>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(SurveyEntryPathElement)]),
          () => new ListBuilder<SurveyEntryPathElement>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(bool)]),
          () => new MapBuilder<String, bool>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntry)]),
          () => new ListBuilder<SurveyEntry>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(SurveyEntryPath),
            const FullType(BuiltList, const [const FullType(QuestionError)])
          ]),
          () => new MapBuilder<SurveyEntryPath, BuiltList<QuestionError>>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SurveyEntryPath)]),
          () => new ListBuilder<SurveyEntryPath>()))
    .build();
Serializer<SurveyStructure> _$surveyStructureSerializer =
    new _$SurveyStructureSerializer();
Serializer<ReuseSurveyEntry> _$reuseSurveyEntrySerializer =
    new _$ReuseSurveyEntrySerializer();
Serializer<LinkOtherSurveyQuestion> _$linkOtherSurveyQuestionSerializer =
    new _$LinkOtherSurveyQuestionSerializer();
Serializer<Choice> _$choiceSerializer = new _$ChoiceSerializer();
Serializer<SingleChoiceQuestion> _$singleChoiceQuestionSerializer =
    new _$SingleChoiceQuestionSerializer();
Serializer<MultipleChoiceQuestion> _$multipleChoiceQuestionSerializer =
    new _$MultipleChoiceQuestionSerializer();
Serializer<FreeTextQuestion> _$freeTextQuestionSerializer =
    new _$FreeTextQuestionSerializer();
Serializer<CheckAllConditions> _$checkAllConditionsSerializer =
    new _$CheckAllConditionsSerializer();
Serializer<ContainsAnyOf> _$containsAnyOfSerializer =
    new _$ContainsAnyOfSerializer();
Serializer<ContainsNoneOf> _$containsNoneOfSerializer =
    new _$ContainsNoneOfSerializer();
Serializer<Survey> _$surveySerializer = new _$SurveySerializer();
Serializer<Submission> _$submissionSerializer = new _$SubmissionSerializer();
Serializer<SubmissionLink> _$submissionLinkSerializer =
    new _$SubmissionLinkSerializer();
Serializer<ChoiceQuestionAnswer> _$choiceQuestionAnswerSerializer =
    new _$ChoiceQuestionAnswerSerializer();
Serializer<Concretisation> _$concretisationSerializer =
    new _$ConcretisationSerializer();
Serializer<TextConcretisation> _$textConcretisationSerializer =
    new _$TextConcretisationSerializer();
Serializer<DecimalConcretisation> _$decimalConcretisationSerializer =
    new _$DecimalConcretisationSerializer();
Serializer<ZeitVorgabeConcretisation> _$zeitVorgabeConcretisationSerializer =
    new _$ZeitVorgabeConcretisationSerializer();
Serializer<MengenVorgabeConcretisation>
    _$mengenVorgabeConcretisationSerializer =
    new _$MengenVorgabeConcretisationSerializer();
Serializer<SurveyEntryPath> _$surveyEntryPathSerializer =
    new _$SurveyEntryPathSerializer();
Serializer<SurveyEntryPathElement> _$surveyEntryPathElementSerializer =
    new _$SurveyEntryPathElementSerializer();
Serializer<ChoiceAnswerValidationResult>
    _$choiceAnswerValidationResultSerializer =
    new _$ChoiceAnswerValidationResultSerializer();
Serializer<ChoiceQuestionHasNoAnswersError>
    _$choiceQuestionHasNoAnswersErrorSerializer =
    new _$ChoiceQuestionHasNoAnswersErrorSerializer();
Serializer<SingelChoiceQuestionHasToManyAnswersError>
    _$singelChoiceQuestionHasToManyAnswersErrorSerializer =
    new _$SingelChoiceQuestionHasToManyAnswersErrorSerializer();
Serializer<ChoiceQuestionHasDuplicateAnswersError>
    _$choiceQuestionHasDuplicateAnswersErrorSerializer =
    new _$ChoiceQuestionHasDuplicateAnswersErrorSerializer();
Serializer<ChoiceQuestionHasAnswersButPathIsDisabledError>
    _$choiceQuestionHasAnswersButPathIsDisabledErrorSerializer =
    new _$ChoiceQuestionHasAnswersButPathIsDisabledErrorSerializer();
Serializer<PathIsDisabledButHasAnsweredSubquestionsError>
    _$pathIsDisabledButHasAnsweredSubquestionsErrorSerializer =
    new _$PathIsDisabledButHasAnsweredSubquestionsErrorSerializer();

class _$SurveyStructureSerializer
    implements StructuredSerializer<SurveyStructure> {
  @override
  final Iterable<Type> types = const [SurveyStructure, _$SurveyStructure];
  @override
  final String wireName = 'SurveyStructure';

  @override
  Iterable<Object?> serialize(Serializers serializers, SurveyStructure object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'definitions',
      serializers.serialize(object.definitions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SurveyEntry)])),
      'questions',
      serializers.serialize(object.questions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SurveyEntry)])),
    ];

    return result;
  }

  @override
  SurveyStructure deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurveyStructureBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'definitions':
          result.definitions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntry)]))!
              as BuiltList<Object?>);
          break;
        case 'questions':
          result.questions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntry)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ReuseSurveyEntrySerializer
    implements StructuredSerializer<ReuseSurveyEntry> {
  @override
  final Iterable<Type> types = const [ReuseSurveyEntry, _$ReuseSurveyEntry];
  @override
  final String wireName = 'ReuseSurveyEntry';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReuseSurveyEntry object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'reuseId',
      serializers.serialize(object.reuseId,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.allowedConcretisations;
    if (value != null) {
      result
        ..add('allowedConcretisations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(bool)])));
    }
    value = object.enabledIf;
    if (value != null) {
      result
        ..add('enabledIf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Condition)));
    }
    return result;
  }

  @override
  ReuseSurveyEntry deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReuseSurveyEntryBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'reuseId':
          result.reuseId = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'allowedConcretisations':
          result.allowedConcretisations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'enabledIf':
          result.enabledIf = serializers.deserialize(value,
              specifiedType: const FullType(Condition)) as Condition?;
          break;
      }
    }

    return result.build();
  }
}

class _$LinkOtherSurveyQuestionSerializer
    implements StructuredSerializer<LinkOtherSurveyQuestion> {
  @override
  final Iterable<Type> types = const [
    LinkOtherSurveyQuestion,
    _$LinkOtherSurveyQuestion
  ];
  @override
  final String wireName = 'LinkOtherSurveyQuestion';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, LinkOtherSurveyQuestion object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.allowedConcretisations;
    if (value != null) {
      result
        ..add('allowedConcretisations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(bool)])));
    }
    value = object.enabledIf;
    if (value != null) {
      result
        ..add('enabledIf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Condition)));
    }
    return result;
  }

  @override
  LinkOtherSurveyQuestion deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LinkOtherSurveyQuestionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'allowedConcretisations':
          result.allowedConcretisations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'enabledIf':
          result.enabledIf = serializers.deserialize(value,
              specifiedType: const FullType(Condition)) as Condition?;
          break;
      }
    }

    return result.build();
  }
}

class _$ChoiceSerializer implements StructuredSerializer<Choice> {
  @override
  final Iterable<Type> types = const [Choice, _$Choice];
  @override
  final String wireName = 'Choice';

  @override
  Iterable<Object?> serialize(Serializers serializers, Choice object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'subQuestions',
      serializers.serialize(object.subQuestions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(SurveyEntry)])),
    ];
    Object? value;
    value = object.allowedConcretisations;
    if (value != null) {
      result
        ..add('allowedConcretisations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(bool)])));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.enabledIf;
    if (value != null) {
      result
        ..add('enabledIf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Condition)));
    }
    return result;
  }

  @override
  Choice deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChoiceBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'allowedConcretisations':
          result.allowedConcretisations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'subQuestions':
          result.subQuestions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntry)]))!
              as BuiltList<Object?>);
          break;
        case 'enabledIf':
          result.enabledIf = serializers.deserialize(value,
              specifiedType: const FullType(Condition)) as Condition?;
          break;
      }
    }

    return result.build();
  }
}

class _$SingleChoiceQuestionSerializer
    implements StructuredSerializer<SingleChoiceQuestion> {
  @override
  final Iterable<Type> types = const [
    SingleChoiceQuestion,
    _$SingleChoiceQuestion
  ];
  @override
  final String wireName = 'SingleChoiceQuestion';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SingleChoiceQuestion object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'choices',
      serializers.serialize(object.choices,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Choice)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.allowedConcretisations;
    if (value != null) {
      result
        ..add('allowedConcretisations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(bool)])));
    }
    value = object.enabledIf;
    if (value != null) {
      result
        ..add('enabledIf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Condition)));
    }
    return result;
  }

  @override
  SingleChoiceQuestion deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SingleChoiceQuestionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'choices':
          result.choices.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Choice)]))!
              as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'allowedConcretisations':
          result.allowedConcretisations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'enabledIf':
          result.enabledIf = serializers.deserialize(value,
              specifiedType: const FullType(Condition)) as Condition?;
          break;
      }
    }

    return result.build();
  }
}

class _$MultipleChoiceQuestionSerializer
    implements StructuredSerializer<MultipleChoiceQuestion> {
  @override
  final Iterable<Type> types = const [
    MultipleChoiceQuestion,
    _$MultipleChoiceQuestion
  ];
  @override
  final String wireName = 'MultipleChoiceQuestion';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MultipleChoiceQuestion object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'choices',
      serializers.serialize(object.choices,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Choice)])),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.allowedConcretisations;
    if (value != null) {
      result
        ..add('allowedConcretisations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(bool)])));
    }
    value = object.enabledIf;
    if (value != null) {
      result
        ..add('enabledIf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Condition)));
    }
    return result;
  }

  @override
  MultipleChoiceQuestion deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MultipleChoiceQuestionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'choices':
          result.choices.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Choice)]))!
              as BuiltList<Object?>);
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'allowedConcretisations':
          result.allowedConcretisations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'enabledIf':
          result.enabledIf = serializers.deserialize(value,
              specifiedType: const FullType(Condition)) as Condition?;
          break;
      }
    }

    return result.build();
  }
}

class _$FreeTextQuestionSerializer
    implements StructuredSerializer<FreeTextQuestion> {
  @override
  final Iterable<Type> types = const [FreeTextQuestion, _$FreeTextQuestion];
  @override
  final String wireName = 'FreeTextQuestion';

  @override
  Iterable<Object?> serialize(Serializers serializers, FreeTextQuestion object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.allowedConcretisations;
    if (value != null) {
      result
        ..add('allowedConcretisations')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(bool)])));
    }
    value = object.enabledIf;
    if (value != null) {
      result
        ..add('enabledIf')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Condition)));
    }
    return result;
  }

  @override
  FreeTextQuestion deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FreeTextQuestionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'allowedConcretisations':
          result.allowedConcretisations.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(bool)]))!);
          break;
        case 'enabledIf':
          result.enabledIf = serializers.deserialize(value,
              specifiedType: const FullType(Condition)) as Condition?;
          break;
      }
    }

    return result.build();
  }
}

class _$CheckAllConditionsSerializer
    implements StructuredSerializer<CheckAllConditions> {
  @override
  final Iterable<Type> types = const [CheckAllConditions, _$CheckAllConditions];
  @override
  final String wireName = 'CheckAllConditions';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, CheckAllConditions object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'conditions',
      serializers.serialize(object.conditions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Condition)])),
    ];

    return result;
  }

  @override
  CheckAllConditions deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CheckAllConditionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'conditions':
          result.conditions.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Condition)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ContainsAnyOfSerializer implements StructuredSerializer<ContainsAnyOf> {
  @override
  final Iterable<Type> types = const [ContainsAnyOf, _$ContainsAnyOf];
  @override
  final String wireName = 'ContainsAnyOf';

  @override
  Iterable<Object?> serialize(Serializers serializers, ContainsAnyOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(String)),
      'values',
      serializers.serialize(object.values,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  ContainsAnyOf deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContainsAnyOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ContainsNoneOfSerializer
    implements StructuredSerializer<ContainsNoneOf> {
  @override
  final Iterable<Type> types = const [ContainsNoneOf, _$ContainsNoneOf];
  @override
  final String wireName = 'ContainsNoneOf';

  @override
  Iterable<Object?> serialize(Serializers serializers, ContainsNoneOf object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'field',
      serializers.serialize(object.field,
          specifiedType: const FullType(String)),
      'values',
      serializers.serialize(object.values,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  ContainsNoneOf deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ContainsNoneOfBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'field':
          result.field = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'values':
          result.values.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SurveySerializer implements StructuredSerializer<Survey> {
  @override
  final Iterable<Type> types = const [Survey, _$Survey];
  @override
  final String wireName = 'Survey';

  @override
  Iterable<Object?> serialize(Serializers serializers, Survey object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'structure',
      serializers.serialize(object.structure,
          specifiedType: const FullType(SurveyStructure)),
    ];

    return result;
  }

  @override
  Survey deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurveyBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'structure':
          result.structure.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SurveyStructure))!
              as SurveyStructure);
          break;
      }
    }

    return result.build();
  }
}

class _$SubmissionSerializer implements StructuredSerializer<Submission> {
  @override
  final Iterable<Type> types = const [Submission, _$Submission];
  @override
  final String wireName = 'Submission';

  @override
  Iterable<Object?> serialize(Serializers serializers, Submission object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'survey_id',
      serializers.serialize(object.surveyId,
          specifiedType: const FullType(int)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'created_by',
      serializers.serialize(object.createdBy,
          specifiedType: const FullType(String)),
      'created_date',
      serializers.serialize(object.createdDate,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Submission deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubmissionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'survey_id':
          result.surveyId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime))! as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$SubmissionLinkSerializer
    implements StructuredSerializer<SubmissionLink> {
  @override
  final Iterable<Type> types = const [SubmissionLink, _$SubmissionLink];
  @override
  final String wireName = 'SubmissionLink';

  @override
  Iterable<Object?> serialize(Serializers serializers, SubmissionLink object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'parent_id',
      serializers.serialize(object.parentId,
          specifiedType: const FullType(int)),
      'child_id',
      serializers.serialize(object.childId, specifiedType: const FullType(int)),
      'choice_question_answer_parent',
      serializers.serialize(object.choiceQuestionAnswerParent,
          specifiedType: const FullType(int)),
      'relationship',
      serializers.serialize(object.relationship,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SubmissionLink deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubmissionLinkBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'parent_id':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'child_id':
          result.childId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'choice_question_answer_parent':
          result.choiceQuestionAnswerParent = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'relationship':
          result.relationship = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ChoiceQuestionAnswerSerializer
    implements StructuredSerializer<ChoiceQuestionAnswer> {
  @override
  final Iterable<Type> types = const [
    ChoiceQuestionAnswer,
    _$ChoiceQuestionAnswer
  ];
  @override
  final String wireName = 'ChoiceQuestionAnswer';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChoiceQuestionAnswer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'submission_id',
      serializers.serialize(object.submissionId,
          specifiedType: const FullType(int)),
      'question',
      serializers.serialize(object.question,
          specifiedType: const FullType(String)),
      'linked_submission_id',
      serializers.serialize(object.linkedSubmissionId,
          specifiedType: const FullType(int)),
      'answer',
      serializers.serialize(object.answer,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.parentId;
    if (value != null) {
      result
        ..add('parent_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  ChoiceQuestionAnswer deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChoiceQuestionAnswerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'submission_id':
          result.submissionId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'linked_submission_id':
          result.linkedSubmissionId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'parent_id':
          result.parentId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$ConcretisationSerializer
    implements StructuredSerializer<Concretisation> {
  @override
  final Iterable<Type> types = const [Concretisation, _$Concretisation];
  @override
  final String wireName = 'Concretisation';

  @override
  Iterable<Object?> serialize(Serializers serializers, Concretisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'choice_question_answer_id',
      serializers.serialize(object.choiceQuestionAnswerId,
          specifiedType: const FullType(int)),
      'order_index',
      serializers.serialize(object.orderIndex,
          specifiedType: const FullType(int)),
      'concretisation_value',
      serializers.serialize(object.concretisationValue,
          specifiedType: const FullType(ConcretisationValueBase)),
    ];

    return result;
  }

  @override
  Concretisation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConcretisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'choice_question_answer_id':
          result.choiceQuestionAnswerId = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'order_index':
          result.orderIndex = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'concretisation_value':
          result.concretisationValue = serializers.deserialize(value,
                  specifiedType: const FullType(ConcretisationValueBase))!
              as ConcretisationValueBase;
          break;
      }
    }

    return result.build();
  }
}

class _$TextConcretisationSerializer
    implements StructuredSerializer<TextConcretisation> {
  @override
  final Iterable<Type> types = const [TextConcretisation, _$TextConcretisation];
  @override
  final String wireName = 'TextConcretisation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, TextConcretisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  TextConcretisation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TextConcretisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DecimalConcretisationSerializer
    implements StructuredSerializer<DecimalConcretisation> {
  @override
  final Iterable<Type> types = const [
    DecimalConcretisation,
    _$DecimalConcretisation
  ];
  @override
  final String wireName = 'DecimalConcretisation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, DecimalConcretisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'decimal',
      serializers.serialize(object.decimal,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DecimalConcretisation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DecimalConcretisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'decimal':
          result.decimal = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ZeitVorgabeConcretisationSerializer
    implements StructuredSerializer<ZeitVorgabeConcretisation> {
  @override
  final Iterable<Type> types = const [
    ZeitVorgabeConcretisation,
    _$ZeitVorgabeConcretisation
  ];
  @override
  final String wireName = 'ZeitVorgabeConcretisation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ZeitVorgabeConcretisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.vonTag;
    if (value != null) {
      result
        ..add('von_tag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bisTag;
    if (value != null) {
      result
        ..add('bis_tag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vonMonat;
    if (value != null) {
      result
        ..add('von_monat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bisMonat;
    if (value != null) {
      result
        ..add('bis_monat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dauerInStunden;
    if (value != null) {
      result
        ..add('dauer_in_stunden')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.textConcretisation;
    if (value != null) {
      result
        ..add('text_concretisation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ZeitVorgabeConcretisation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ZeitVorgabeConcretisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'von_tag':
          result.vonTag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bis_tag':
          result.bisTag = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'von_monat':
          result.vonMonat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bis_monat':
          result.bisMonat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'dauer_in_stunden':
          result.dauerInStunden = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text_concretisation':
          result.textConcretisation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$MengenVorgabeConcretisationSerializer
    implements StructuredSerializer<MengenVorgabeConcretisation> {
  @override
  final Iterable<Type> types = const [
    MengenVorgabeConcretisation,
    _$MengenVorgabeConcretisation
  ];
  @override
  final String wireName = 'MengenVorgabeConcretisation';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, MengenVorgabeConcretisation object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'zahl_min',
      serializers.serialize(object.zahlMin,
          specifiedType: const FullType(String)),
      'zahl_max',
      serializers.serialize(object.zahlMax,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.vorzeichenMin;
    if (value != null) {
      result
        ..add('vorz_min')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vorzeichenMax;
    if (value != null) {
      result
        ..add('vorz_max')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.zaehler;
    if (value != null) {
      result
        ..add('zaehler')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nenner;
    if (value != null) {
      result
        ..add('nenner')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.textConcretisation;
    if (value != null) {
      result
        ..add('text_concretisation')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  MengenVorgabeConcretisation deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MengenVorgabeConcretisationBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'vorz_min':
          result.vorzeichenMin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zahl_min':
          result.zahlMin = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'vorz_max':
          result.vorzeichenMax = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'zahl_max':
          result.zahlMax = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'zaehler':
          result.zaehler = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nenner':
          result.nenner = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text_concretisation':
          result.textConcretisation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SurveyEntryPathSerializer
    implements StructuredSerializer<SurveyEntryPath> {
  @override
  final Iterable<Type> types = const [SurveyEntryPath, _$SurveyEntryPath];
  @override
  final String wireName = 'SurveyEntryPath';

  @override
  Iterable<Object?> serialize(Serializers serializers, SurveyEntryPath object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'chainElements',
      serializers.serialize(object.chainElements,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPathElement)])),
    ];
    Object? value;
    value = object.leafQuestion;
    if (value != null) {
      result
        ..add('leafQuestion')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SurveyEntryPath deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurveyEntryPathBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chainElements':
          result.chainElements.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(SurveyEntryPathElement)
              ]))! as BuiltList<Object?>);
          break;
        case 'leafQuestion':
          result.leafQuestion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SurveyEntryPathElementSerializer
    implements StructuredSerializer<SurveyEntryPathElement> {
  @override
  final Iterable<Type> types = const [
    SurveyEntryPathElement,
    _$SurveyEntryPathElement
  ];
  @override
  final String wireName = 'SurveyEntryPathElement';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SurveyEntryPathElement object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'question',
      serializers.serialize(object.question,
          specifiedType: const FullType(String)),
      'answer',
      serializers.serialize(object.answer,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  SurveyEntryPathElement deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SurveyEntryPathElementBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'question':
          result.question = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'answer':
          result.answer = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ChoiceAnswerValidationResultSerializer
    implements StructuredSerializer<ChoiceAnswerValidationResult> {
  @override
  final Iterable<Type> types = const [
    ChoiceAnswerValidationResult,
    _$ChoiceAnswerValidationResult
  ];
  @override
  final String wireName = 'ChoiceAnswerValidationResult';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChoiceAnswerValidationResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'errorsByPath',
      serializers.serialize(object.errorsByPath,
          specifiedType: const FullType(BuiltMap, const [
            const FullType(SurveyEntryPath),
            const FullType(BuiltList, const [const FullType(QuestionError)])
          ])),
    ];

    return result;
  }

  @override
  ChoiceAnswerValidationResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChoiceAnswerValidationResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'errorsByPath':
          result.errorsByPath.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(SurveyEntryPath),
                const FullType(BuiltList, const [const FullType(QuestionError)])
              ]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$ChoiceQuestionHasNoAnswersErrorSerializer
    implements StructuredSerializer<ChoiceQuestionHasNoAnswersError> {
  @override
  final Iterable<Type> types = const [
    ChoiceQuestionHasNoAnswersError,
    _$ChoiceQuestionHasNoAnswersError
  ];
  @override
  final String wireName = 'ChoiceQuestionHasNoAnswersError';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChoiceQuestionHasNoAnswersError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'questionTitle',
      serializers.serialize(object.questionTitle,
          specifiedType: const FullType(String)),
      'pathSegments',
      serializers.serialize(object.pathSegments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPath)])),
    ];

    return result;
  }

  @override
  ChoiceQuestionHasNoAnswersError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChoiceQuestionHasNoAnswersErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'questionTitle':
          result.questionTitle = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pathSegments':
          result.pathSegments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntryPath)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SingelChoiceQuestionHasToManyAnswersErrorSerializer
    implements StructuredSerializer<SingelChoiceQuestionHasToManyAnswersError> {
  @override
  final Iterable<Type> types = const [
    SingelChoiceQuestionHasToManyAnswersError,
    _$SingelChoiceQuestionHasToManyAnswersError
  ];
  @override
  final String wireName = 'SingelChoiceQuestionHasToManyAnswersError';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SingelChoiceQuestionHasToManyAnswersError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'questionTitle',
      serializers.serialize(object.questionTitle,
          specifiedType: const FullType(String)),
      'pathSegments',
      serializers.serialize(object.pathSegments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPath)])),
    ];

    return result;
  }

  @override
  SingelChoiceQuestionHasToManyAnswersError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SingelChoiceQuestionHasToManyAnswersErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'questionTitle':
          result.questionTitle = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pathSegments':
          result.pathSegments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntryPath)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ChoiceQuestionHasDuplicateAnswersErrorSerializer
    implements StructuredSerializer<ChoiceQuestionHasDuplicateAnswersError> {
  @override
  final Iterable<Type> types = const [
    ChoiceQuestionHasDuplicateAnswersError,
    _$ChoiceQuestionHasDuplicateAnswersError
  ];
  @override
  final String wireName = 'ChoiceQuestionHasDuplicateAnswersError';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, ChoiceQuestionHasDuplicateAnswersError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'duplicateAnswers',
      serializers.serialize(object.duplicateAnswers,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
      'questionTitle',
      serializers.serialize(object.questionTitle,
          specifiedType: const FullType(String)),
      'pathSegments',
      serializers.serialize(object.pathSegments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPath)])),
    ];

    return result;
  }

  @override
  ChoiceQuestionHasDuplicateAnswersError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChoiceQuestionHasDuplicateAnswersErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'duplicateAnswers':
          result.duplicateAnswers.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
        case 'questionTitle':
          result.questionTitle = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pathSegments':
          result.pathSegments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntryPath)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$ChoiceQuestionHasAnswersButPathIsDisabledErrorSerializer
    implements
        StructuredSerializer<ChoiceQuestionHasAnswersButPathIsDisabledError> {
  @override
  final Iterable<Type> types = const [
    ChoiceQuestionHasAnswersButPathIsDisabledError,
    _$ChoiceQuestionHasAnswersButPathIsDisabledError
  ];
  @override
  final String wireName = 'ChoiceQuestionHasAnswersButPathIsDisabledError';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      ChoiceQuestionHasAnswersButPathIsDisabledError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'disabledPathSegments',
      serializers.serialize(object.disabledPathSegments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPath)])),
      'questionTitle',
      serializers.serialize(object.questionTitle,
          specifiedType: const FullType(String)),
      'pathSegments',
      serializers.serialize(object.pathSegments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPath)])),
    ];

    return result;
  }

  @override
  ChoiceQuestionHasAnswersButPathIsDisabledError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'disabledPathSegments':
          result.disabledPathSegments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntryPath)]))!
              as BuiltList<Object?>);
          break;
        case 'questionTitle':
          result.questionTitle = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pathSegments':
          result.pathSegments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntryPath)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PathIsDisabledButHasAnsweredSubquestionsErrorSerializer
    implements
        StructuredSerializer<PathIsDisabledButHasAnsweredSubquestionsError> {
  @override
  final Iterable<Type> types = const [
    PathIsDisabledButHasAnsweredSubquestionsError,
    _$PathIsDisabledButHasAnsweredSubquestionsError
  ];
  @override
  final String wireName = 'PathIsDisabledButHasAnsweredSubquestionsError';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      PathIsDisabledButHasAnsweredSubquestionsError object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'subQuestionPath',
      serializers.serialize(object.subQuestionPath,
          specifiedType: const FullType(SurveyEntryPath)),
      'disabledPathSegments',
      serializers.serialize(object.disabledPathSegments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPath)])),
      'questionTitle',
      serializers.serialize(object.questionTitle,
          specifiedType: const FullType(String)),
      'pathSegments',
      serializers.serialize(object.pathSegments,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SurveyEntryPath)])),
    ];

    return result;
  }

  @override
  PathIsDisabledButHasAnsweredSubquestionsError deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PathIsDisabledButHasAnsweredSubquestionsErrorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'subQuestionPath':
          result.subQuestionPath.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SurveyEntryPath))!
              as SurveyEntryPath);
          break;
        case 'disabledPathSegments':
          result.disabledPathSegments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntryPath)]))!
              as BuiltList<Object?>);
          break;
        case 'questionTitle':
          result.questionTitle = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pathSegments':
          result.pathSegments.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SurveyEntryPath)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$SurveyStructure extends SurveyStructure {
  @override
  final BuiltList<SurveyEntry> definitions;
  @override
  final BuiltList<SurveyEntry> questions;

  factory _$SurveyStructure([void Function(SurveyStructureBuilder)? updates]) =>
      (new SurveyStructureBuilder()..update(updates))._build();

  _$SurveyStructure._({required this.definitions, required this.questions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        definitions, r'SurveyStructure', 'definitions');
    BuiltValueNullFieldError.checkNotNull(
        questions, r'SurveyStructure', 'questions');
  }

  @override
  SurveyStructure rebuild(void Function(SurveyStructureBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurveyStructureBuilder toBuilder() =>
      new SurveyStructureBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SurveyStructure &&
        definitions == other.definitions &&
        questions == other.questions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, definitions.hashCode);
    _$hash = $jc(_$hash, questions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SurveyStructure')
          ..add('definitions', definitions)
          ..add('questions', questions))
        .toString();
  }
}

class SurveyStructureBuilder
    implements Builder<SurveyStructure, SurveyStructureBuilder> {
  _$SurveyStructure? _$v;

  ListBuilder<SurveyEntry>? _definitions;
  ListBuilder<SurveyEntry> get definitions =>
      _$this._definitions ??= new ListBuilder<SurveyEntry>();
  set definitions(ListBuilder<SurveyEntry>? definitions) =>
      _$this._definitions = definitions;

  ListBuilder<SurveyEntry>? _questions;
  ListBuilder<SurveyEntry> get questions =>
      _$this._questions ??= new ListBuilder<SurveyEntry>();
  set questions(ListBuilder<SurveyEntry>? questions) =>
      _$this._questions = questions;

  SurveyStructureBuilder();

  SurveyStructureBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _definitions = $v.definitions.toBuilder();
      _questions = $v.questions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SurveyStructure other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SurveyStructure;
  }

  @override
  void update(void Function(SurveyStructureBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SurveyStructure build() => _build();

  _$SurveyStructure _build() {
    _$SurveyStructure _$result;
    try {
      _$result = _$v ??
          new _$SurveyStructure._(
              definitions: definitions.build(), questions: questions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'definitions';
        definitions.build();
        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SurveyStructure', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class DisableableBuilder {
  void replace(Disableable other);
  void update(void Function(DisableableBuilder) updates);
  Condition? get enabledIf;
  set enabledIf(Condition? enabledIf);
}

abstract mixin class SurveyEntryBuilder implements DisableableBuilder {
  void replace(covariant SurveyEntry other);
  void update(void Function(SurveyEntryBuilder) updates);
  MapBuilder<String, bool> get allowedConcretisations;
  set allowedConcretisations(
      covariant MapBuilder<String, bool>? allowedConcretisations);

  Condition? get enabledIf;
  set enabledIf(covariant Condition? enabledIf);
}

class _$ReuseSurveyEntry extends ReuseSurveyEntry {
  @override
  final String reuseId;
  @override
  final BuiltMap<String, bool>? allowedConcretisations;
  @override
  final Condition? enabledIf;

  factory _$ReuseSurveyEntry(
          [void Function(ReuseSurveyEntryBuilder)? updates]) =>
      (new ReuseSurveyEntryBuilder()..update(updates))._build();

  _$ReuseSurveyEntry._(
      {required this.reuseId, this.allowedConcretisations, this.enabledIf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        reuseId, r'ReuseSurveyEntry', 'reuseId');
  }

  @override
  ReuseSurveyEntry rebuild(void Function(ReuseSurveyEntryBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReuseSurveyEntryBuilder toBuilder() =>
      new ReuseSurveyEntryBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReuseSurveyEntry &&
        reuseId == other.reuseId &&
        allowedConcretisations == other.allowedConcretisations &&
        enabledIf == other.enabledIf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reuseId.hashCode);
    _$hash = $jc(_$hash, allowedConcretisations.hashCode);
    _$hash = $jc(_$hash, enabledIf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReuseSurveyEntry')
          ..add('reuseId', reuseId)
          ..add('allowedConcretisations', allowedConcretisations)
          ..add('enabledIf', enabledIf))
        .toString();
  }
}

class ReuseSurveyEntryBuilder
    implements
        Builder<ReuseSurveyEntry, ReuseSurveyEntryBuilder>,
        SurveyEntryBuilder {
  _$ReuseSurveyEntry? _$v;

  String? _reuseId;
  String? get reuseId => _$this._reuseId;
  set reuseId(covariant String? reuseId) => _$this._reuseId = reuseId;

  MapBuilder<String, bool>? _allowedConcretisations;
  MapBuilder<String, bool> get allowedConcretisations =>
      _$this._allowedConcretisations ??= new MapBuilder<String, bool>();
  set allowedConcretisations(
          covariant MapBuilder<String, bool>? allowedConcretisations) =>
      _$this._allowedConcretisations = allowedConcretisations;

  Condition? _enabledIf;
  Condition? get enabledIf => _$this._enabledIf;
  set enabledIf(covariant Condition? enabledIf) =>
      _$this._enabledIf = enabledIf;

  ReuseSurveyEntryBuilder();

  ReuseSurveyEntryBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reuseId = $v.reuseId;
      _allowedConcretisations = $v.allowedConcretisations?.toBuilder();
      _enabledIf = $v.enabledIf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ReuseSurveyEntry other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReuseSurveyEntry;
  }

  @override
  void update(void Function(ReuseSurveyEntryBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReuseSurveyEntry build() => _build();

  _$ReuseSurveyEntry _build() {
    _$ReuseSurveyEntry _$result;
    try {
      _$result = _$v ??
          new _$ReuseSurveyEntry._(
              reuseId: BuiltValueNullFieldError.checkNotNull(
                  reuseId, r'ReuseSurveyEntry', 'reuseId'),
              allowedConcretisations: _allowedConcretisations?.build(),
              enabledIf: enabledIf);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allowedConcretisations';
        _allowedConcretisations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReuseSurveyEntry', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class QuestionBuilder implements SurveyEntryBuilder {
  void replace(covariant Question other);
  void update(void Function(QuestionBuilder) updates);
  String? get id;
  set id(covariant String? id);

  String? get title;
  set title(covariant String? title);

  String? get description;
  set description(covariant String? description);

  MapBuilder<String, bool> get allowedConcretisations;
  set allowedConcretisations(
      covariant MapBuilder<String, bool>? allowedConcretisations);

  Condition? get enabledIf;
  set enabledIf(covariant Condition? enabledIf);
}

class _$LinkOtherSurveyQuestion extends LinkOtherSurveyQuestion {
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final BuiltMap<String, bool>? allowedConcretisations;
  @override
  final Condition? enabledIf;

  factory _$LinkOtherSurveyQuestion(
          [void Function(LinkOtherSurveyQuestionBuilder)? updates]) =>
      (new LinkOtherSurveyQuestionBuilder()..update(updates))._build();

  _$LinkOtherSurveyQuestion._(
      {required this.id,
      required this.title,
      this.description,
      this.allowedConcretisations,
      this.enabledIf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'LinkOtherSurveyQuestion', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'LinkOtherSurveyQuestion', 'title');
  }

  @override
  LinkOtherSurveyQuestion rebuild(
          void Function(LinkOtherSurveyQuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LinkOtherSurveyQuestionBuilder toBuilder() =>
      new LinkOtherSurveyQuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LinkOtherSurveyQuestion &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        allowedConcretisations == other.allowedConcretisations &&
        enabledIf == other.enabledIf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, allowedConcretisations.hashCode);
    _$hash = $jc(_$hash, enabledIf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LinkOtherSurveyQuestion')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('allowedConcretisations', allowedConcretisations)
          ..add('enabledIf', enabledIf))
        .toString();
  }
}

class LinkOtherSurveyQuestionBuilder
    implements
        Builder<LinkOtherSurveyQuestion, LinkOtherSurveyQuestionBuilder>,
        QuestionBuilder {
  _$LinkOtherSurveyQuestion? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  MapBuilder<String, bool>? _allowedConcretisations;
  MapBuilder<String, bool> get allowedConcretisations =>
      _$this._allowedConcretisations ??= new MapBuilder<String, bool>();
  set allowedConcretisations(
          covariant MapBuilder<String, bool>? allowedConcretisations) =>
      _$this._allowedConcretisations = allowedConcretisations;

  Condition? _enabledIf;
  Condition? get enabledIf => _$this._enabledIf;
  set enabledIf(covariant Condition? enabledIf) =>
      _$this._enabledIf = enabledIf;

  LinkOtherSurveyQuestionBuilder();

  LinkOtherSurveyQuestionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _allowedConcretisations = $v.allowedConcretisations?.toBuilder();
      _enabledIf = $v.enabledIf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant LinkOtherSurveyQuestion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LinkOtherSurveyQuestion;
  }

  @override
  void update(void Function(LinkOtherSurveyQuestionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LinkOtherSurveyQuestion build() => _build();

  _$LinkOtherSurveyQuestion _build() {
    _$LinkOtherSurveyQuestion _$result;
    try {
      _$result = _$v ??
          new _$LinkOtherSurveyQuestion._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'LinkOtherSurveyQuestion', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'LinkOtherSurveyQuestion', 'title'),
              description: description,
              allowedConcretisations: _allowedConcretisations?.build(),
              enabledIf: enabledIf);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allowedConcretisations';
        _allowedConcretisations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LinkOtherSurveyQuestion', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ChoiceQuestionBuilder implements QuestionBuilder {
  void replace(covariant ChoiceQuestion other);
  void update(void Function(ChoiceQuestionBuilder) updates);
  ListBuilder<Choice> get choices;
  set choices(covariant ListBuilder<Choice>? choices);

  String? get id;
  set id(covariant String? id);

  String? get title;
  set title(covariant String? title);

  String? get description;
  set description(covariant String? description);

  MapBuilder<String, bool> get allowedConcretisations;
  set allowedConcretisations(
      covariant MapBuilder<String, bool>? allowedConcretisations);

  Condition? get enabledIf;
  set enabledIf(covariant Condition? enabledIf);
}

class _$Choice extends Choice {
  @override
  final BuiltMap<String, bool>? allowedConcretisations;
  @override
  final String value;
  @override
  final String title;
  @override
  final String? description;
  @override
  final BuiltList<SurveyEntry> subQuestions;
  @override
  final Condition? enabledIf;

  factory _$Choice([void Function(ChoiceBuilder)? updates]) =>
      (new ChoiceBuilder()..update(updates))._build();

  _$Choice._(
      {this.allowedConcretisations,
      required this.value,
      required this.title,
      this.description,
      required this.subQuestions,
      this.enabledIf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(value, r'Choice', 'value');
    BuiltValueNullFieldError.checkNotNull(title, r'Choice', 'title');
    BuiltValueNullFieldError.checkNotNull(
        subQuestions, r'Choice', 'subQuestions');
  }

  @override
  Choice rebuild(void Function(ChoiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChoiceBuilder toBuilder() => new ChoiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Choice &&
        allowedConcretisations == other.allowedConcretisations &&
        value == other.value &&
        title == other.title &&
        description == other.description &&
        subQuestions == other.subQuestions &&
        enabledIf == other.enabledIf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, allowedConcretisations.hashCode);
    _$hash = $jc(_$hash, value.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, subQuestions.hashCode);
    _$hash = $jc(_$hash, enabledIf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Choice')
          ..add('allowedConcretisations', allowedConcretisations)
          ..add('value', value)
          ..add('title', title)
          ..add('description', description)
          ..add('subQuestions', subQuestions)
          ..add('enabledIf', enabledIf))
        .toString();
  }
}

class ChoiceBuilder
    implements Builder<Choice, ChoiceBuilder>, DisableableBuilder {
  _$Choice? _$v;

  MapBuilder<String, bool>? _allowedConcretisations;
  MapBuilder<String, bool> get allowedConcretisations =>
      _$this._allowedConcretisations ??= new MapBuilder<String, bool>();
  set allowedConcretisations(
          covariant MapBuilder<String, bool>? allowedConcretisations) =>
      _$this._allowedConcretisations = allowedConcretisations;

  String? _value;
  String? get value => _$this._value;
  set value(covariant String? value) => _$this._value = value;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  ListBuilder<SurveyEntry>? _subQuestions;
  ListBuilder<SurveyEntry> get subQuestions =>
      _$this._subQuestions ??= new ListBuilder<SurveyEntry>();
  set subQuestions(covariant ListBuilder<SurveyEntry>? subQuestions) =>
      _$this._subQuestions = subQuestions;

  Condition? _enabledIf;
  Condition? get enabledIf => _$this._enabledIf;
  set enabledIf(covariant Condition? enabledIf) =>
      _$this._enabledIf = enabledIf;

  ChoiceBuilder();

  ChoiceBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _allowedConcretisations = $v.allowedConcretisations?.toBuilder();
      _value = $v.value;
      _title = $v.title;
      _description = $v.description;
      _subQuestions = $v.subQuestions.toBuilder();
      _enabledIf = $v.enabledIf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Choice other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Choice;
  }

  @override
  void update(void Function(ChoiceBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Choice build() => _build();

  _$Choice _build() {
    _$Choice _$result;
    try {
      _$result = _$v ??
          new _$Choice._(
              allowedConcretisations: _allowedConcretisations?.build(),
              value: BuiltValueNullFieldError.checkNotNull(
                  value, r'Choice', 'value'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'Choice', 'title'),
              description: description,
              subQuestions: subQuestions.build(),
              enabledIf: enabledIf);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allowedConcretisations';
        _allowedConcretisations?.build();

        _$failedField = 'subQuestions';
        subQuestions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Choice', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SingleChoiceQuestion extends SingleChoiceQuestion {
  @override
  final BuiltList<Choice> choices;
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final BuiltMap<String, bool>? allowedConcretisations;
  @override
  final Condition? enabledIf;

  factory _$SingleChoiceQuestion(
          [void Function(SingleChoiceQuestionBuilder)? updates]) =>
      (new SingleChoiceQuestionBuilder()..update(updates))._build();

  _$SingleChoiceQuestion._(
      {required this.choices,
      required this.id,
      required this.title,
      this.description,
      this.allowedConcretisations,
      this.enabledIf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        choices, r'SingleChoiceQuestion', 'choices');
    BuiltValueNullFieldError.checkNotNull(id, r'SingleChoiceQuestion', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'SingleChoiceQuestion', 'title');
  }

  @override
  SingleChoiceQuestion rebuild(
          void Function(SingleChoiceQuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingleChoiceQuestionBuilder toBuilder() =>
      new SingleChoiceQuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingleChoiceQuestion &&
        choices == other.choices &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        allowedConcretisations == other.allowedConcretisations &&
        enabledIf == other.enabledIf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, choices.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, allowedConcretisations.hashCode);
    _$hash = $jc(_$hash, enabledIf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SingleChoiceQuestion')
          ..add('choices', choices)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('allowedConcretisations', allowedConcretisations)
          ..add('enabledIf', enabledIf))
        .toString();
  }
}

class SingleChoiceQuestionBuilder
    implements
        Builder<SingleChoiceQuestion, SingleChoiceQuestionBuilder>,
        ChoiceQuestionBuilder {
  _$SingleChoiceQuestion? _$v;

  ListBuilder<Choice>? _choices;
  ListBuilder<Choice> get choices =>
      _$this._choices ??= new ListBuilder<Choice>();
  set choices(covariant ListBuilder<Choice>? choices) =>
      _$this._choices = choices;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  MapBuilder<String, bool>? _allowedConcretisations;
  MapBuilder<String, bool> get allowedConcretisations =>
      _$this._allowedConcretisations ??= new MapBuilder<String, bool>();
  set allowedConcretisations(
          covariant MapBuilder<String, bool>? allowedConcretisations) =>
      _$this._allowedConcretisations = allowedConcretisations;

  Condition? _enabledIf;
  Condition? get enabledIf => _$this._enabledIf;
  set enabledIf(covariant Condition? enabledIf) =>
      _$this._enabledIf = enabledIf;

  SingleChoiceQuestionBuilder();

  SingleChoiceQuestionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _choices = $v.choices.toBuilder();
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _allowedConcretisations = $v.allowedConcretisations?.toBuilder();
      _enabledIf = $v.enabledIf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SingleChoiceQuestion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingleChoiceQuestion;
  }

  @override
  void update(void Function(SingleChoiceQuestionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SingleChoiceQuestion build() => _build();

  _$SingleChoiceQuestion _build() {
    _$SingleChoiceQuestion _$result;
    try {
      _$result = _$v ??
          new _$SingleChoiceQuestion._(
              choices: choices.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'SingleChoiceQuestion', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'SingleChoiceQuestion', 'title'),
              description: description,
              allowedConcretisations: _allowedConcretisations?.build(),
              enabledIf: enabledIf);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'choices';
        choices.build();

        _$failedField = 'allowedConcretisations';
        _allowedConcretisations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SingleChoiceQuestion', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$MultipleChoiceQuestion extends MultipleChoiceQuestion {
  @override
  final BuiltList<Choice> choices;
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final BuiltMap<String, bool>? allowedConcretisations;
  @override
  final Condition? enabledIf;

  factory _$MultipleChoiceQuestion(
          [void Function(MultipleChoiceQuestionBuilder)? updates]) =>
      (new MultipleChoiceQuestionBuilder()..update(updates))._build();

  _$MultipleChoiceQuestion._(
      {required this.choices,
      required this.id,
      required this.title,
      this.description,
      this.allowedConcretisations,
      this.enabledIf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        choices, r'MultipleChoiceQuestion', 'choices');
    BuiltValueNullFieldError.checkNotNull(id, r'MultipleChoiceQuestion', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'MultipleChoiceQuestion', 'title');
  }

  @override
  MultipleChoiceQuestion rebuild(
          void Function(MultipleChoiceQuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MultipleChoiceQuestionBuilder toBuilder() =>
      new MultipleChoiceQuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MultipleChoiceQuestion &&
        choices == other.choices &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        allowedConcretisations == other.allowedConcretisations &&
        enabledIf == other.enabledIf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, choices.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, allowedConcretisations.hashCode);
    _$hash = $jc(_$hash, enabledIf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MultipleChoiceQuestion')
          ..add('choices', choices)
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('allowedConcretisations', allowedConcretisations)
          ..add('enabledIf', enabledIf))
        .toString();
  }
}

class MultipleChoiceQuestionBuilder
    implements
        Builder<MultipleChoiceQuestion, MultipleChoiceQuestionBuilder>,
        ChoiceQuestionBuilder {
  _$MultipleChoiceQuestion? _$v;

  ListBuilder<Choice>? _choices;
  ListBuilder<Choice> get choices =>
      _$this._choices ??= new ListBuilder<Choice>();
  set choices(covariant ListBuilder<Choice>? choices) =>
      _$this._choices = choices;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  MapBuilder<String, bool>? _allowedConcretisations;
  MapBuilder<String, bool> get allowedConcretisations =>
      _$this._allowedConcretisations ??= new MapBuilder<String, bool>();
  set allowedConcretisations(
          covariant MapBuilder<String, bool>? allowedConcretisations) =>
      _$this._allowedConcretisations = allowedConcretisations;

  Condition? _enabledIf;
  Condition? get enabledIf => _$this._enabledIf;
  set enabledIf(covariant Condition? enabledIf) =>
      _$this._enabledIf = enabledIf;

  MultipleChoiceQuestionBuilder();

  MultipleChoiceQuestionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _choices = $v.choices.toBuilder();
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _allowedConcretisations = $v.allowedConcretisations?.toBuilder();
      _enabledIf = $v.enabledIf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MultipleChoiceQuestion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MultipleChoiceQuestion;
  }

  @override
  void update(void Function(MultipleChoiceQuestionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MultipleChoiceQuestion build() => _build();

  _$MultipleChoiceQuestion _build() {
    _$MultipleChoiceQuestion _$result;
    try {
      _$result = _$v ??
          new _$MultipleChoiceQuestion._(
              choices: choices.build(),
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'MultipleChoiceQuestion', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'MultipleChoiceQuestion', 'title'),
              description: description,
              allowedConcretisations: _allowedConcretisations?.build(),
              enabledIf: enabledIf);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'choices';
        choices.build();

        _$failedField = 'allowedConcretisations';
        _allowedConcretisations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'MultipleChoiceQuestion', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$FreeTextQuestion extends FreeTextQuestion {
  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final BuiltMap<String, bool>? allowedConcretisations;
  @override
  final Condition? enabledIf;

  factory _$FreeTextQuestion(
          [void Function(FreeTextQuestionBuilder)? updates]) =>
      (new FreeTextQuestionBuilder()..update(updates))._build();

  _$FreeTextQuestion._(
      {required this.id,
      required this.title,
      this.description,
      this.allowedConcretisations,
      this.enabledIf})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'FreeTextQuestion', 'id');
    BuiltValueNullFieldError.checkNotNull(title, r'FreeTextQuestion', 'title');
  }

  @override
  FreeTextQuestion rebuild(void Function(FreeTextQuestionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FreeTextQuestionBuilder toBuilder() =>
      new FreeTextQuestionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FreeTextQuestion &&
        id == other.id &&
        title == other.title &&
        description == other.description &&
        allowedConcretisations == other.allowedConcretisations &&
        enabledIf == other.enabledIf;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, allowedConcretisations.hashCode);
    _$hash = $jc(_$hash, enabledIf.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'FreeTextQuestion')
          ..add('id', id)
          ..add('title', title)
          ..add('description', description)
          ..add('allowedConcretisations', allowedConcretisations)
          ..add('enabledIf', enabledIf))
        .toString();
  }
}

class FreeTextQuestionBuilder
    implements
        Builder<FreeTextQuestion, FreeTextQuestionBuilder>,
        QuestionBuilder {
  _$FreeTextQuestion? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(covariant String? description) =>
      _$this._description = description;

  MapBuilder<String, bool>? _allowedConcretisations;
  MapBuilder<String, bool> get allowedConcretisations =>
      _$this._allowedConcretisations ??= new MapBuilder<String, bool>();
  set allowedConcretisations(
          covariant MapBuilder<String, bool>? allowedConcretisations) =>
      _$this._allowedConcretisations = allowedConcretisations;

  Condition? _enabledIf;
  Condition? get enabledIf => _$this._enabledIf;
  set enabledIf(covariant Condition? enabledIf) =>
      _$this._enabledIf = enabledIf;

  FreeTextQuestionBuilder();

  FreeTextQuestionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _description = $v.description;
      _allowedConcretisations = $v.allowedConcretisations?.toBuilder();
      _enabledIf = $v.enabledIf;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant FreeTextQuestion other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$FreeTextQuestion;
  }

  @override
  void update(void Function(FreeTextQuestionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  FreeTextQuestion build() => _build();

  _$FreeTextQuestion _build() {
    _$FreeTextQuestion _$result;
    try {
      _$result = _$v ??
          new _$FreeTextQuestion._(
              id: BuiltValueNullFieldError.checkNotNull(
                  id, r'FreeTextQuestion', 'id'),
              title: BuiltValueNullFieldError.checkNotNull(
                  title, r'FreeTextQuestion', 'title'),
              description: description,
              allowedConcretisations: _allowedConcretisations?.build(),
              enabledIf: enabledIf);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'allowedConcretisations';
        _allowedConcretisations?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'FreeTextQuestion', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ConditionBuilder {
  void replace(Condition other);
  void update(void Function(ConditionBuilder) updates);
}

class _$CheckAllConditions extends CheckAllConditions {
  @override
  final BuiltList<Condition> conditions;

  factory _$CheckAllConditions(
          [void Function(CheckAllConditionsBuilder)? updates]) =>
      (new CheckAllConditionsBuilder()..update(updates))._build();

  _$CheckAllConditions._({required this.conditions}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        conditions, r'CheckAllConditions', 'conditions');
  }

  @override
  CheckAllConditions rebuild(
          void Function(CheckAllConditionsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CheckAllConditionsBuilder toBuilder() =>
      new CheckAllConditionsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CheckAllConditions && conditions == other.conditions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, conditions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CheckAllConditions')
          ..add('conditions', conditions))
        .toString();
  }
}

class CheckAllConditionsBuilder
    implements
        Builder<CheckAllConditions, CheckAllConditionsBuilder>,
        ConditionBuilder {
  _$CheckAllConditions? _$v;

  ListBuilder<Condition>? _conditions;
  ListBuilder<Condition> get conditions =>
      _$this._conditions ??= new ListBuilder<Condition>();
  set conditions(covariant ListBuilder<Condition>? conditions) =>
      _$this._conditions = conditions;

  CheckAllConditionsBuilder();

  CheckAllConditionsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _conditions = $v.conditions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant CheckAllConditions other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CheckAllConditions;
  }

  @override
  void update(void Function(CheckAllConditionsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CheckAllConditions build() => _build();

  _$CheckAllConditions _build() {
    _$CheckAllConditions _$result;
    try {
      _$result =
          _$v ?? new _$CheckAllConditions._(conditions: conditions.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'conditions';
        conditions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CheckAllConditions', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class FieldContainsValuesConditionBuilder
    implements ConditionBuilder {
  void replace(covariant FieldContainsValuesCondition other);
  void update(void Function(FieldContainsValuesConditionBuilder) updates);
  String? get field;
  set field(covariant String? field);

  SetBuilder<String> get values;
  set values(covariant SetBuilder<String>? values);
}

class _$ContainsAnyOf extends ContainsAnyOf {
  @override
  final String field;
  @override
  final BuiltSet<String> values;

  factory _$ContainsAnyOf([void Function(ContainsAnyOfBuilder)? updates]) =>
      (new ContainsAnyOfBuilder()..update(updates))._build();

  _$ContainsAnyOf._({required this.field, required this.values}) : super._() {
    BuiltValueNullFieldError.checkNotNull(field, r'ContainsAnyOf', 'field');
    BuiltValueNullFieldError.checkNotNull(values, r'ContainsAnyOf', 'values');
  }

  @override
  ContainsAnyOf rebuild(void Function(ContainsAnyOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContainsAnyOfBuilder toBuilder() => new ContainsAnyOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContainsAnyOf &&
        field == other.field &&
        values == other.values;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContainsAnyOf')
          ..add('field', field)
          ..add('values', values))
        .toString();
  }
}

class ContainsAnyOfBuilder
    implements
        Builder<ContainsAnyOf, ContainsAnyOfBuilder>,
        FieldContainsValuesConditionBuilder {
  _$ContainsAnyOf? _$v;

  String? _field;
  String? get field => _$this._field;
  set field(covariant String? field) => _$this._field = field;

  SetBuilder<String>? _values;
  SetBuilder<String> get values => _$this._values ??= new SetBuilder<String>();
  set values(covariant SetBuilder<String>? values) => _$this._values = values;

  ContainsAnyOfBuilder();

  ContainsAnyOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _values = $v.values.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ContainsAnyOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContainsAnyOf;
  }

  @override
  void update(void Function(ContainsAnyOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContainsAnyOf build() => _build();

  _$ContainsAnyOf _build() {
    _$ContainsAnyOf _$result;
    try {
      _$result = _$v ??
          new _$ContainsAnyOf._(
              field: BuiltValueNullFieldError.checkNotNull(
                  field, r'ContainsAnyOf', 'field'),
              values: values.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        values.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ContainsAnyOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ContainsNoneOf extends ContainsNoneOf {
  @override
  final String field;
  @override
  final BuiltSet<String> values;

  factory _$ContainsNoneOf([void Function(ContainsNoneOfBuilder)? updates]) =>
      (new ContainsNoneOfBuilder()..update(updates))._build();

  _$ContainsNoneOf._({required this.field, required this.values}) : super._() {
    BuiltValueNullFieldError.checkNotNull(field, r'ContainsNoneOf', 'field');
    BuiltValueNullFieldError.checkNotNull(values, r'ContainsNoneOf', 'values');
  }

  @override
  ContainsNoneOf rebuild(void Function(ContainsNoneOfBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ContainsNoneOfBuilder toBuilder() =>
      new ContainsNoneOfBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ContainsNoneOf &&
        field == other.field &&
        values == other.values;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jc(_$hash, values.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ContainsNoneOf')
          ..add('field', field)
          ..add('values', values))
        .toString();
  }
}

class ContainsNoneOfBuilder
    implements
        Builder<ContainsNoneOf, ContainsNoneOfBuilder>,
        FieldContainsValuesConditionBuilder {
  _$ContainsNoneOf? _$v;

  String? _field;
  String? get field => _$this._field;
  set field(covariant String? field) => _$this._field = field;

  SetBuilder<String>? _values;
  SetBuilder<String> get values => _$this._values ??= new SetBuilder<String>();
  set values(covariant SetBuilder<String>? values) => _$this._values = values;

  ContainsNoneOfBuilder();

  ContainsNoneOfBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _values = $v.values.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ContainsNoneOf other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ContainsNoneOf;
  }

  @override
  void update(void Function(ContainsNoneOfBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ContainsNoneOf build() => _build();

  _$ContainsNoneOf _build() {
    _$ContainsNoneOf _$result;
    try {
      _$result = _$v ??
          new _$ContainsNoneOf._(
              field: BuiltValueNullFieldError.checkNotNull(
                  field, r'ContainsNoneOf', 'field'),
              values: values.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'values';
        values.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ContainsNoneOf', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class SurveyEntryInputBuilder {
  void replace(SurveyEntryInput other);
  void update(void Function(SurveyEntryInputBuilder) updates);
  String? get id;
  set id(String? id);
}

class _$Survey extends Survey {
  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final SurveyStructure structure;
  Map<String, Question>? __reuseableQuestionsMap;
  QuestionsAndChoicesByPath? __questionsAndChoicesByPath;

  factory _$Survey([void Function(SurveyBuilder)? updates]) =>
      (new SurveyBuilder()..update(updates))._build();

  _$Survey._(
      {required this.id,
      required this.name,
      required this.description,
      required this.structure})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Survey', 'id');
    BuiltValueNullFieldError.checkNotNull(name, r'Survey', 'name');
    BuiltValueNullFieldError.checkNotNull(
        description, r'Survey', 'description');
    BuiltValueNullFieldError.checkNotNull(structure, r'Survey', 'structure');
  }

  @override
  Map<String, Question> get reuseableQuestionsMap =>
      __reuseableQuestionsMap ??= super.reuseableQuestionsMap;

  @override
  QuestionsAndChoicesByPath get questionsAndChoicesByPath =>
      __questionsAndChoicesByPath ??= super.questionsAndChoicesByPath;

  @override
  Survey rebuild(void Function(SurveyBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurveyBuilder toBuilder() => new SurveyBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Survey &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        structure == other.structure;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, structure.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Survey')
          ..add('id', id)
          ..add('name', name)
          ..add('description', description)
          ..add('structure', structure))
        .toString();
  }
}

class SurveyBuilder implements Builder<Survey, SurveyBuilder> {
  _$Survey? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  SurveyStructureBuilder? _structure;
  SurveyStructureBuilder get structure =>
      _$this._structure ??= new SurveyStructureBuilder();
  set structure(SurveyStructureBuilder? structure) =>
      _$this._structure = structure;

  SurveyBuilder();

  SurveyBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _description = $v.description;
      _structure = $v.structure.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Survey other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Survey;
  }

  @override
  void update(void Function(SurveyBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Survey build() => _build();

  _$Survey _build() {
    _$Survey _$result;
    try {
      _$result = _$v ??
          new _$Survey._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Survey', 'id'),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'Survey', 'name'),
              description: BuiltValueNullFieldError.checkNotNull(
                  description, r'Survey', 'description'),
              structure: structure.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'structure';
        structure.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Survey', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Submission extends Submission {
  @override
  final int id;
  @override
  final int surveyId;
  @override
  final String title;
  @override
  final String createdBy;
  @override
  final DateTime createdDate;

  factory _$Submission([void Function(SubmissionBuilder)? updates]) =>
      (new SubmissionBuilder()..update(updates))._build();

  _$Submission._(
      {required this.id,
      required this.surveyId,
      required this.title,
      required this.createdBy,
      required this.createdDate})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Submission', 'id');
    BuiltValueNullFieldError.checkNotNull(surveyId, r'Submission', 'surveyId');
    BuiltValueNullFieldError.checkNotNull(title, r'Submission', 'title');
    BuiltValueNullFieldError.checkNotNull(
        createdBy, r'Submission', 'createdBy');
    BuiltValueNullFieldError.checkNotNull(
        createdDate, r'Submission', 'createdDate');
  }

  @override
  Submission rebuild(void Function(SubmissionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmissionBuilder toBuilder() => new SubmissionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Submission &&
        id == other.id &&
        surveyId == other.surveyId &&
        title == other.title &&
        createdBy == other.createdBy &&
        createdDate == other.createdDate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, surveyId.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, createdBy.hashCode);
    _$hash = $jc(_$hash, createdDate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Submission')
          ..add('id', id)
          ..add('surveyId', surveyId)
          ..add('title', title)
          ..add('createdBy', createdBy)
          ..add('createdDate', createdDate))
        .toString();
  }
}

class SubmissionBuilder implements Builder<Submission, SubmissionBuilder> {
  _$Submission? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _surveyId;
  int? get surveyId => _$this._surveyId;
  set surveyId(int? surveyId) => _$this._surveyId = surveyId;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _createdBy;
  String? get createdBy => _$this._createdBy;
  set createdBy(String? createdBy) => _$this._createdBy = createdBy;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  SubmissionBuilder();

  SubmissionBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _surveyId = $v.surveyId;
      _title = $v.title;
      _createdBy = $v.createdBy;
      _createdDate = $v.createdDate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Submission other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Submission;
  }

  @override
  void update(void Function(SubmissionBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Submission build() => _build();

  _$Submission _build() {
    final _$result = _$v ??
        new _$Submission._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Submission', 'id'),
            surveyId: BuiltValueNullFieldError.checkNotNull(
                surveyId, r'Submission', 'surveyId'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'Submission', 'title'),
            createdBy: BuiltValueNullFieldError.checkNotNull(
                createdBy, r'Submission', 'createdBy'),
            createdDate: BuiltValueNullFieldError.checkNotNull(
                createdDate, r'Submission', 'createdDate'));
    replace(_$result);
    return _$result;
  }
}

class _$SubmissionLink extends SubmissionLink {
  @override
  final int id;
  @override
  final int parentId;
  @override
  final int childId;
  @override
  final int choiceQuestionAnswerParent;
  @override
  final String relationship;

  factory _$SubmissionLink([void Function(SubmissionLinkBuilder)? updates]) =>
      (new SubmissionLinkBuilder()..update(updates))._build();

  _$SubmissionLink._(
      {required this.id,
      required this.parentId,
      required this.childId,
      required this.choiceQuestionAnswerParent,
      required this.relationship})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'SubmissionLink', 'id');
    BuiltValueNullFieldError.checkNotNull(
        parentId, r'SubmissionLink', 'parentId');
    BuiltValueNullFieldError.checkNotNull(
        childId, r'SubmissionLink', 'childId');
    BuiltValueNullFieldError.checkNotNull(choiceQuestionAnswerParent,
        r'SubmissionLink', 'choiceQuestionAnswerParent');
    BuiltValueNullFieldError.checkNotNull(
        relationship, r'SubmissionLink', 'relationship');
  }

  @override
  SubmissionLink rebuild(void Function(SubmissionLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubmissionLinkBuilder toBuilder() =>
      new SubmissionLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubmissionLink &&
        id == other.id &&
        parentId == other.parentId &&
        childId == other.childId &&
        choiceQuestionAnswerParent == other.choiceQuestionAnswerParent &&
        relationship == other.relationship;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jc(_$hash, childId.hashCode);
    _$hash = $jc(_$hash, choiceQuestionAnswerParent.hashCode);
    _$hash = $jc(_$hash, relationship.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubmissionLink')
          ..add('id', id)
          ..add('parentId', parentId)
          ..add('childId', childId)
          ..add('choiceQuestionAnswerParent', choiceQuestionAnswerParent)
          ..add('relationship', relationship))
        .toString();
  }
}

class SubmissionLinkBuilder
    implements Builder<SubmissionLink, SubmissionLinkBuilder> {
  _$SubmissionLink? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _parentId;
  int? get parentId => _$this._parentId;
  set parentId(int? parentId) => _$this._parentId = parentId;

  int? _childId;
  int? get childId => _$this._childId;
  set childId(int? childId) => _$this._childId = childId;

  int? _choiceQuestionAnswerParent;
  int? get choiceQuestionAnswerParent => _$this._choiceQuestionAnswerParent;
  set choiceQuestionAnswerParent(int? choiceQuestionAnswerParent) =>
      _$this._choiceQuestionAnswerParent = choiceQuestionAnswerParent;

  String? _relationship;
  String? get relationship => _$this._relationship;
  set relationship(String? relationship) => _$this._relationship = relationship;

  SubmissionLinkBuilder();

  SubmissionLinkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _parentId = $v.parentId;
      _childId = $v.childId;
      _choiceQuestionAnswerParent = $v.choiceQuestionAnswerParent;
      _relationship = $v.relationship;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubmissionLink other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubmissionLink;
  }

  @override
  void update(void Function(SubmissionLinkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubmissionLink build() => _build();

  _$SubmissionLink _build() {
    final _$result = _$v ??
        new _$SubmissionLink._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'SubmissionLink', 'id'),
            parentId: BuiltValueNullFieldError.checkNotNull(
                parentId, r'SubmissionLink', 'parentId'),
            childId: BuiltValueNullFieldError.checkNotNull(
                childId, r'SubmissionLink', 'childId'),
            choiceQuestionAnswerParent: BuiltValueNullFieldError.checkNotNull(
                choiceQuestionAnswerParent,
                r'SubmissionLink',
                'choiceQuestionAnswerParent'),
            relationship: BuiltValueNullFieldError.checkNotNull(
                relationship, r'SubmissionLink', 'relationship'));
    replace(_$result);
    return _$result;
  }
}

class _$ChoiceQuestionAnswer extends ChoiceQuestionAnswer {
  @override
  final int id;
  @override
  final int submissionId;
  @override
  final String question;
  @override
  final int linkedSubmissionId;
  @override
  final String answer;
  @override
  final int? parentId;

  factory _$ChoiceQuestionAnswer(
          [void Function(ChoiceQuestionAnswerBuilder)? updates]) =>
      (new ChoiceQuestionAnswerBuilder()..update(updates))._build();

  _$ChoiceQuestionAnswer._(
      {required this.id,
      required this.submissionId,
      required this.question,
      required this.linkedSubmissionId,
      required this.answer,
      this.parentId})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'ChoiceQuestionAnswer', 'id');
    BuiltValueNullFieldError.checkNotNull(
        submissionId, r'ChoiceQuestionAnswer', 'submissionId');
    BuiltValueNullFieldError.checkNotNull(
        question, r'ChoiceQuestionAnswer', 'question');
    BuiltValueNullFieldError.checkNotNull(
        linkedSubmissionId, r'ChoiceQuestionAnswer', 'linkedSubmissionId');
    BuiltValueNullFieldError.checkNotNull(
        answer, r'ChoiceQuestionAnswer', 'answer');
  }

  @override
  ChoiceQuestionAnswer rebuild(
          void Function(ChoiceQuestionAnswerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChoiceQuestionAnswerBuilder toBuilder() =>
      new ChoiceQuestionAnswerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChoiceQuestionAnswer &&
        id == other.id &&
        submissionId == other.submissionId &&
        question == other.question &&
        linkedSubmissionId == other.linkedSubmissionId &&
        answer == other.answer &&
        parentId == other.parentId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, submissionId.hashCode);
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, linkedSubmissionId.hashCode);
    _$hash = $jc(_$hash, answer.hashCode);
    _$hash = $jc(_$hash, parentId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChoiceQuestionAnswer')
          ..add('id', id)
          ..add('submissionId', submissionId)
          ..add('question', question)
          ..add('linkedSubmissionId', linkedSubmissionId)
          ..add('answer', answer)
          ..add('parentId', parentId))
        .toString();
  }
}

class ChoiceQuestionAnswerBuilder
    implements Builder<ChoiceQuestionAnswer, ChoiceQuestionAnswerBuilder> {
  _$ChoiceQuestionAnswer? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _submissionId;
  int? get submissionId => _$this._submissionId;
  set submissionId(int? submissionId) => _$this._submissionId = submissionId;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  int? _linkedSubmissionId;
  int? get linkedSubmissionId => _$this._linkedSubmissionId;
  set linkedSubmissionId(int? linkedSubmissionId) =>
      _$this._linkedSubmissionId = linkedSubmissionId;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  int? _parentId;
  int? get parentId => _$this._parentId;
  set parentId(int? parentId) => _$this._parentId = parentId;

  ChoiceQuestionAnswerBuilder();

  ChoiceQuestionAnswerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _submissionId = $v.submissionId;
      _question = $v.question;
      _linkedSubmissionId = $v.linkedSubmissionId;
      _answer = $v.answer;
      _parentId = $v.parentId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChoiceQuestionAnswer other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChoiceQuestionAnswer;
  }

  @override
  void update(void Function(ChoiceQuestionAnswerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChoiceQuestionAnswer build() => _build();

  _$ChoiceQuestionAnswer _build() {
    final _$result = _$v ??
        new _$ChoiceQuestionAnswer._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'ChoiceQuestionAnswer', 'id'),
            submissionId: BuiltValueNullFieldError.checkNotNull(
                submissionId, r'ChoiceQuestionAnswer', 'submissionId'),
            question: BuiltValueNullFieldError.checkNotNull(
                question, r'ChoiceQuestionAnswer', 'question'),
            linkedSubmissionId: BuiltValueNullFieldError.checkNotNull(
                linkedSubmissionId,
                r'ChoiceQuestionAnswer',
                'linkedSubmissionId'),
            answer: BuiltValueNullFieldError.checkNotNull(
                answer, r'ChoiceQuestionAnswer', 'answer'),
            parentId: parentId);
    replace(_$result);
    return _$result;
  }
}

class _$Concretisation extends Concretisation {
  @override
  final int id;
  @override
  final int choiceQuestionAnswerId;
  @override
  final int orderIndex;
  @override
  final ConcretisationValueBase concretisationValue;

  factory _$Concretisation([void Function(ConcretisationBuilder)? updates]) =>
      (new ConcretisationBuilder()..update(updates))._build();

  _$Concretisation._(
      {required this.id,
      required this.choiceQuestionAnswerId,
      required this.orderIndex,
      required this.concretisationValue})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Concretisation', 'id');
    BuiltValueNullFieldError.checkNotNull(
        choiceQuestionAnswerId, r'Concretisation', 'choiceQuestionAnswerId');
    BuiltValueNullFieldError.checkNotNull(
        orderIndex, r'Concretisation', 'orderIndex');
    BuiltValueNullFieldError.checkNotNull(
        concretisationValue, r'Concretisation', 'concretisationValue');
  }

  @override
  Concretisation rebuild(void Function(ConcretisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConcretisationBuilder toBuilder() =>
      new ConcretisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Concretisation &&
        id == other.id &&
        choiceQuestionAnswerId == other.choiceQuestionAnswerId &&
        orderIndex == other.orderIndex &&
        concretisationValue == other.concretisationValue;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, choiceQuestionAnswerId.hashCode);
    _$hash = $jc(_$hash, orderIndex.hashCode);
    _$hash = $jc(_$hash, concretisationValue.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Concretisation')
          ..add('id', id)
          ..add('choiceQuestionAnswerId', choiceQuestionAnswerId)
          ..add('orderIndex', orderIndex)
          ..add('concretisationValue', concretisationValue))
        .toString();
  }
}

class ConcretisationBuilder
    implements Builder<Concretisation, ConcretisationBuilder> {
  _$Concretisation? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  int? _choiceQuestionAnswerId;
  int? get choiceQuestionAnswerId => _$this._choiceQuestionAnswerId;
  set choiceQuestionAnswerId(int? choiceQuestionAnswerId) =>
      _$this._choiceQuestionAnswerId = choiceQuestionAnswerId;

  int? _orderIndex;
  int? get orderIndex => _$this._orderIndex;
  set orderIndex(int? orderIndex) => _$this._orderIndex = orderIndex;

  ConcretisationValueBase? _concretisationValue;
  ConcretisationValueBase? get concretisationValue =>
      _$this._concretisationValue;
  set concretisationValue(ConcretisationValueBase? concretisationValue) =>
      _$this._concretisationValue = concretisationValue;

  ConcretisationBuilder();

  ConcretisationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _choiceQuestionAnswerId = $v.choiceQuestionAnswerId;
      _orderIndex = $v.orderIndex;
      _concretisationValue = $v.concretisationValue;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Concretisation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Concretisation;
  }

  @override
  void update(void Function(ConcretisationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Concretisation build() => _build();

  _$Concretisation _build() {
    final _$result = _$v ??
        new _$Concretisation._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'Concretisation', 'id'),
            choiceQuestionAnswerId: BuiltValueNullFieldError.checkNotNull(
                choiceQuestionAnswerId,
                r'Concretisation',
                'choiceQuestionAnswerId'),
            orderIndex: BuiltValueNullFieldError.checkNotNull(
                orderIndex, r'Concretisation', 'orderIndex'),
            concretisationValue: BuiltValueNullFieldError.checkNotNull(
                concretisationValue, r'Concretisation', 'concretisationValue'));
    replace(_$result);
    return _$result;
  }
}

abstract mixin class ConcretisationValueBaseBuilder {
  void replace(ConcretisationValueBase other);
  void update(void Function(ConcretisationValueBaseBuilder) updates);
}

class _$TextConcretisation extends TextConcretisation {
  @override
  final String text;

  factory _$TextConcretisation(
          [void Function(TextConcretisationBuilder)? updates]) =>
      (new TextConcretisationBuilder()..update(updates))._build();

  _$TextConcretisation._({required this.text}) : super._() {
    BuiltValueNullFieldError.checkNotNull(text, r'TextConcretisation', 'text');
  }

  @override
  TextConcretisation rebuild(
          void Function(TextConcretisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TextConcretisationBuilder toBuilder() =>
      new TextConcretisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TextConcretisation && text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TextConcretisation')
          ..add('text', text))
        .toString();
  }
}

class TextConcretisationBuilder
    implements
        Builder<TextConcretisation, TextConcretisationBuilder>,
        ConcretisationValueBaseBuilder {
  _$TextConcretisation? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(covariant String? text) => _$this._text = text;

  TextConcretisationBuilder();

  TextConcretisationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant TextConcretisation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TextConcretisation;
  }

  @override
  void update(void Function(TextConcretisationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TextConcretisation build() => _build();

  _$TextConcretisation _build() {
    final _$result = _$v ??
        new _$TextConcretisation._(
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'TextConcretisation', 'text'));
    replace(_$result);
    return _$result;
  }
}

class _$DecimalConcretisation extends DecimalConcretisation {
  @override
  final String decimal;

  factory _$DecimalConcretisation(
          [void Function(DecimalConcretisationBuilder)? updates]) =>
      (new DecimalConcretisationBuilder()..update(updates))._build();

  _$DecimalConcretisation._({required this.decimal}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        decimal, r'DecimalConcretisation', 'decimal');
  }

  @override
  DecimalConcretisation rebuild(
          void Function(DecimalConcretisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DecimalConcretisationBuilder toBuilder() =>
      new DecimalConcretisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DecimalConcretisation && decimal == other.decimal;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, decimal.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'DecimalConcretisation')
          ..add('decimal', decimal))
        .toString();
  }
}

class DecimalConcretisationBuilder
    implements
        Builder<DecimalConcretisation, DecimalConcretisationBuilder>,
        ConcretisationValueBaseBuilder {
  _$DecimalConcretisation? _$v;

  String? _decimal;
  String? get decimal => _$this._decimal;
  set decimal(covariant String? decimal) => _$this._decimal = decimal;

  DecimalConcretisationBuilder();

  DecimalConcretisationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _decimal = $v.decimal;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant DecimalConcretisation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DecimalConcretisation;
  }

  @override
  void update(void Function(DecimalConcretisationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  DecimalConcretisation build() => _build();

  _$DecimalConcretisation _build() {
    final _$result = _$v ??
        new _$DecimalConcretisation._(
            decimal: BuiltValueNullFieldError.checkNotNull(
                decimal, r'DecimalConcretisation', 'decimal'));
    replace(_$result);
    return _$result;
  }
}

class _$ZeitVorgabeConcretisation extends ZeitVorgabeConcretisation {
  @override
  final String? vonTag;
  @override
  final String? bisTag;
  @override
  final String? vonMonat;
  @override
  final String? bisMonat;
  @override
  final String? dauerInStunden;
  @override
  final String? textConcretisation;

  factory _$ZeitVorgabeConcretisation(
          [void Function(ZeitVorgabeConcretisationBuilder)? updates]) =>
      (new ZeitVorgabeConcretisationBuilder()..update(updates))._build();

  _$ZeitVorgabeConcretisation._(
      {this.vonTag,
      this.bisTag,
      this.vonMonat,
      this.bisMonat,
      this.dauerInStunden,
      this.textConcretisation})
      : super._();

  @override
  ZeitVorgabeConcretisation rebuild(
          void Function(ZeitVorgabeConcretisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ZeitVorgabeConcretisationBuilder toBuilder() =>
      new ZeitVorgabeConcretisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ZeitVorgabeConcretisation &&
        vonTag == other.vonTag &&
        bisTag == other.bisTag &&
        vonMonat == other.vonMonat &&
        bisMonat == other.bisMonat &&
        dauerInStunden == other.dauerInStunden &&
        textConcretisation == other.textConcretisation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vonTag.hashCode);
    _$hash = $jc(_$hash, bisTag.hashCode);
    _$hash = $jc(_$hash, vonMonat.hashCode);
    _$hash = $jc(_$hash, bisMonat.hashCode);
    _$hash = $jc(_$hash, dauerInStunden.hashCode);
    _$hash = $jc(_$hash, textConcretisation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ZeitVorgabeConcretisation')
          ..add('vonTag', vonTag)
          ..add('bisTag', bisTag)
          ..add('vonMonat', vonMonat)
          ..add('bisMonat', bisMonat)
          ..add('dauerInStunden', dauerInStunden)
          ..add('textConcretisation', textConcretisation))
        .toString();
  }
}

class ZeitVorgabeConcretisationBuilder
    implements
        Builder<ZeitVorgabeConcretisation, ZeitVorgabeConcretisationBuilder>,
        ConcretisationValueBaseBuilder {
  _$ZeitVorgabeConcretisation? _$v;

  String? _vonTag;
  String? get vonTag => _$this._vonTag;
  set vonTag(covariant String? vonTag) => _$this._vonTag = vonTag;

  String? _bisTag;
  String? get bisTag => _$this._bisTag;
  set bisTag(covariant String? bisTag) => _$this._bisTag = bisTag;

  String? _vonMonat;
  String? get vonMonat => _$this._vonMonat;
  set vonMonat(covariant String? vonMonat) => _$this._vonMonat = vonMonat;

  String? _bisMonat;
  String? get bisMonat => _$this._bisMonat;
  set bisMonat(covariant String? bisMonat) => _$this._bisMonat = bisMonat;

  String? _dauerInStunden;
  String? get dauerInStunden => _$this._dauerInStunden;
  set dauerInStunden(covariant String? dauerInStunden) =>
      _$this._dauerInStunden = dauerInStunden;

  String? _textConcretisation;
  String? get textConcretisation => _$this._textConcretisation;
  set textConcretisation(covariant String? textConcretisation) =>
      _$this._textConcretisation = textConcretisation;

  ZeitVorgabeConcretisationBuilder();

  ZeitVorgabeConcretisationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vonTag = $v.vonTag;
      _bisTag = $v.bisTag;
      _vonMonat = $v.vonMonat;
      _bisMonat = $v.bisMonat;
      _dauerInStunden = $v.dauerInStunden;
      _textConcretisation = $v.textConcretisation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ZeitVorgabeConcretisation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ZeitVorgabeConcretisation;
  }

  @override
  void update(void Function(ZeitVorgabeConcretisationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ZeitVorgabeConcretisation build() => _build();

  _$ZeitVorgabeConcretisation _build() {
    final _$result = _$v ??
        new _$ZeitVorgabeConcretisation._(
            vonTag: vonTag,
            bisTag: bisTag,
            vonMonat: vonMonat,
            bisMonat: bisMonat,
            dauerInStunden: dauerInStunden,
            textConcretisation: textConcretisation);
    replace(_$result);
    return _$result;
  }
}

class _$MengenVorgabeConcretisation extends MengenVorgabeConcretisation {
  @override
  final String? vorzeichenMin;
  @override
  final String zahlMin;
  @override
  final String? vorzeichenMax;
  @override
  final String zahlMax;
  @override
  final String? zaehler;
  @override
  final String? nenner;
  @override
  final String? textConcretisation;

  factory _$MengenVorgabeConcretisation(
          [void Function(MengenVorgabeConcretisationBuilder)? updates]) =>
      (new MengenVorgabeConcretisationBuilder()..update(updates))._build();

  _$MengenVorgabeConcretisation._(
      {this.vorzeichenMin,
      required this.zahlMin,
      this.vorzeichenMax,
      required this.zahlMax,
      this.zaehler,
      this.nenner,
      this.textConcretisation})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        zahlMin, r'MengenVorgabeConcretisation', 'zahlMin');
    BuiltValueNullFieldError.checkNotNull(
        zahlMax, r'MengenVorgabeConcretisation', 'zahlMax');
  }

  @override
  MengenVorgabeConcretisation rebuild(
          void Function(MengenVorgabeConcretisationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MengenVorgabeConcretisationBuilder toBuilder() =>
      new MengenVorgabeConcretisationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MengenVorgabeConcretisation &&
        vorzeichenMin == other.vorzeichenMin &&
        zahlMin == other.zahlMin &&
        vorzeichenMax == other.vorzeichenMax &&
        zahlMax == other.zahlMax &&
        zaehler == other.zaehler &&
        nenner == other.nenner &&
        textConcretisation == other.textConcretisation;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, vorzeichenMin.hashCode);
    _$hash = $jc(_$hash, zahlMin.hashCode);
    _$hash = $jc(_$hash, vorzeichenMax.hashCode);
    _$hash = $jc(_$hash, zahlMax.hashCode);
    _$hash = $jc(_$hash, zaehler.hashCode);
    _$hash = $jc(_$hash, nenner.hashCode);
    _$hash = $jc(_$hash, textConcretisation.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MengenVorgabeConcretisation')
          ..add('vorzeichenMin', vorzeichenMin)
          ..add('zahlMin', zahlMin)
          ..add('vorzeichenMax', vorzeichenMax)
          ..add('zahlMax', zahlMax)
          ..add('zaehler', zaehler)
          ..add('nenner', nenner)
          ..add('textConcretisation', textConcretisation))
        .toString();
  }
}

class MengenVorgabeConcretisationBuilder
    implements
        Builder<MengenVorgabeConcretisation,
            MengenVorgabeConcretisationBuilder>,
        ConcretisationValueBaseBuilder {
  _$MengenVorgabeConcretisation? _$v;

  String? _vorzeichenMin;
  String? get vorzeichenMin => _$this._vorzeichenMin;
  set vorzeichenMin(covariant String? vorzeichenMin) =>
      _$this._vorzeichenMin = vorzeichenMin;

  String? _zahlMin;
  String? get zahlMin => _$this._zahlMin;
  set zahlMin(covariant String? zahlMin) => _$this._zahlMin = zahlMin;

  String? _vorzeichenMax;
  String? get vorzeichenMax => _$this._vorzeichenMax;
  set vorzeichenMax(covariant String? vorzeichenMax) =>
      _$this._vorzeichenMax = vorzeichenMax;

  String? _zahlMax;
  String? get zahlMax => _$this._zahlMax;
  set zahlMax(covariant String? zahlMax) => _$this._zahlMax = zahlMax;

  String? _zaehler;
  String? get zaehler => _$this._zaehler;
  set zaehler(covariant String? zaehler) => _$this._zaehler = zaehler;

  String? _nenner;
  String? get nenner => _$this._nenner;
  set nenner(covariant String? nenner) => _$this._nenner = nenner;

  String? _textConcretisation;
  String? get textConcretisation => _$this._textConcretisation;
  set textConcretisation(covariant String? textConcretisation) =>
      _$this._textConcretisation = textConcretisation;

  MengenVorgabeConcretisationBuilder();

  MengenVorgabeConcretisationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _vorzeichenMin = $v.vorzeichenMin;
      _zahlMin = $v.zahlMin;
      _vorzeichenMax = $v.vorzeichenMax;
      _zahlMax = $v.zahlMax;
      _zaehler = $v.zaehler;
      _nenner = $v.nenner;
      _textConcretisation = $v.textConcretisation;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant MengenVorgabeConcretisation other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MengenVorgabeConcretisation;
  }

  @override
  void update(void Function(MengenVorgabeConcretisationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MengenVorgabeConcretisation build() => _build();

  _$MengenVorgabeConcretisation _build() {
    final _$result = _$v ??
        new _$MengenVorgabeConcretisation._(
            vorzeichenMin: vorzeichenMin,
            zahlMin: BuiltValueNullFieldError.checkNotNull(
                zahlMin, r'MengenVorgabeConcretisation', 'zahlMin'),
            vorzeichenMax: vorzeichenMax,
            zahlMax: BuiltValueNullFieldError.checkNotNull(
                zahlMax, r'MengenVorgabeConcretisation', 'zahlMax'),
            zaehler: zaehler,
            nenner: nenner,
            textConcretisation: textConcretisation);
    replace(_$result);
    return _$result;
  }
}

class _$SurveyEntryPath extends SurveyEntryPath {
  @override
  final BuiltList<SurveyEntryPathElement> chainElements;
  @override
  final String? leafQuestion;
  String? __leafAnswer;
  bool ___leafAnswer = false;
  bool? __isChoicePath;
  bool? __isSubQuestionPath;
  bool? __isTopLevelQuestionPath;
  SurveyEntryPath? __parentPath;
  bool ___parentPath = false;
  SurveyEntryPath? __parentQuestionPath;
  bool ___parentQuestionPath = false;
  List<SurveyEntryPath>? __questionPathChain;
  List<SurveyEntryPath>? __pathChain;

  factory _$SurveyEntryPath([void Function(SurveyEntryPathBuilder)? updates]) =>
      (new SurveyEntryPathBuilder()..update(updates))._build();

  _$SurveyEntryPath._({required this.chainElements, this.leafQuestion})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        chainElements, r'SurveyEntryPath', 'chainElements');
  }

  @override
  String? get leafAnswer {
    if (!___leafAnswer) {
      __leafAnswer = super.leafAnswer;
      ___leafAnswer = true;
    }
    return __leafAnswer;
  }

  @override
  bool get isChoicePath => __isChoicePath ??= super.isChoicePath;

  @override
  bool get isSubQuestionPath => __isSubQuestionPath ??= super.isSubQuestionPath;

  @override
  bool get isTopLevelQuestionPath =>
      __isTopLevelQuestionPath ??= super.isTopLevelQuestionPath;

  @override
  SurveyEntryPath? get parentPath {
    if (!___parentPath) {
      __parentPath = super.parentPath;
      ___parentPath = true;
    }
    return __parentPath;
  }

  @override
  SurveyEntryPath? get parentQuestionPath {
    if (!___parentQuestionPath) {
      __parentQuestionPath = super.parentQuestionPath;
      ___parentQuestionPath = true;
    }
    return __parentQuestionPath;
  }

  @override
  List<SurveyEntryPath> get questionPathChain =>
      __questionPathChain ??= super.questionPathChain;

  @override
  List<SurveyEntryPath> get pathChain => __pathChain ??= super.pathChain;

  @override
  SurveyEntryPath rebuild(void Function(SurveyEntryPathBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurveyEntryPathBuilder toBuilder() =>
      new SurveyEntryPathBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SurveyEntryPath &&
        chainElements == other.chainElements &&
        leafQuestion == other.leafQuestion;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, chainElements.hashCode);
    _$hash = $jc(_$hash, leafQuestion.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }
}

class SurveyEntryPathBuilder
    implements Builder<SurveyEntryPath, SurveyEntryPathBuilder> {
  _$SurveyEntryPath? _$v;

  ListBuilder<SurveyEntryPathElement>? _chainElements;
  ListBuilder<SurveyEntryPathElement> get chainElements =>
      _$this._chainElements ??= new ListBuilder<SurveyEntryPathElement>();
  set chainElements(ListBuilder<SurveyEntryPathElement>? chainElements) =>
      _$this._chainElements = chainElements;

  String? _leafQuestion;
  String? get leafQuestion => _$this._leafQuestion;
  set leafQuestion(String? leafQuestion) => _$this._leafQuestion = leafQuestion;

  SurveyEntryPathBuilder();

  SurveyEntryPathBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chainElements = $v.chainElements.toBuilder();
      _leafQuestion = $v.leafQuestion;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SurveyEntryPath other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SurveyEntryPath;
  }

  @override
  void update(void Function(SurveyEntryPathBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SurveyEntryPath build() => _build();

  _$SurveyEntryPath _build() {
    _$SurveyEntryPath _$result;
    try {
      _$result = _$v ??
          new _$SurveyEntryPath._(
              chainElements: chainElements.build(), leafQuestion: leafQuestion);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'chainElements';
        chainElements.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SurveyEntryPath', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SurveyEntryPathElement extends SurveyEntryPathElement {
  @override
  final String question;
  @override
  final String answer;

  factory _$SurveyEntryPathElement(
          [void Function(SurveyEntryPathElementBuilder)? updates]) =>
      (new SurveyEntryPathElementBuilder()..update(updates))._build();

  _$SurveyEntryPathElement._({required this.question, required this.answer})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        question, r'SurveyEntryPathElement', 'question');
    BuiltValueNullFieldError.checkNotNull(
        answer, r'SurveyEntryPathElement', 'answer');
  }

  @override
  SurveyEntryPathElement rebuild(
          void Function(SurveyEntryPathElementBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SurveyEntryPathElementBuilder toBuilder() =>
      new SurveyEntryPathElementBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SurveyEntryPathElement &&
        question == other.question &&
        answer == other.answer;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, question.hashCode);
    _$hash = $jc(_$hash, answer.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SurveyEntryPathElement')
          ..add('question', question)
          ..add('answer', answer))
        .toString();
  }
}

class SurveyEntryPathElementBuilder
    implements Builder<SurveyEntryPathElement, SurveyEntryPathElementBuilder> {
  _$SurveyEntryPathElement? _$v;

  String? _question;
  String? get question => _$this._question;
  set question(String? question) => _$this._question = question;

  String? _answer;
  String? get answer => _$this._answer;
  set answer(String? answer) => _$this._answer = answer;

  SurveyEntryPathElementBuilder();

  SurveyEntryPathElementBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _question = $v.question;
      _answer = $v.answer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SurveyEntryPathElement other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SurveyEntryPathElement;
  }

  @override
  void update(void Function(SurveyEntryPathElementBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SurveyEntryPathElement build() => _build();

  _$SurveyEntryPathElement _build() {
    final _$result = _$v ??
        new _$SurveyEntryPathElement._(
            question: BuiltValueNullFieldError.checkNotNull(
                question, r'SurveyEntryPathElement', 'question'),
            answer: BuiltValueNullFieldError.checkNotNull(
                answer, r'SurveyEntryPathElement', 'answer'));
    replace(_$result);
    return _$result;
  }
}

class _$ChoiceAnswerValidationResult extends ChoiceAnswerValidationResult {
  @override
  final BuiltMap<SurveyEntryPath, BuiltList<QuestionError>> errorsByPath;

  factory _$ChoiceAnswerValidationResult(
          [void Function(ChoiceAnswerValidationResultBuilder)? updates]) =>
      (new ChoiceAnswerValidationResultBuilder()..update(updates))._build();

  _$ChoiceAnswerValidationResult._({required this.errorsByPath}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        errorsByPath, r'ChoiceAnswerValidationResult', 'errorsByPath');
  }

  @override
  ChoiceAnswerValidationResult rebuild(
          void Function(ChoiceAnswerValidationResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChoiceAnswerValidationResultBuilder toBuilder() =>
      new ChoiceAnswerValidationResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChoiceAnswerValidationResult &&
        errorsByPath == other.errorsByPath;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errorsByPath.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChoiceAnswerValidationResult')
          ..add('errorsByPath', errorsByPath))
        .toString();
  }
}

class ChoiceAnswerValidationResultBuilder
    implements
        Builder<ChoiceAnswerValidationResult,
            ChoiceAnswerValidationResultBuilder> {
  _$ChoiceAnswerValidationResult? _$v;

  MapBuilder<SurveyEntryPath, BuiltList<QuestionError>>? _errorsByPath;
  MapBuilder<SurveyEntryPath, BuiltList<QuestionError>> get errorsByPath =>
      _$this._errorsByPath ??=
          new MapBuilder<SurveyEntryPath, BuiltList<QuestionError>>();
  set errorsByPath(
          MapBuilder<SurveyEntryPath, BuiltList<QuestionError>>?
              errorsByPath) =>
      _$this._errorsByPath = errorsByPath;

  ChoiceAnswerValidationResultBuilder();

  ChoiceAnswerValidationResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errorsByPath = $v.errorsByPath.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChoiceAnswerValidationResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChoiceAnswerValidationResult;
  }

  @override
  void update(void Function(ChoiceAnswerValidationResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChoiceAnswerValidationResult build() => _build();

  _$ChoiceAnswerValidationResult _build() {
    _$ChoiceAnswerValidationResult _$result;
    try {
      _$result = _$v ??
          new _$ChoiceAnswerValidationResult._(
              errorsByPath: errorsByPath.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errorsByPath';
        errorsByPath.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChoiceAnswerValidationResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

abstract mixin class QuestionErrorBuilder {
  void replace(QuestionError other);
  void update(void Function(QuestionErrorBuilder) updates);
  String? get questionTitle;
  set questionTitle(String? questionTitle);

  ListBuilder<SurveyEntryPath> get pathSegments;
  set pathSegments(ListBuilder<SurveyEntryPath>? pathSegments);
}

class _$ChoiceQuestionHasNoAnswersError
    extends ChoiceQuestionHasNoAnswersError {
  @override
  final String questionTitle;
  @override
  final BuiltList<SurveyEntryPath> pathSegments;

  factory _$ChoiceQuestionHasNoAnswersError(
          [void Function(ChoiceQuestionHasNoAnswersErrorBuilder)? updates]) =>
      (new ChoiceQuestionHasNoAnswersErrorBuilder()..update(updates))._build();

  _$ChoiceQuestionHasNoAnswersError._(
      {required this.questionTitle, required this.pathSegments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        questionTitle, r'ChoiceQuestionHasNoAnswersError', 'questionTitle');
    BuiltValueNullFieldError.checkNotNull(
        pathSegments, r'ChoiceQuestionHasNoAnswersError', 'pathSegments');
  }

  @override
  ChoiceQuestionHasNoAnswersError rebuild(
          void Function(ChoiceQuestionHasNoAnswersErrorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChoiceQuestionHasNoAnswersErrorBuilder toBuilder() =>
      new ChoiceQuestionHasNoAnswersErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChoiceQuestionHasNoAnswersError &&
        questionTitle == other.questionTitle &&
        pathSegments == other.pathSegments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, questionTitle.hashCode);
    _$hash = $jc(_$hash, pathSegments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChoiceQuestionHasNoAnswersError')
          ..add('questionTitle', questionTitle)
          ..add('pathSegments', pathSegments))
        .toString();
  }
}

class ChoiceQuestionHasNoAnswersErrorBuilder
    implements
        Builder<ChoiceQuestionHasNoAnswersError,
            ChoiceQuestionHasNoAnswersErrorBuilder>,
        QuestionErrorBuilder {
  _$ChoiceQuestionHasNoAnswersError? _$v;

  String? _questionTitle;
  String? get questionTitle => _$this._questionTitle;
  set questionTitle(covariant String? questionTitle) =>
      _$this._questionTitle = questionTitle;

  ListBuilder<SurveyEntryPath>? _pathSegments;
  ListBuilder<SurveyEntryPath> get pathSegments =>
      _$this._pathSegments ??= new ListBuilder<SurveyEntryPath>();
  set pathSegments(covariant ListBuilder<SurveyEntryPath>? pathSegments) =>
      _$this._pathSegments = pathSegments;

  ChoiceQuestionHasNoAnswersErrorBuilder();

  ChoiceQuestionHasNoAnswersErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionTitle = $v.questionTitle;
      _pathSegments = $v.pathSegments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ChoiceQuestionHasNoAnswersError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChoiceQuestionHasNoAnswersError;
  }

  @override
  void update(void Function(ChoiceQuestionHasNoAnswersErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChoiceQuestionHasNoAnswersError build() => _build();

  _$ChoiceQuestionHasNoAnswersError _build() {
    _$ChoiceQuestionHasNoAnswersError _$result;
    try {
      _$result = _$v ??
          new _$ChoiceQuestionHasNoAnswersError._(
              questionTitle: BuiltValueNullFieldError.checkNotNull(
                  questionTitle,
                  r'ChoiceQuestionHasNoAnswersError',
                  'questionTitle'),
              pathSegments: pathSegments.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pathSegments';
        pathSegments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChoiceQuestionHasNoAnswersError', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$SingelChoiceQuestionHasToManyAnswersError
    extends SingelChoiceQuestionHasToManyAnswersError {
  @override
  final String questionTitle;
  @override
  final BuiltList<SurveyEntryPath> pathSegments;

  factory _$SingelChoiceQuestionHasToManyAnswersError(
          [void Function(SingelChoiceQuestionHasToManyAnswersErrorBuilder)?
              updates]) =>
      (new SingelChoiceQuestionHasToManyAnswersErrorBuilder()..update(updates))
          ._build();

  _$SingelChoiceQuestionHasToManyAnswersError._(
      {required this.questionTitle, required this.pathSegments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(questionTitle,
        r'SingelChoiceQuestionHasToManyAnswersError', 'questionTitle');
    BuiltValueNullFieldError.checkNotNull(pathSegments,
        r'SingelChoiceQuestionHasToManyAnswersError', 'pathSegments');
  }

  @override
  SingelChoiceQuestionHasToManyAnswersError rebuild(
          void Function(SingelChoiceQuestionHasToManyAnswersErrorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SingelChoiceQuestionHasToManyAnswersErrorBuilder toBuilder() =>
      new SingelChoiceQuestionHasToManyAnswersErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SingelChoiceQuestionHasToManyAnswersError &&
        questionTitle == other.questionTitle &&
        pathSegments == other.pathSegments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, questionTitle.hashCode);
    _$hash = $jc(_$hash, pathSegments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'SingelChoiceQuestionHasToManyAnswersError')
          ..add('questionTitle', questionTitle)
          ..add('pathSegments', pathSegments))
        .toString();
  }
}

class SingelChoiceQuestionHasToManyAnswersErrorBuilder
    implements
        Builder<SingelChoiceQuestionHasToManyAnswersError,
            SingelChoiceQuestionHasToManyAnswersErrorBuilder>,
        QuestionErrorBuilder {
  _$SingelChoiceQuestionHasToManyAnswersError? _$v;

  String? _questionTitle;
  String? get questionTitle => _$this._questionTitle;
  set questionTitle(covariant String? questionTitle) =>
      _$this._questionTitle = questionTitle;

  ListBuilder<SurveyEntryPath>? _pathSegments;
  ListBuilder<SurveyEntryPath> get pathSegments =>
      _$this._pathSegments ??= new ListBuilder<SurveyEntryPath>();
  set pathSegments(covariant ListBuilder<SurveyEntryPath>? pathSegments) =>
      _$this._pathSegments = pathSegments;

  SingelChoiceQuestionHasToManyAnswersErrorBuilder();

  SingelChoiceQuestionHasToManyAnswersErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _questionTitle = $v.questionTitle;
      _pathSegments = $v.pathSegments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant SingelChoiceQuestionHasToManyAnswersError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SingelChoiceQuestionHasToManyAnswersError;
  }

  @override
  void update(
      void Function(SingelChoiceQuestionHasToManyAnswersErrorBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  SingelChoiceQuestionHasToManyAnswersError build() => _build();

  _$SingelChoiceQuestionHasToManyAnswersError _build() {
    _$SingelChoiceQuestionHasToManyAnswersError _$result;
    try {
      _$result = _$v ??
          new _$SingelChoiceQuestionHasToManyAnswersError._(
              questionTitle: BuiltValueNullFieldError.checkNotNull(
                  questionTitle,
                  r'SingelChoiceQuestionHasToManyAnswersError',
                  'questionTitle'),
              pathSegments: pathSegments.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pathSegments';
        pathSegments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SingelChoiceQuestionHasToManyAnswersError',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChoiceQuestionHasDuplicateAnswersError
    extends ChoiceQuestionHasDuplicateAnswersError {
  @override
  final BuiltSet<String> duplicateAnswers;
  @override
  final String questionTitle;
  @override
  final BuiltList<SurveyEntryPath> pathSegments;

  factory _$ChoiceQuestionHasDuplicateAnswersError(
          [void Function(ChoiceQuestionHasDuplicateAnswersErrorBuilder)?
              updates]) =>
      (new ChoiceQuestionHasDuplicateAnswersErrorBuilder()..update(updates))
          ._build();

  _$ChoiceQuestionHasDuplicateAnswersError._(
      {required this.duplicateAnswers,
      required this.questionTitle,
      required this.pathSegments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(duplicateAnswers,
        r'ChoiceQuestionHasDuplicateAnswersError', 'duplicateAnswers');
    BuiltValueNullFieldError.checkNotNull(questionTitle,
        r'ChoiceQuestionHasDuplicateAnswersError', 'questionTitle');
    BuiltValueNullFieldError.checkNotNull(pathSegments,
        r'ChoiceQuestionHasDuplicateAnswersError', 'pathSegments');
  }

  @override
  ChoiceQuestionHasDuplicateAnswersError rebuild(
          void Function(ChoiceQuestionHasDuplicateAnswersErrorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChoiceQuestionHasDuplicateAnswersErrorBuilder toBuilder() =>
      new ChoiceQuestionHasDuplicateAnswersErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChoiceQuestionHasDuplicateAnswersError &&
        duplicateAnswers == other.duplicateAnswers &&
        questionTitle == other.questionTitle &&
        pathSegments == other.pathSegments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, duplicateAnswers.hashCode);
    _$hash = $jc(_$hash, questionTitle.hashCode);
    _$hash = $jc(_$hash, pathSegments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'ChoiceQuestionHasDuplicateAnswersError')
          ..add('duplicateAnswers', duplicateAnswers)
          ..add('questionTitle', questionTitle)
          ..add('pathSegments', pathSegments))
        .toString();
  }
}

class ChoiceQuestionHasDuplicateAnswersErrorBuilder
    implements
        Builder<ChoiceQuestionHasDuplicateAnswersError,
            ChoiceQuestionHasDuplicateAnswersErrorBuilder>,
        QuestionErrorBuilder {
  _$ChoiceQuestionHasDuplicateAnswersError? _$v;

  SetBuilder<String>? _duplicateAnswers;
  SetBuilder<String> get duplicateAnswers =>
      _$this._duplicateAnswers ??= new SetBuilder<String>();
  set duplicateAnswers(covariant SetBuilder<String>? duplicateAnswers) =>
      _$this._duplicateAnswers = duplicateAnswers;

  String? _questionTitle;
  String? get questionTitle => _$this._questionTitle;
  set questionTitle(covariant String? questionTitle) =>
      _$this._questionTitle = questionTitle;

  ListBuilder<SurveyEntryPath>? _pathSegments;
  ListBuilder<SurveyEntryPath> get pathSegments =>
      _$this._pathSegments ??= new ListBuilder<SurveyEntryPath>();
  set pathSegments(covariant ListBuilder<SurveyEntryPath>? pathSegments) =>
      _$this._pathSegments = pathSegments;

  ChoiceQuestionHasDuplicateAnswersErrorBuilder();

  ChoiceQuestionHasDuplicateAnswersErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _duplicateAnswers = $v.duplicateAnswers.toBuilder();
      _questionTitle = $v.questionTitle;
      _pathSegments = $v.pathSegments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ChoiceQuestionHasDuplicateAnswersError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChoiceQuestionHasDuplicateAnswersError;
  }

  @override
  void update(
      void Function(ChoiceQuestionHasDuplicateAnswersErrorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChoiceQuestionHasDuplicateAnswersError build() => _build();

  _$ChoiceQuestionHasDuplicateAnswersError _build() {
    _$ChoiceQuestionHasDuplicateAnswersError _$result;
    try {
      _$result = _$v ??
          new _$ChoiceQuestionHasDuplicateAnswersError._(
              duplicateAnswers: duplicateAnswers.build(),
              questionTitle: BuiltValueNullFieldError.checkNotNull(
                  questionTitle,
                  r'ChoiceQuestionHasDuplicateAnswersError',
                  'questionTitle'),
              pathSegments: pathSegments.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'duplicateAnswers';
        duplicateAnswers.build();

        _$failedField = 'pathSegments';
        pathSegments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChoiceQuestionHasDuplicateAnswersError',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ChoiceQuestionHasAnswersButPathIsDisabledError
    extends ChoiceQuestionHasAnswersButPathIsDisabledError {
  @override
  final BuiltList<SurveyEntryPath> disabledPathSegments;
  @override
  final String questionTitle;
  @override
  final BuiltList<SurveyEntryPath> pathSegments;

  factory _$ChoiceQuestionHasAnswersButPathIsDisabledError(
          [void Function(ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder)?
              updates]) =>
      (new ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder()
            ..update(updates))
          ._build();

  _$ChoiceQuestionHasAnswersButPathIsDisabledError._(
      {required this.disabledPathSegments,
      required this.questionTitle,
      required this.pathSegments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        disabledPathSegments,
        r'ChoiceQuestionHasAnswersButPathIsDisabledError',
        'disabledPathSegments');
    BuiltValueNullFieldError.checkNotNull(questionTitle,
        r'ChoiceQuestionHasAnswersButPathIsDisabledError', 'questionTitle');
    BuiltValueNullFieldError.checkNotNull(pathSegments,
        r'ChoiceQuestionHasAnswersButPathIsDisabledError', 'pathSegments');
  }

  @override
  ChoiceQuestionHasAnswersButPathIsDisabledError rebuild(
          void Function(ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder toBuilder() =>
      new ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChoiceQuestionHasAnswersButPathIsDisabledError &&
        disabledPathSegments == other.disabledPathSegments &&
        questionTitle == other.questionTitle &&
        pathSegments == other.pathSegments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, disabledPathSegments.hashCode);
    _$hash = $jc(_$hash, questionTitle.hashCode);
    _$hash = $jc(_$hash, pathSegments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'ChoiceQuestionHasAnswersButPathIsDisabledError')
          ..add('disabledPathSegments', disabledPathSegments)
          ..add('questionTitle', questionTitle)
          ..add('pathSegments', pathSegments))
        .toString();
  }
}

class ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder
    implements
        Builder<ChoiceQuestionHasAnswersButPathIsDisabledError,
            ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder>,
        QuestionErrorBuilder {
  _$ChoiceQuestionHasAnswersButPathIsDisabledError? _$v;

  ListBuilder<SurveyEntryPath>? _disabledPathSegments;
  ListBuilder<SurveyEntryPath> get disabledPathSegments =>
      _$this._disabledPathSegments ??= new ListBuilder<SurveyEntryPath>();
  set disabledPathSegments(
          covariant ListBuilder<SurveyEntryPath>? disabledPathSegments) =>
      _$this._disabledPathSegments = disabledPathSegments;

  String? _questionTitle;
  String? get questionTitle => _$this._questionTitle;
  set questionTitle(covariant String? questionTitle) =>
      _$this._questionTitle = questionTitle;

  ListBuilder<SurveyEntryPath>? _pathSegments;
  ListBuilder<SurveyEntryPath> get pathSegments =>
      _$this._pathSegments ??= new ListBuilder<SurveyEntryPath>();
  set pathSegments(covariant ListBuilder<SurveyEntryPath>? pathSegments) =>
      _$this._pathSegments = pathSegments;

  ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder();

  ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _disabledPathSegments = $v.disabledPathSegments.toBuilder();
      _questionTitle = $v.questionTitle;
      _pathSegments = $v.pathSegments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ChoiceQuestionHasAnswersButPathIsDisabledError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChoiceQuestionHasAnswersButPathIsDisabledError;
  }

  @override
  void update(
      void Function(ChoiceQuestionHasAnswersButPathIsDisabledErrorBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  ChoiceQuestionHasAnswersButPathIsDisabledError build() => _build();

  _$ChoiceQuestionHasAnswersButPathIsDisabledError _build() {
    _$ChoiceQuestionHasAnswersButPathIsDisabledError _$result;
    try {
      _$result = _$v ??
          new _$ChoiceQuestionHasAnswersButPathIsDisabledError._(
              disabledPathSegments: disabledPathSegments.build(),
              questionTitle: BuiltValueNullFieldError.checkNotNull(
                  questionTitle,
                  r'ChoiceQuestionHasAnswersButPathIsDisabledError',
                  'questionTitle'),
              pathSegments: pathSegments.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'disabledPathSegments';
        disabledPathSegments.build();

        _$failedField = 'pathSegments';
        pathSegments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ChoiceQuestionHasAnswersButPathIsDisabledError',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$PathIsDisabledButHasAnsweredSubquestionsError
    extends PathIsDisabledButHasAnsweredSubquestionsError {
  @override
  final SurveyEntryPath subQuestionPath;
  @override
  final BuiltList<SurveyEntryPath> disabledPathSegments;
  @override
  final String questionTitle;
  @override
  final BuiltList<SurveyEntryPath> pathSegments;

  factory _$PathIsDisabledButHasAnsweredSubquestionsError(
          [void Function(PathIsDisabledButHasAnsweredSubquestionsErrorBuilder)?
              updates]) =>
      (new PathIsDisabledButHasAnsweredSubquestionsErrorBuilder()
            ..update(updates))
          ._build();

  _$PathIsDisabledButHasAnsweredSubquestionsError._(
      {required this.subQuestionPath,
      required this.disabledPathSegments,
      required this.questionTitle,
      required this.pathSegments})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(subQuestionPath,
        r'PathIsDisabledButHasAnsweredSubquestionsError', 'subQuestionPath');
    BuiltValueNullFieldError.checkNotNull(
        disabledPathSegments,
        r'PathIsDisabledButHasAnsweredSubquestionsError',
        'disabledPathSegments');
    BuiltValueNullFieldError.checkNotNull(questionTitle,
        r'PathIsDisabledButHasAnsweredSubquestionsError', 'questionTitle');
    BuiltValueNullFieldError.checkNotNull(pathSegments,
        r'PathIsDisabledButHasAnsweredSubquestionsError', 'pathSegments');
  }

  @override
  PathIsDisabledButHasAnsweredSubquestionsError rebuild(
          void Function(PathIsDisabledButHasAnsweredSubquestionsErrorBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PathIsDisabledButHasAnsweredSubquestionsErrorBuilder toBuilder() =>
      new PathIsDisabledButHasAnsweredSubquestionsErrorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PathIsDisabledButHasAnsweredSubquestionsError &&
        subQuestionPath == other.subQuestionPath &&
        disabledPathSegments == other.disabledPathSegments &&
        questionTitle == other.questionTitle &&
        pathSegments == other.pathSegments;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subQuestionPath.hashCode);
    _$hash = $jc(_$hash, disabledPathSegments.hashCode);
    _$hash = $jc(_$hash, questionTitle.hashCode);
    _$hash = $jc(_$hash, pathSegments.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'PathIsDisabledButHasAnsweredSubquestionsError')
          ..add('subQuestionPath', subQuestionPath)
          ..add('disabledPathSegments', disabledPathSegments)
          ..add('questionTitle', questionTitle)
          ..add('pathSegments', pathSegments))
        .toString();
  }
}

class PathIsDisabledButHasAnsweredSubquestionsErrorBuilder
    implements
        Builder<PathIsDisabledButHasAnsweredSubquestionsError,
            PathIsDisabledButHasAnsweredSubquestionsErrorBuilder>,
        QuestionErrorBuilder {
  _$PathIsDisabledButHasAnsweredSubquestionsError? _$v;

  SurveyEntryPathBuilder? _subQuestionPath;
  SurveyEntryPathBuilder get subQuestionPath =>
      _$this._subQuestionPath ??= new SurveyEntryPathBuilder();
  set subQuestionPath(covariant SurveyEntryPathBuilder? subQuestionPath) =>
      _$this._subQuestionPath = subQuestionPath;

  ListBuilder<SurveyEntryPath>? _disabledPathSegments;
  ListBuilder<SurveyEntryPath> get disabledPathSegments =>
      _$this._disabledPathSegments ??= new ListBuilder<SurveyEntryPath>();
  set disabledPathSegments(
          covariant ListBuilder<SurveyEntryPath>? disabledPathSegments) =>
      _$this._disabledPathSegments = disabledPathSegments;

  String? _questionTitle;
  String? get questionTitle => _$this._questionTitle;
  set questionTitle(covariant String? questionTitle) =>
      _$this._questionTitle = questionTitle;

  ListBuilder<SurveyEntryPath>? _pathSegments;
  ListBuilder<SurveyEntryPath> get pathSegments =>
      _$this._pathSegments ??= new ListBuilder<SurveyEntryPath>();
  set pathSegments(covariant ListBuilder<SurveyEntryPath>? pathSegments) =>
      _$this._pathSegments = pathSegments;

  PathIsDisabledButHasAnsweredSubquestionsErrorBuilder();

  PathIsDisabledButHasAnsweredSubquestionsErrorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subQuestionPath = $v.subQuestionPath.toBuilder();
      _disabledPathSegments = $v.disabledPathSegments.toBuilder();
      _questionTitle = $v.questionTitle;
      _pathSegments = $v.pathSegments.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant PathIsDisabledButHasAnsweredSubquestionsError other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PathIsDisabledButHasAnsweredSubquestionsError;
  }

  @override
  void update(
      void Function(PathIsDisabledButHasAnsweredSubquestionsErrorBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  PathIsDisabledButHasAnsweredSubquestionsError build() => _build();

  _$PathIsDisabledButHasAnsweredSubquestionsError _build() {
    _$PathIsDisabledButHasAnsweredSubquestionsError _$result;
    try {
      _$result = _$v ??
          new _$PathIsDisabledButHasAnsweredSubquestionsError._(
              subQuestionPath: subQuestionPath.build(),
              disabledPathSegments: disabledPathSegments.build(),
              questionTitle: BuiltValueNullFieldError.checkNotNull(
                  questionTitle,
                  r'PathIsDisabledButHasAnsweredSubquestionsError',
                  'questionTitle'),
              pathSegments: pathSegments.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subQuestionPath';
        subQuestionPath.build();
        _$failedField = 'disabledPathSegments';
        disabledPathSegments.build();

        _$failedField = 'pathSegments';
        pathSegments.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PathIsDisabledButHasAnsweredSubquestionsError',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
