import 'dart:collection';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:json_to_survey/src/view_model/view_models.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:rxdart/rxdart.dart';

import '../store/store.dart';
import 'empty_page.dart';

class AppState extends InheritedWidget {
  final StoreService storeService;
  final SidebarNavigatorService sidebarNavigatorService;
  final MainNavigatorService mainNavigatorService;


  AppState({
    Key? key,
    required Widget child,
    required this.storeService,
    required this.sidebarNavigatorService,
    required this.mainNavigatorService,

  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppState of(BuildContext context) {
    final AppState? result =
        context.dependOnInheritedWidgetOfExactType<AppState>();
    assert(
        result != null, AppLocalizations.of(context)!.errNoAppStateFoundText);
    return result!;
  }
}

class StoreService {
  StoreService() {
    // TODO: delete? and only listen to changes in the widgets
    storeBehavior
        .mapNotNull((store) => store)
        .switchMap((store) => GetIt.I.get<ViewModel>().choiceQuestionAnswerViewModel.changed)
        .listen((changed) {
      final store = storeBehavior.value;

      if (store == null) {
        return;
      }

      final surveyType = selectedSurveyTypeBehavior.value;

      if (surveyType == null) {
        return;
      }

      final submission = selectedSubmissionBehavior.value;

      if (submission == null) {
        return;
      }

      final questionsAndChoicesByPath = surveyType.questionsAndChoicesByPath;
      final questionByPathMap = questionsAndChoicesByPath.questionByPathMap;
      final choicesByPathMap = questionsAndChoicesByPath.choicesByPathMap;

      // TODO: delete?
      questionsEnabledByPath = questionByPathMap.map((path, question) {
        final enabledIf = question.enabledIf;
        if (enabledIf == null) {
          return MapEntry(path, true);
        }

        final isEnabled = enabledIf.check((field) {
          final topLevelPath = SurveyEntryPath((b) => b.leafQuestion = field);
          final valuesForField =
              submission.getAnswers(vm: GetIt.I.get<ViewModel>(), path: topLevelPath);

          return valuesForField.map((v) => v.answer).toBuiltSet();
        });

        return MapEntry(path, isEnabled);
      });

      // TODO: brauche ich das noch?
      choicesErrorByPath = choicesByPathMap.map((choicePath, choice) {
        final enabledIf = choice.enabledIf;
        if (enabledIf == null) {
          return MapEntry(choicePath, true);
        }

        final answers =
        submission.getAnswers(vm: GetIt.I.get<ViewModel>(), path: choicePath.parentPath);

        final notSelected =
            !answers.any((answer) => answer.answer == choice.value);

        if (notSelected) {
          return MapEntry(choicePath, true);
        }

        final isEnabled = enabledIf.check((field) {
          final path = SurveyEntryPath((b) => b.leafQuestion = field);
          final valuesForField =
          submission.getAnswers(vm: GetIt.I.get<ViewModel>(), path: path);

          return valuesForField.map((v) => v.answer).toBuiltSet();
        });

        return MapEntry(choicePath, isEnabled);
      });

      final enabledByPath = Map.fromEntries(
          [...questionsEnabledByPath.entries, ...choicesErrorByPath.entries]);

      final disabledEntries = Queue<SurveyEntryPath>.from([
        ...enabledByPath.entries
            .where((e) => e.value == false)
            .map((e) => e.key)
      ]);
      while (disabledEntries.isNotEmpty) {
        final entry = disabledEntries.removeFirst();

        if (entry.chainElements.isNotEmpty) {
          final parent = entry.parentPath;

          enabledByPath[parent!] = false;
          disabledEntries.add(parent);
        }
      }

      // TODO: used?
      store.enabledByPath.value = BuiltMap(enabledByPath);
    });
  }

  Map<SurveyEntryPath, bool> questionsEnabledByPath = {};

  Map<SurveyEntryPath, bool> choicesErrorByPath = {};

  Map<String, Question> questionsMap = {};

  final BehaviorSubject<Store?> storeBehavior =
      BehaviorSubject.seeded(null);

  set store(Store? store) => storeBehavior.value = store;

  final BehaviorSubject<Survey?> selectedSurveyTypeBehavior =
      BehaviorSubject.seeded(null);

  set selectedSurveyType(Survey? surveyType) =>
      selectedSurveyTypeBehavior.value = surveyType;

  final BehaviorSubject<Submission?> selectedSubmissionBehavior =
      BehaviorSubject.seeded(null);

  set selectedSubmission(Submission? submission) =>
      selectedSubmissionBehavior.value = submission;

  void registerReusableQuestionTypes(Iterable<SurveyEntry> definitions) {
    final reusableQuestionTypes = definitions.whereType<Question>().toList();
    for (var reusableQuestionType in reusableQuestionTypes) {
      questionsMap.putIfAbsent(
          reusableQuestionType.id, () => reusableQuestionType);
    }
  }
}

class MainNavigatorService {
  MainNavigatorService();
  final BehaviorSubject<Views?> currentViewBehaviour =
      BehaviorSubject.seeded(null);

  set currentView(Views? view) => currentViewBehaviour.value = view;

  Views? get currentView => currentViewBehaviour.value;
}

enum Views { addNewSubmissionView, settingsView, sandboxView, submissionTableView  }

class SidebarNavigatorService {
  SidebarNavigatorService();

  final BehaviorSubject<BuiltList<Page>> multipleChoiceSelectionPageHistory =
      BehaviorSubject.seeded(BuiltList([const EmptyPage()]));

  final sideBarNavigator = GlobalKey<NavigatorState>();

  void clear() {
    multipleChoiceSelectionPageHistory.value =
        multipleChoiceSelectionPageHistory.value.rebuild((b) => b
          ..clear()
          ..add(const EmptyPage()));
  }

  void popPage() {
    multipleChoiceSelectionPageHistory.value =
        multipleChoiceSelectionPageHistory.value.rebuild((b) => b.removeLast());
  }

  void pushPage(Page page) {
    multipleChoiceSelectionPageHistory.value =
        multipleChoiceSelectionPageHistory.value.rebuild((b) => b.add(page));
  }

  void replacePage(Page page) {
    multipleChoiceSelectionPageHistory.value =
        multipleChoiceSelectionPageHistory.value
            .rebuild((b) => b.replace([const EmptyPage(), page]));
  }

  bool get historyIsEmpty =>
      multipleChoiceSelectionPageHistory.value.length == 1 &&
      multipleChoiceSelectionPageHistory.value.first is EmptyPage;
}
