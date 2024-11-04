import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/concretisations/german_decimal_input_formatter.dart';
import 'package:json_to_survey/src/widgets/concretisations/zeit_vorgabe_concretisation/zeit_vorgabe_view_model.dart';

class ZeitVorgabeConcretisationView extends StatelessWidget {
  ZeitVorgabeConcretisationView({super.key, required this.concretisation, required this.onChanged})
      : viewModel = ZeitVorgabeViewModel(concretisation);

  final ValueChanged<ZeitVorgabeConcretisation> onChanged;

  final ZeitVorgabeViewModel viewModel;
  final ZeitVorgabeConcretisation concretisation;

// TODO: ist so viel View Code und so viele Behaviours notwendig?  Nein. LG Elli
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: viewModel.toggleButtonStreams,
        builder: (context, snapshot) {
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    AppLocalizations.of(context)!.timeLimitText,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ],
              ),
            ),
            ToggleButtons(
              isSelected: viewModel.selectedTypToggleButton,
              onPressed: (pressedIndex) {
                viewModel.typ.value = ZeitVorgabeTyp.values[pressedIndex];
              },
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(AppLocalizations.of(context)!.exactDateLabelText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(AppLocalizations.of(context)!.timeSpanLabelText),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(AppLocalizations.of(context)!.durationInHoursLabelText),
                )
              ],
            ),
            if ((viewModel.typ.value == ZeitVorgabeTyp.zeitSpanne))
              ToggleButtons(
                isSelected: viewModel.selectedZeitSpanneTypToggleButton,
                onPressed: (pressedIndex) {
                  viewModel.zeitSpanneTyp.value = ZeitSpanneTyp.values[pressedIndex];
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(AppLocalizations.of(context)!.fromDateLabelText),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(AppLocalizations.of(context)!.toDateLabelText),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(AppLocalizations.of(context)!.fromToDateLabelText),
                  )
                ],
              ),
            if ((viewModel.typ.value == ZeitVorgabeTyp.zeitSpanne))
              ToggleButtons(
                isSelected: viewModel.selectedDatumsAngabeGenauigkeitToggleButton,
                onPressed: (pressedIndex) {
                  viewModel.datumsAngabeGenauigkeit.value = DatumsAngabeGenauigkeit.values[pressedIndex];
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(AppLocalizations.of(context)!.dayAndMonthLabelText),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(AppLocalizations.of(context)!.onlyMonthLabelText),
                  )
                ],
              ),
            Row(children: [
              if ((viewModel.typ.value == ZeitVorgabeTyp.exakt) ||
                  ((viewModel.typ.value == ZeitVorgabeTyp.zeitSpanne && viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.von ||
                          viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.vonBis) &&
                      (viewModel.datumsAngabeGenauigkeit.value == DatumsAngabeGenauigkeit.tagUndMonat)))
                Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder<String?>(
                            stream: viewModel.vonTag,
                            builder: (context, snapshot) {
                              final editingController = TextEditingController(text: viewModel.vonTag.value);

                              return Focus(
                                  child: TextFormField(
                                      key: ObjectKey(viewModel.vonTag.value),
                                      controller: editingController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      decoration: viewModel.typ.value == ZeitVorgabeTyp.exakt
                                          ? InputDecoration(labelText: AppLocalizations.of(context)!.dayEditLabelText)
                                          : InputDecoration(labelText: AppLocalizations.of(context)!.fromDayEditLabelText),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                                        }
                                        return null;
                                      }),
                                  onFocusChange: (gotFocus) {
                                    final lostFocus = !gotFocus;

                                    if (lostFocus) {
                                      viewModel.vonTag.value = editingController.value.text;

                                      onChanged(viewModel.model);
                                    }
                                  });
                            }),
                      ),
                    )),
              if (((viewModel.typ.value == ZeitVorgabeTyp.zeitSpanne &&
                          (viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.von || viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.vonBis)) ||
                      viewModel.typ.value == ZeitVorgabeTyp.exakt) &&
                  (viewModel.datumsAngabeGenauigkeit.value == DatumsAngabeGenauigkeit.tagUndMonat ||
                      viewModel.datumsAngabeGenauigkeit.value == DatumsAngabeGenauigkeit.monat))
                Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder<String?>(
                            stream: viewModel.vonMonat,
                            builder: (context, snapshot) {
                              final editingController = TextEditingController(text: viewModel.vonMonat.value);

                              return Focus(
                                  child: TextFormField(
                                    key: ObjectKey(viewModel.vonMonat.value),
                                    controller: editingController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    decoration: viewModel.typ.value == ZeitVorgabeTyp.exakt
                                        ? InputDecoration(labelText: AppLocalizations.of(context)!.monthEditLabelText)
                                        : InputDecoration(labelText: AppLocalizations.of(context)!.fromDayEditLabelText),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                                      }
                                      return null;
                                    },
                                  ),
                                  onFocusChange: (gotFocus) {
                                    final lostFocus = !gotFocus;

                                    if (lostFocus) {
                                      viewModel.vonMonat.value = editingController.value.text;

                                      onChanged(viewModel.model);
                                    }
                                  });
                            }),
                      ),
                    )),
              if ((viewModel.typ.value == ZeitVorgabeTyp.zeitSpanne && viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.bis ||
                      viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.vonBis) &&
                  (viewModel.datumsAngabeGenauigkeit.value == DatumsAngabeGenauigkeit.tagUndMonat))
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<String?>(
                          stream: viewModel.bisTag,
                          builder: (context, snapshot) {
                            final editingController = TextEditingController(text: viewModel.bisTag.value);

                            return Focus(
                                child: TextFormField(
                                  key: ObjectKey(viewModel.bisTag.value),
                                  controller: editingController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  decoration: InputDecoration(labelText: AppLocalizations.of(context)!.toDayEditLabelText),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                                    }
                                    return null;
                                  },
                                ),
                                onFocusChange: (gotFocus) {
                                  final lostFocus = !gotFocus;

                                  if (lostFocus) {
                                    viewModel.bisTag.value = editingController.value.text;

                                    onChanged(viewModel.model);
                                  }
                                });
                          }),
                    ),
                  ),
                ),
              if ((viewModel.typ.value == ZeitVorgabeTyp.zeitSpanne && viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.bis ||
                      viewModel.zeitSpanneTyp.value == ZeitSpanneTyp.vonBis) &&
                  (viewModel.datumsAngabeGenauigkeit.value == DatumsAngabeGenauigkeit.tagUndMonat ||
                      viewModel.datumsAngabeGenauigkeit.value == DatumsAngabeGenauigkeit.monat))
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<String?>(
                          stream: viewModel.bisMonat,
                          builder: (context, snapshot) {
                            final editingController = TextEditingController(text: viewModel.bisMonat.value);

                            return Focus(
                                child: TextFormField(
                                    key: ObjectKey(viewModel.bisMonat.value),
                                    controller: editingController,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.toMonthEditLabelText),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                                      }
                                      return null;
                                    }),
                                onFocusChange: (gotFocus) {
                                  final lostFocus = !gotFocus;

                                  if (lostFocus) {
                                    viewModel.bisMonat.value = editingController.value.text;

                                    onChanged(viewModel.model);
                                  }
                                });
                          }),
                    ),
                  ),
                ),
              if (viewModel.typ.value == ZeitVorgabeTyp.dauerInStunden)
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<String?>(
                          stream: viewModel.dauerInStunden,
                          builder: (context, snapshot) {
                            final editingController = TextEditingController(text: viewModel.dauerInStunden.value);

                            return Focus(
                                child: TextFormField(
                                  key: ObjectKey(viewModel.dauerInStunden.value),
                                  controller: editingController,
                                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                  inputFormatters: germanDecimalInputFormatter,
                                  decoration: InputDecoration(labelText: AppLocalizations.of(context)!.durationInHoursLabelText),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                                    }
                                    return null;
                                  },
                                ),
                                onFocusChange: (gotFocus) {
                                  final lostFocus = !gotFocus;

                                  if (lostFocus) {
                                    viewModel.dauerInStunden.value = editingController.value.text;

                                    onChanged(viewModel.model);
                                  }
                                });
                          }),
                    ),
                  ),
                ),
            ]),
            Row(children: [
              Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StreamBuilder<String?>(
                          stream: viewModel.textConcretisation,
                          builder: (context, snapshot) {
                            final editingController = TextEditingController(text: viewModel.textConcretisation.value);

                            return Focus(
                                child: TextFormField(
                                  key: ObjectKey(viewModel.textConcretisation.value),
                                  controller: editingController,
                                  decoration: InputDecoration(labelText: AppLocalizations.of(context)!.textConcretisationLabelText),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                                    }
                                    return null;
                                  },
                                ),
                                onFocusChange: (gotFocus) {
                                  final lostFocus = !gotFocus;

                                  if (lostFocus) {
                                    viewModel.textConcretisation.value = editingController.value.text;

                                    onChanged(viewModel.model);
                                  }
                                });
                          }),
                    ),
                  ))
            ])
          ]);
        });
  }
}
