import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:json_to_survey/src/value_types/survey.dart';

import 'mengen_vorgabe_view_model.dart';

class MengenVorgabeConcretisationView extends StatefulWidget {
  MengenVorgabeConcretisationView(
      {super.key,
      required this.concretisation,
      required this.path,
      required this.question,
      required this.onChanged})
      : viewModel = MengenVorgabeViewModel(concretisation);

  final SurveyEntryPath path;
  final ChoiceQuestion question;

  final MengenVorgabeViewModel viewModel;
  final ValueChanged<MengenVorgabeConcretisation> onChanged;

  final MengenVorgabeConcretisation concretisation;

  @override
  State<MengenVorgabeConcretisationView> createState() =>
      _MengenVorgabeConcretisationViewState();
}

class _MengenVorgabeConcretisationViewState
    extends State<MengenVorgabeConcretisationView> {
  final vorzeichenQuestion = SingleChoiceQuestion.fromJson({
    "type": "SingleChoiceQuestion",
    "id": "vorz",
    "title": "Vorzeichen",
    "choices": [
      {"value": "o", "title": "NA"},
      {"value": "lt", "title": "<"},
      {"value": "gt", "title": ">"},
      {"value": "e", "title": "="}
    ]
  })!;

  final zaehlerDerEinheitQuestion = SingleChoiceQuestion.fromJson({
    "type": "SingleChoiceQuestion",
    "id": "zaehler",
    "title": "Zähler der Einheit",
    "choices": [
      {"value": "o", "title": "NA"},
      {"value": "gv", "title": "GV"},
      {"value": "rgv", "title": "RGV"},
      {"value": "prozent", "title": "%"},

      {"value": "euro", "title": "€"},
      {"value": "kubikmeter", "title": "m³"},
      {"value": "kg", "title": "kg"},

      {"value": "stueck", "title": "Stück / Anzahl"},

      {
        "value": "ha_lf",
        "title": "ha LF",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["lf"]
        }
      },
      {
        "value": "ha_gl",
        "title": "ha GL",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["gl", "lf", "hff"]
        }
      },
      {
        "value": "ha",
        "title": "ha",
        "enabledIf": {
          "type": "ContainsNoneOf",
          "field": "mch_ziel_fl",
          "values": ["o"]
        }
      },
      {
        "value": "ha_hff",
        "title": "ha HFF",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["lf", "hff", "gl"]
        }
      },
      {
        "value": "ha_al",
        "title": "ha AL",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["al", "lf", "hff"]
        }
      },

      {"value": "dgl", "title": "ha Dauergrünland (DGL)"},
      {
        "value": "ha_ff_kult",
        "title": "ha förderfähige Ackerfläche /-kulturen / Grünland"
      },

    ]
  })!;

  final nennerDerEinheitQuestion = SingleChoiceQuestion.fromJson({
    "type": "SingleChoiceQuestion",
    "id": "nenner",
    "title": "Nenner der Einheit",
    "choices": [
      {
        "value": "o",
        "title": "NA",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["o"]
        }
      },
      {
        "value": "ha_lf",
        "title": "ha LF",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["lf"]
        }
      },
      {
        "value": "ha_gl",
        "title": "ha GL",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["gl", "lf", "hff"]
        }
      },
      {
        "value": "ha",
        "title": "ha",
        "enabledIf": {
          "type": "ContainsNoneOf",
          "field": "mch_ziel_fl",
          "values": ["o"]
        }
      },
      {
        "value": "ha_hff",
        "title": "ha HFF",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["lf", "hff", "gl"]
        }
      },
      {
        "value": "ha_al",
        "title": "ha AL",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["al", "lf", "hff"]
        }
      },
      {
        "value": "schlag",
        "title": "Schlag",
        "enabledIf": {
          "type": "ContainsNoneOf",
          "field": "mch_ziel_fl",
          "values": ["o", "biotop_le"]
        }
      },
      {
        "value": "akult",
        "title": "förderfähige Ackerkulturen",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["al", "lf"]
        }
      },
      {
        "value": "m_lang",
        "title": "Meter lang",
        "enabledIf": {
          "type": "ContainsNoneOf",
          "field": "mch_ziel_fl",
          "values": ["o"]
        }
      },
      {
        "value": "m_breit",
        "title": "Meter breit",
        "enabledIf": {
          "type": "ContainsNoneOf",
          "field": "mch_ziel_fl",
          "values": ["o"]
        }
      },

      {"value": "dgl", "title": "ha Dauergrünland (DGL)"},
      {
        "value": "ha_ff_kult",
        "title": "ha förderfähige Ackerfläche /-kulturen / Grünland"
      },
      {
        "value": "n_arten",
        "title": "Anzahl Arten / Kennarten / förderfähige Kulturen"
      },
      {"value": "gv", "title": "Großvieheinheiten GV"},
      {"value": "rgv", "title": "Raufutterfressende Großvieheinheiten RGV"},

      {"value": "schnitte", "title": "Schnitte "},

      {"value": "baeume_tiere", "title": "Bäume / Tiere"},
    ]
  })!;

  MengenVorgabeViewModel get viewModel => widget.viewModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: widget.viewModel.exactValueOrSpan,
        builder: (context, snapshot) {
          final zahlMinEditingController =
              TextEditingController(text: viewModel.zahlMin.value);

          final zahlMaxEditingController =
              TextEditingController(text: viewModel.zahlMax.value);

          final textConcretisationEditingController =
              TextEditingController(text: viewModel.textConcretisation.value);

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.quantityAndAraSpecificationText,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
              ToggleButtons(
                isSelected: widget.viewModel.exactValueOrSpan.value,
                onPressed: (pressedIndex) {
                  widget.viewModel.exactValueOrSpan.value = [
                    pressedIndex == 0,
                    pressedIndex == 1
                  ];
                },
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(AppLocalizations.of(context)!.exactValueLabelText),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: Text(AppLocalizations.of(context)!.valueSpanLabelText),
                  )
                ],
              ),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex: 0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        hint: Text(vorzeichenQuestion.title),
                        value: viewModel.vorzeichenMin.value,
                        items: vorzeichenQuestion.choices.map((Choice choice) {
                          return DropdownMenuItem<String>(
                            value: choice.value,
                            child: Text(choice.title),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            viewModel.vorzeichenMin.value = value;
                            widget.onChanged(viewModel.model);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Focus(
                        child: TextFormField(
                            controller: zahlMinEditingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                              }

                              return null;
                            }),
                        onFocusChange: (gotFocus) {
                          final lostFocus = !gotFocus;

                          if (lostFocus) {
                            viewModel.zahlMin.value =
                                zahlMinEditingController.text;

                            widget.onChanged(viewModel.model);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                if (widget.viewModel.valueSpan)
                  Expanded(
                    flex: 0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<String>(
                          hint: Text("${vorzeichenQuestion.title} Max"),
                          value: viewModel.vorzeichenMax.value,
                          items:
                              vorzeichenQuestion.choices.map((Choice choice) {
                            return DropdownMenuItem<String>(
                              value: choice.value,
                              child: Text(choice.title),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              viewModel.vorzeichenMax.value = value;
                              widget.onChanged(viewModel.model);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                if (widget.viewModel.valueSpan)
                  Expanded(
                    flex: 1,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Focus(
                          child: TextFormField(
                              controller: zahlMaxEditingController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                                }

                                return null;
                              }),
                          onFocusChange: (gotFocus) {
                            final lostFocus = !gotFocus;

                            if (lostFocus) {
                              viewModel.zahlMax.value =
                                  zahlMaxEditingController.text;
                              widget.onChanged(viewModel.model);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex: 0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        hint: Text(zaehlerDerEinheitQuestion.title),
                        value: viewModel.zaehler.value,
                        items: zaehlerDerEinheitQuestion.choices
                            .map((Choice choice) {
                          return DropdownMenuItem<String>(
                            value: choice.value,
                            child: Text(choice.title),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            viewModel.zaehler.value = value;
                            widget.onChanged(viewModel.model);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton<String>(
                        hint: Text(nennerDerEinheitQuestion.title),
                        value: viewModel.nenner.value,
                        items: nennerDerEinheitQuestion.choices
                            .map((Choice choice) {
                          return DropdownMenuItem<String>(
                            value: choice.value,
                            child: Text(choice.title),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            viewModel.nenner.value = value;
                            widget.onChanged(viewModel.model);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ]),
              Row(mainAxisSize: MainAxisSize.min, children: [
                Expanded(
                  flex: 1,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Focus(
                        child: TextFormField(
                            controller: textConcretisationEditingController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppLocalizations.of(context)!.pleaseEnterTextMessage;
                              }

                              return null;
                            },
                            decoration: InputDecoration(
                                labelText: AppLocalizations.of(context)!.textConcretisationLabelText)),
                        onFocusChange: (gotFocus) {
                          final lostFocus = !gotFocus;

                          if (lostFocus) {
                            viewModel.textConcretisation.value =
                                textConcretisationEditingController.text;
                            widget.onChanged(viewModel.model);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ])
            ],
          );
        });
  }
}

class ZahlFormField extends StatelessWidget {
  const ZahlFormField({
    super.key,
    required this.editingController,
  });

  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Focus(
        child: TextFormField(
            controller: editingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.pleaseEnterTextMessage;
              }

              return null;
            }),
        onFocusChange: (gotFocus) {
          final lostFocus = !gotFocus;

          // TODO: Remove?
          if (lostFocus) {
          }
        },
      ),
    );
  }
}









































