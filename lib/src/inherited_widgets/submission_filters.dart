import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:rxdart/rxdart.dart';

class SubmissionFilters extends InheritedWidget {
  final BehaviorSubject changed = BehaviorSubject();

  final BuiltSet<String> filterSubmissionsByUsers = BuiltSet({});
  Stream get filterByUserChanged =>
      changed.map((_) => filterSubmissionsByUsers).distinct();
  void addUserToFilter(String user) {
    filterSubmissionsByUsers.toBuilder()
      ..add(user)
      ..build();
    changed.add(true);
  }

  void removeUserFromFilter(String user) {
    filterSubmissionsByUsers.toBuilder()
      ..remove(user)
      ..build();
    changed.add(true);
  }

  BuiltMap<ChoiceQuestion, Set<String?>> filterSubmissionsByAttributesBuilt =
      BuiltMap({});

  Map<ChoiceQuestion, Set<String?>> get filterSubmissionsByAttributes  =>
      filterSubmissionsByAttributesBuilt.asMap();

  set filterSubmissionsByAttributes(
          Map<ChoiceQuestion, Set<String?>> filterSubmissionsByAttributes) =>
      filterSubmissionsByAttributesBuilt =
          BuiltMap(filterSubmissionsByAttributes);

  Stream get filterByAttributesChanged =>
      changed.map((_) => filterSubmissionsByAttributesBuilt).distinct();
  void addAttributeToFilter(ChoiceQuestion attribute, String? value) {
    final filterSubmissionsByAttributes =
        filterSubmissionsByAttributesBuilt.toBuilder();

    filterSubmissionsByAttributes[attribute]!.add(value);
    filterSubmissionsByAttributesBuilt = filterSubmissionsByAttributes.build();
    changed.add(true);
  }

  void removeAttributeFromFilter(ChoiceQuestion attribute, String? value) {
    final filterSubmissionsByAttributes =
        filterSubmissionsByAttributesBuilt.toBuilder();

    filterSubmissionsByAttributes[attribute]!.remove(value);
    this.filterSubmissionsByAttributesBuilt =
        filterSubmissionsByAttributes.build();
    changed.add(true);
  }

  bool sortAlpha = false;
  String filterName = "";

  SubmissionFilters({super.key, required super.child});

  static SubmissionFilters of(BuildContext context) {
    final SubmissionFilters? inheritedSubmissionFilters =
        context.dependOnInheritedWidgetOfExactType<SubmissionFilters>();

    return inheritedSubmissionFilters!;
  }

  @override
  bool updateShouldNotify(covariant SubmissionFilters oldWidget) => true;
}
