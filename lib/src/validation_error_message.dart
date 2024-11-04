import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

class ValidationErrorMessage extends StatelessWidget {
  const ValidationErrorMessage({super.key});

  @override
  Widget build(BuildContext context) => RichText(
          text: TextSpan(
        text: AppLocalizations.of(context)!.questionContainsErrorText,
        style: const TextStyle(color: Colors.red),
      ));
}

class ChoiceQuestionHasNoAnswersErrorMessage extends ValidationErrorMessage {
  const ChoiceQuestionHasNoAnswersErrorMessage(
      {super.key, required this.error});

  final ChoiceQuestionHasNoAnswersError error;

  @override
  Widget build(BuildContext context) {
    final surveyType = SelectedSurvey.of(context);

    final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;

    return RichText(
        text: TextSpan(
      text: AppLocalizations.of(context)!.singleChoiceQuestionText,
      style: const TextStyle(color: Colors.red),
      children: <TextSpan>[
        if (error.pathSegments.isNotEmpty)
          TextSpan(
            text: error.pathSegments.last
                .getPathString(questionsAndChoicesByPath),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        TextSpan(
            text: AppLocalizations.of(context)!
                .singleChoiceQuestionNeedsAnswerText),
      ],
    ));
  }
}

class ChoiceQuestionHasDuplicateAnswersErrorMessage
    extends ValidationErrorMessage {
  const ChoiceQuestionHasDuplicateAnswersErrorMessage(
      {super.key, required this.error});

  final ChoiceQuestionHasDuplicateAnswersError error;

  @override
  Widget build(BuildContext context) {
    final surveyType = SelectedSurvey.of(context);

    final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;

    return RichText(
        text: TextSpan(
      text: AppLocalizations.of(context)!.theQuestionText,
      style: const TextStyle(color: Colors.red),
      children: <TextSpan>[
        if (error.pathSegments.isNotEmpty)
          TextSpan(
            text: error.pathSegments.last
                .getPathString(questionsAndChoicesByPath),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        if (error.duplicateAnswers.length == 1)
          TextSpan(text: AppLocalizations.of(context)!.containsAnswerText),
        if (error.duplicateAnswers.length > 1)
          TextSpan(
              text: AppLocalizations.of(context)!.containsMultipleAnswersText),
        TextSpan(
          text: error.duplicateAnswers.join(", "),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(text: AppLocalizations.of(context)!.severalTimesText),
      ],
    ));
  }
}

class SingelChoiceQuestionHasToManyAnswersErrorMessage
    extends ValidationErrorMessage {
  const SingelChoiceQuestionHasToManyAnswersErrorMessage(
      {super.key, required this.error});

  final SingelChoiceQuestionHasToManyAnswersError error;

  @override
  Widget build(BuildContext context) {
    final surveyType = SelectedSurvey.of(context);

    final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;

    return RichText(
        text: TextSpan(
      text: AppLocalizations.of(context)!.singleChoiceQuestionText,
      style: const TextStyle(color: Colors.red),
      children: <TextSpan>[
        if (error.pathSegments.isNotEmpty)
          TextSpan(
            text: error.pathSegments.last
                .getPathString(questionsAndChoicesByPath),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        TextSpan(text: AppLocalizations.of(context)!.mustText),
        TextSpan(
          text: AppLocalizations.of(context)!.exactlyOneText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(text: AppLocalizations.of(context)!.haveAnswerText),
      ],
    ));
  }
}

class ChoiceQuestionHasAnswersButPathIsDisabledErrorMessage
    extends ValidationErrorMessage {
  const ChoiceQuestionHasAnswersButPathIsDisabledErrorMessage(
      {super.key, required this.error});

  final ChoiceQuestionHasAnswersButPathIsDisabledError error;

  @override
  Widget build(BuildContext context) {
    final surveyType = SelectedSurvey.of(context);

    final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;

    return RichText(
        text: TextSpan(
      text: AppLocalizations.of(context)!.theQuestionText,
      style: const TextStyle(color: Colors.red),
      children: <TextSpan>[
        if (error.pathSegments.isNotEmpty)
          TextSpan(
            text: error.pathSegments.last
                .getPathString(questionsAndChoicesByPath),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        TextSpan(text: AppLocalizations.of(context)!.hasOneAnswerButText),
        TextSpan(
          text: error.disabledPathSegments.last
              .getPathString(questionsAndChoicesByPath),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
            text: AppLocalizations.of(context)!.thisOptionsAreDeactivatedText),
      ],
    ));
  }
}

class PathIsDisabledButHasAnsweredSubquestionsErrorMessage
    extends ValidationErrorMessage {
  const PathIsDisabledButHasAnsweredSubquestionsErrorMessage(
      {super.key, required this.error});

  final PathIsDisabledButHasAnsweredSubquestionsError error;

  @override
  Widget build(BuildContext context) {
    final surveyType = SelectedSurvey.of(context);

    final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;

    return RichText(
        text: TextSpan(
      text: AppLocalizations.of(context)!.theConditionForText,
      style: const TextStyle(color: Colors.red),
      children: <TextSpan>[
        if (error.pathSegments.isNotEmpty)
          TextSpan(
            text: error.pathSegments.last
                .getPathString(questionsAndChoicesByPath),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        TextSpan(text: AppLocalizations.of(context)!.isNotSatisfiedButText),
        TextSpan(
          text: error.disabledPathSegments.last
              .getPathString(questionsAndChoicesByPath),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const TextSpan(text: "."),
      ],
    ));
  }
}

extension ValidationErrorMessageExtension on QuestionError {
  ValidationErrorMessage get errorMessage {
    assert(false);
    return ValidationErrorMessage();
  }
}

extension ChoiceQuestionHasNoAnswersErrorMessageExtension
    on ChoiceQuestionHasNoAnswersError {
  ValidationErrorMessage get errorMessage =>
      ChoiceQuestionHasNoAnswersErrorMessage(error: this);
}

extension SingelChoiceQuestionHasToManyAnswersErrorMessageExtension
    on SingelChoiceQuestionHasToManyAnswersError {
  ValidationErrorMessage get errorMessage =>
      SingelChoiceQuestionHasToManyAnswersErrorMessage(error: this);
}

extension ChoiceQuestionHasDuplicateAnswersErrorMessageExtension
    on ChoiceQuestionHasDuplicateAnswersError {
  ValidationErrorMessage get errorMessage =>
      ChoiceQuestionHasDuplicateAnswersErrorMessage(error: this);
}

extension ChoiceQuestionHasAnswersButPathIsDisabledErrorMessageExtension
    on ChoiceQuestionHasAnswersButPathIsDisabledError {
  ValidationErrorMessage get errorMessage =>
      ChoiceQuestionHasAnswersButPathIsDisabledErrorMessage(error: this);
}

extension PathIsDisabledButHasAnsweredSubquestionsErrorMessageExtension
    on PathIsDisabledButHasAnsweredSubquestionsError {
  ValidationErrorMessage get errorMessage =>
      PathIsDisabledButHasAnsweredSubquestionsErrorMessage(error: this);
}
