import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:rxdart/rxdart.dart';

enum ZeitVorgabeTyp { exakt, zeitSpanne, dauerInStunden }

enum ZeitSpanneTyp { von, bis, vonBis }

enum DatumsAngabeGenauigkeit { tagUndMonat, monat }

class ZeitVorgabeViewModel {
  ZeitVorgabeViewModel(ZeitVorgabeConcretisation zeitlicheVorgabe) {
    vonTag.value = zeitlicheVorgabe.vonTag;
    vonMonat.value = zeitlicheVorgabe.vonMonat;
    bisTag.value = zeitlicheVorgabe.bisTag;
    bisMonat.value = zeitlicheVorgabe.bisMonat;
    dauerInStunden.value = zeitlicheVorgabe.dauerInStunden;
    textConcretisation.value = zeitlicheVorgabe.textConcretisation;

    if (dauerInStunden.value?.isNotEmpty == true) {
      typ.value = ZeitVorgabeTyp.dauerInStunden;
    } else if (vonTag.value?.isNotEmpty == true &&
        vonMonat.value?.isNotEmpty == true &&
        bisTag.value?.isNotEmpty == true &&
        bisMonat.value?.isNotEmpty == true) {
      if (vonTag.value == bisTag.value && vonMonat.value == bisMonat.value) {
        typ.value = ZeitVorgabeTyp.exakt;
      } else {
        typ.value = ZeitVorgabeTyp.zeitSpanne;
        zeitSpanneTyp.value = ZeitSpanneTyp.vonBis;

        datumsAngabeGenauigkeit.value = DatumsAngabeGenauigkeit.tagUndMonat;
      }
    } else if (vonMonat.value?.isNotEmpty == true &&
        bisMonat.value?.isNotEmpty == true) {
      typ.value = ZeitVorgabeTyp.zeitSpanne;
      zeitSpanneTyp.value = ZeitSpanneTyp.vonBis;

      datumsAngabeGenauigkeit.value = DatumsAngabeGenauigkeit.monat;
    } else if (vonMonat.value?.isNotEmpty == true) {
      typ.value = ZeitVorgabeTyp.zeitSpanne;
      zeitSpanneTyp.value = ZeitSpanneTyp.von;

      if (vonTag.value?.isNotEmpty == true) {
        datumsAngabeGenauigkeit.value = DatumsAngabeGenauigkeit.tagUndMonat;
      } else {
        datumsAngabeGenauigkeit.value = DatumsAngabeGenauigkeit.monat;
      }
    } else if (bisMonat.value?.isNotEmpty == true) {
      typ.value = ZeitVorgabeTyp.zeitSpanne;
      zeitSpanneTyp.value = ZeitSpanneTyp.bis;

      if (bisTag.value?.isNotEmpty == true) {
        datumsAngabeGenauigkeit.value = DatumsAngabeGenauigkeit.tagUndMonat;
      } else {
        datumsAngabeGenauigkeit.value = DatumsAngabeGenauigkeit.monat;
      }
    } else if (vonMonat.value?.isNotEmpty == true) {
      typ.value = ZeitVorgabeTyp.zeitSpanne;
      zeitSpanneTyp.value = ZeitSpanneTyp.von;
    }
  }

  final zeitSpanneTyp =
      BehaviorSubject<ZeitSpanneTyp>.seeded(ZeitSpanneTyp.values[0]);

  List<bool> get selectedZeitSpanneTypToggleButton => [
        for (int i = 0; i < ZeitSpanneTyp.values.length; i++)
          ZeitSpanneTyp.values[i] == zeitSpanneTyp.value
      ];

  final typ = BehaviorSubject<ZeitVorgabeTyp>.seeded(ZeitVorgabeTyp.values[0]);

  List<bool> get selectedTypToggleButton => [
        for (int i = 0; i < ZeitVorgabeTyp.values.length; i++)
          ZeitVorgabeTyp.values[i] == typ.value
      ];

  final datumsAngabeGenauigkeit =
      BehaviorSubject<DatumsAngabeGenauigkeit>.seeded(
          DatumsAngabeGenauigkeit.values[0]);

  List<bool> get selectedDatumsAngabeGenauigkeitToggleButton => [
        for (int i = 0; i < DatumsAngabeGenauigkeit.values.length; i++)
          DatumsAngabeGenauigkeit.values[i] == datumsAngabeGenauigkeit.value
      ];

  Stream<dynamic> get toggleButtonStreams => Rx.combineLatest(
      [typ, zeitSpanneTyp, datumsAngabeGenauigkeit], (values) => values);

  final vonTag = BehaviorSubject<String?>.seeded("");
  final vonMonat = BehaviorSubject<String?>.seeded("");
  final bisTag = BehaviorSubject<String?>.seeded("");
  final bisMonat = BehaviorSubject<String?>.seeded("");
  final dauerInStunden = BehaviorSubject<String?>.seeded("");
  final textConcretisation = BehaviorSubject<String?>.seeded("");

  ZeitVorgabeConcretisation get model {
    return ZeitVorgabeConcretisation((b) {
      if (typ.value == ZeitVorgabeTyp.dauerInStunden) {
        b.dauerInStunden = dauerInStunden.value;
      } else if (typ.value == ZeitVorgabeTyp.exakt) {
        b
          ..vonTag = vonTag.value
          ..vonMonat = vonMonat.value
          ..bisTag = vonTag.value
          ..bisMonat = vonMonat.value;
      } else if (typ.value == ZeitVorgabeTyp.zeitSpanne) {
        if (zeitSpanneTyp.value == ZeitSpanneTyp.vonBis) {
          b
            ..vonTag = vonTag.value
            ..vonMonat = vonMonat.value
            ..bisTag = bisTag.value
            ..bisMonat = bisMonat.value;
        } else if (zeitSpanneTyp.value == ZeitSpanneTyp.von) {
          b
            ..vonTag = vonTag.value
            ..vonMonat = vonMonat.value;
        } else if (zeitSpanneTyp.value == ZeitSpanneTyp.bis) {
          b
            ..bisTag = bisTag.value
            ..bisMonat = bisMonat.value;
        }
      }
      b.textConcretisation = textConcretisation.value;
    });
  }
}
