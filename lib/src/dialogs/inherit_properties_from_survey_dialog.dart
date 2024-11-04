import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/inherited_widgets/selected_survey.dart';
import 'package:json_to_survey/src/widgets/app_state.dart';
import 'package:rxdart/rxdart.dart';

import '../value_types/survey.dart';

class InheritPropertiesFromSubmissionDialog extends StatelessWidget {
  InheritPropertiesFromSubmissionDialog(
      {super.key, required this.allPossiblePropertiesToInherit})
      : possiblePropertiesToInherit =
            BehaviorSubject.seeded(allPossiblePropertiesToInherit);

  final BehaviorSubject<BuiltList<ChoiceQuestionAnswer>>
      possiblePropertiesToInherit;

  final BuiltList<ChoiceQuestionAnswer> allPossiblePropertiesToInherit;

  @override
  Widget build(BuildContext context) {
    final selectedSurveyType = SelectedSurvey.of(context);
    return Dialog(
      child: StreamBuilder(
          stream: AppState.of(context).storeService.storeBehavior,
          builder: (context, snapshot) {
            return Scaffold(
              appBar: AppBar(actions: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.check_box_outlined),
                  label: Text(AppLocalizations.of(context)!.selectAllText),
                  onPressed: () {
                    possiblePropertiesToInherit.value =
                        allPossiblePropertiesToInherit;
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.check_box_outline_blank),
                  label: Text(AppLocalizations.of(context)!.deselectAllText),
                  onPressed: () {
                    possiblePropertiesToInherit.value =
                        possiblePropertiesToInherit.value
                            .rebuild((b) => b.clear());
                  },
                )
              ], title: Text(AppLocalizations.of(context)!.whichPropertiesShouldBeInheritedText)),
              persistentFooterButtons: [
                FloatingActionButton.extended(
                    onPressed: () => Navigator.of(context)
                        .pop(possiblePropertiesToInherit.value),
                    icon: const Icon(Icons.check),
                    label: Text(AppLocalizations.of(context)!.applyPropertiesText)),
                FloatingActionButton.extended(
                    onPressed: () => Navigator.of(context).pop(null),
                    backgroundColor: Colors.red,
                    icon: const Icon(Icons.cancel_outlined),
                    label: Text(AppLocalizations.of(context)!.abortText))
              ],
              body: StreamBuilder(
                  stream: possiblePropertiesToInherit,
                  builder: (context, snapshot) {
                    return CustomScrollView(
                      slivers: [
                        SliverList(
                            delegate: SliverChildBuilderDelegate((context, i) {
                          final property = allPossiblePropertiesToInherit[i];

                          final questionsAndChoicesByPath =
                              selectedSurveyType.questionsAndChoicesByPath;
                          final questions = questionsAndChoicesByPath
                              .questionByPathMap.values;

                          final question = 
                              questions
                                  .whereType<ChoiceQuestion>()
                                  .firstWhereOrNull(
                                      (q) => q.id == property.question);

                          final answer = question?.choices.singleWhereOrNull(
                              (c) => c.value == property.answer);

                          return CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title:
                                Text(question?.title ?? property.question),
                            subtitle:
                                Text(answer?.title ?? property.answer),
                            value: possiblePropertiesToInherit.value
                                .contains(property),
                            onChanged: (bool? value) {
                              if (value == null) {
                                return;
                              }
                              if (value) {
                                possiblePropertiesToInherit.value =
                                    possiblePropertiesToInherit.value
                                        .rebuild((b) => b.add(property));
                              } else {
                                possiblePropertiesToInherit.value =
                                    possiblePropertiesToInherit.value
                                        .rebuild((b) => b.remove(property));
                              }
                            },
                          );
                        }, childCount: allPossiblePropertiesToInherit.length))
                      ],
                      cacheExtent: 4000,
                    );
                  }),
            );
          }),
    );
  }
}
