
import '../value_types/survey.dart';

typedef OnAdd = void Function(String selectedChoice);

typedef OnRemove = void Function({required ChoiceQuestionAnswer choiceToRemove});

typedef OnReplace = void Function({required ChoiceQuestionAnswer choiceToReplace, required String choiceToReplaceWith });