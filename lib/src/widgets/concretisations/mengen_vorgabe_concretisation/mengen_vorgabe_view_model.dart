import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:rxdart/rxdart.dart';

class MengenVorgabeViewModel {
  MengenVorgabeViewModel(MengenVorgabeConcretisation model) {
    if (model.zahlMin == model.zahlMax &&
        model.vorzeichenMin == model.vorzeichenMax) {
      exactValue = true;
    } else {
      valueSpan = true;
    }

    vorzeichenMin.value = model.vorzeichenMin;
    zahlMin.value = model.zahlMin;

    vorzeichenMax.value = model.vorzeichenMax;
    zahlMax.value = model.zahlMax;

    zaehler.value = model.zaehler;
    nenner.value = model.nenner;

    textConcretisation.value = model.textConcretisation;
  }

  final exactValueOrSpan = BehaviorSubject<List<bool>>.seeded([true, false]);

  bool get exactValue => exactValueOrSpan.value.first == true;

  bool get valueSpan => exactValueOrSpan.value.last == true;

  set exactValue(bool value) => exactValueOrSpan.value = [true, false];

  set valueSpan(bool value) => exactValueOrSpan.value = [false, true];
  final vorzeichenMin = BehaviorSubject<String?>.seeded(null);
  final zahlMin = BehaviorSubject<String>.seeded("");
  final vorzeichenMax = BehaviorSubject<String?>.seeded(null);
  final zahlMax = BehaviorSubject<String>.seeded("");
  final zaehler = BehaviorSubject<String?>.seeded(null);
  final nenner = BehaviorSubject<String?>.seeded(null);
  final textConcretisation = BehaviorSubject<String?>.seeded("");

  final connectedChoice = BehaviorSubject<Choice?>.seeded(null);

  MengenVorgabeConcretisation get model => MengenVorgabeConcretisation((b) => b
    ..vorzeichenMin = vorzeichenMin.value
    ..zahlMin = zahlMin.value
    ..vorzeichenMax = valueSpan ? vorzeichenMax.value : vorzeichenMin.value
    ..zahlMax = valueSpan ? zahlMax.value : zahlMin.value
    ..zaehler = zaehler.value
    ..nenner = nenner.value
    ..textConcretisation = textConcretisation.value);
}
