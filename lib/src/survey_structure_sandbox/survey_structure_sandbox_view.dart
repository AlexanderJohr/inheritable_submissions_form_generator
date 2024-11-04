import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:json_to_survey/src/settings_view_button.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/choice_question_page.dart';
import 'package:rxdart/rxdart.dart';

import '../settings/settings_view.dart';
import '../temp/met1_config.dart';
import '../temp/met1_config_all_multiple_choice.dart';
import '../widgets/app_state.dart';
import '../widgets/choice_question_page_history.dart';
import '../widgets/questions_list_view.dart';

class SurveyStructureSandboxPage extends Page {
  const SurveyStructureSandboxPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        return SurveyStructureSandboxView();
      },
    );
  }
}

class SurveyStructureSandboxView extends StatelessWidget {
  SurveyStructureSandboxView({super.key});

  static const routeName = '/survey-structure-sandbox';

  BehaviorSubject<String> jsonSubject = BehaviorSubject.seeded("");

  set json(String value) {
    try {
      final deserializedJson = jsonDecode(value);
      final deserializedSurvey = SurveyStructure.fromJson(deserializedJson);
      if (deserializedSurvey == null) {
        surveyStructureSubject.value = null;
      }
      surveyStructureSubject.value = deserializedSurvey;
      errorText = null;
    } catch (e) {
      surveyStructureSubject.value = null;
      errorText = e.toString();
    }
  }

  BehaviorSubject<SurveyStructure?> surveyStructureSubject =
      BehaviorSubject.seeded(null);

  set survey(Survey) {}

  String? errorText;

  TextEditingController jsonTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: const [
          SettingsViewButton(),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  ElevatedButton(
                    child: const Text("Single Choice Question"),
                    onPressed: () {
                      final survey = SurveyStructure((b) {
                        b.questions = ListBuilder([
                          SingleChoiceQuestion(
                            (b) {
                              b
                                ..id = "bdl"
                                ..title = "Bundesland"
                                ..choices = ListBuilder([
                                  Choice(
                                    (b) {
                                      b
                                        ..title = "Baden-Württemberg"
                                        ..value = "bw";
                                    },
                                  ),
                                  Choice(
                                    (b) {
                                      b
                                        ..title = "Bayern"
                                        ..value = "by";
                                    },
                                  ),
                                ]);
                            },
                          )
                        ]);
                      });

                      const JsonEncoder encoder = JsonEncoder.withIndent('  ');

                      final serializedSurvey = serializers.serialize(survey);

                      final json = encoder.convert(serializedSurvey);
                      jsonTextEditingController.text = json;
                      this.json = json;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      child: const Text("Anbaudiversität"),
                      onPressed: () {
                        final survey = SurveyStructure((b) {
                          b.questions = ListBuilder([
                            MultipleChoiceQuestion(
                              (b) {
                                b
                                  ..id = "vorgabe-art-mischung-saatgut"
                                  ..title =
                                      "Vorgabe an die Art/Mischung des Saatgutes"
                                  ..choices = ListBuilder([
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "keine Vorgabe"
                                          ..value = "keine-Vorgabe";
                                      },
                                    ),
                                    Choice(
                                      (b) {
                                        b
                                          ..title =
                                              "vorgeschriebene Anzahl von Arten/Kulturen, die zeitgleich angebaut werden sollen, Anzahl nachzuweisender Kennarten"
                                          ..value =
                                              "vorgeschr-anzahl-zeitgleich-kulturen";
                                      },
                                    ),
                                    Choice(
                                      (b) {
                                        b
                                          ..title =
                                              "Vorgaben zu Kulturen (welche, wie viel wird konkretisiert)"
                                          ..value = "vorg-kulturen"
                                          ..subQuestions = ListBuilder([
                                            MultipleChoiceQuestion(
                                              (b) {
                                                b
                                                  ..id = "vorg-sorten-kulturen"
                                                  ..title =
                                                      "Welche Sorten/Kulturen sind vorgegeben?"
                                                  ..choices = ListBuilder([
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title = "Getreide"
                                                          ..value = "getreide";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "Leguminosen (alle, auch in Gemengen)"
                                                          ..value = "legum";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "kleinkörnige Leguminosen (auch in Gemengen)"
                                                          ..value =
                                                              "kleinkörn-legum";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "großkörnige Leguminosen (auch in Gemengen)"
                                                          ..value =
                                                              "großkörn-legum";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "blühende Arten"
                                                          ..value =
                                                              "blüh-arten";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "konkrete Blühmischung"
                                                          ..value =
                                                              "konkr-blühmisch";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "Auswahlliste möglicher Arten/Kulturen (Referenzliste)"
                                                          ..value =
                                                              "auswahl-kulturen";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title = "Brache"
                                                          ..value = "brache";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "Sommerkulturen"
                                                          ..value =
                                                              "sommerkulturen";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "seltene Kulturen"
                                                          ..value =
                                                              "seltene-kulturen";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "Grünland, Feld- oder Ackergras, Gräser"
                                                          ..value =
                                                              "grünland-feld-ackergras-gräser";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "Hackfrüchte"
                                                          ..value =
                                                              "hackfrüchte";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title = "Gemüse"
                                                          ..value = "gemüse";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "winterharte Zwischenfrüchte"
                                                          ..value =
                                                              "winterhart-zwfrüchte";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "abfrierende Zwischenfrüchte"
                                                          ..value =
                                                              "abfrier-zwfrüchte";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "beliebige Kulturarten"
                                                          ..value =
                                                              "beliebig-kulturarten";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title =
                                                              "Mischung ohne Leguminosen"
                                                          ..value =
                                                              "mischung-ohne-legum";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title = "Mais"
                                                          ..value = "mais";
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title = "Sonstige"
                                                          ..value = "sonstige";
                                                      },
                                                    ),
                                                  ]);
                                              },
                                            )
                                          ]);
                                      },
                                    ),
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "Untersaat"
                                          ..value = "untersaat"
                                          ..subQuestions = ListBuilder([
                                            ReuseSurveyEntry(
                                              (b) {
                                                b.reuseId =
                                                    "vorg-sorten-kulturen";
                                              },
                                            )
                                          ]);
                                      },
                                    ),
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "Zwischenfrüchte"
                                          ..value = "zwischenfrüchte"
                                          ..subQuestions = ListBuilder([
                                            ReuseSurveyEntry(
                                              (b) {
                                                b.reuseId =
                                                    "vorg-sorten-kulturen";
                                              },
                                            )
                                          ]);
                                      },
                                    ),
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "Blühmischung"
                                          ..value = "blühmischung"
                                          ..subQuestions = ListBuilder([
                                            ReuseSurveyEntry(
                                              (b) {
                                                b.reuseId =
                                                    "vorg-sorten-kulturen";
                                              },
                                            )
                                          ]);
                                      },
                                    ),
                                  ]);
                              },
                            )
                          ]);
                        });

                        const JsonEncoder encoder =
                            JsonEncoder.withIndent('  ');

                        final serializedSurvey = serializers.serialize(survey);

                        final json = encoder.convert(serializedSurvey);
                        jsonTextEditingController.text = json;
                        this.json = json;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      child: const Text("MET 1 Konfiguration"),
                      onPressed: () {
                        const json = met1Config;

                        const JsonEncoder encoder =
                            JsonEncoder.withIndent('  ');

                        final jsonString = encoder.convert(json);

                        jsonTextEditingController.text = jsonString;
                        this.json = jsonString;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      child: const Text("MET 1 Konfiguration Alles erlaubt"),
                      onPressed: () {
                        const json = met1AllMultipleChoiceConfig;

                        const JsonEncoder encoder =
                            JsonEncoder.withIndent('  ');

                        final jsonString = encoder.convert(json);

                        jsonTextEditingController.text = jsonString;
                        this.json = jsonString;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      child: const Text("Sub Questions"),
                      onPressed: () {
                        final survey = SurveyStructure((b) {
                          b.questions = ListBuilder([
                            MultipleChoiceQuestion(
                              (b) {
                                b
                                  ..id = "F1"
                                  ..title = "F1"
                                  ..choices = ListBuilder([
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "A1a"
                                          ..value = "A1a"
                                          ..subQuestions = ListBuilder([
                                            SingleChoiceQuestion(
                                              (b) {
                                                b
                                                  ..id = "F1.1"
                                                  ..title = "F1.1"
                                                  ..choices = ListBuilder([
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title = "A1.1a"
                                                          ..value = "A1.1a"
                                                          ..subQuestions =
                                                              ListBuilder([
                                                            SingleChoiceQuestion(
                                                              (b) {
                                                                b
                                                                  ..id =
                                                                      "F1.1.1"
                                                                  ..title =
                                                                      "F1.1.1"
                                                                  ..choices =
                                                                      ListBuilder([
                                                                    Choice(
                                                                      (b) {
                                                                        b
                                                                          ..title =
                                                                              "A1.1.1a"
                                                                          ..value =
                                                                              "A1.1.1a";
                                                                      },
                                                                    ),
                                                                    Choice(
                                                                      (b) {
                                                                        b
                                                                          ..title =
                                                                              "A1.1.1b"
                                                                          ..value =
                                                                              "A1.1.1b";
                                                                      },
                                                                    ),
                                                                  ]);
                                                              },
                                                            )
                                                          ]);
                                                      },
                                                    ),
                                                    Choice(
                                                      (b) {
                                                        b
                                                          ..title = "A1.1b"
                                                          ..value = "A1.1b";
                                                      },
                                                    ),
                                                  ]);
                                              },
                                            )
                                          ]);
                                      },
                                    ),
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "Bayern"
                                          ..value = "by";
                                      },
                                    ),
                                  ]);
                              },
                            )
                          ]);
                        });

                        const JsonEncoder encoder =
                            JsonEncoder.withIndent('  ');

                        final serializedSurvey = serializers.serialize(survey);

                        final json = encoder.convert(serializedSurvey);
                        jsonTextEditingController.text = json;
                        this.json = json;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      child: const Text("Multiple Choice Question"),
                      onPressed: () {
                        final survey = SurveyStructure((b) {
                          b.questions = ListBuilder([
                            MultipleChoiceQuestion(
                              (b) {
                                b
                                  ..id = "tech"
                                  ..title = "Technische Anforderungen"
                                  ..choices = ListBuilder([
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "Reduzierter Reifendruck"
                                          ..value = "red_reifen_druck";
                                      },
                                    ),
                                    Choice(
                                      (b) {
                                        b
                                          ..title = "Mulchen/Eggen"
                                          ..value = "mulch_egge";
                                      },
                                    ),
                                  ]);
                              },
                            )
                          ]);
                        });

                        const JsonEncoder encoder =
                            JsonEncoder.withIndent('  ');

                        final serializedSurvey = serializers.serialize(survey);

                        final json = encoder.convert(serializedSurvey);
                        jsonTextEditingController.text = json;
                        this.json = json;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ElevatedButton(
                      child: const Text("Link other Survey"),
                      onPressed: () {
                        final survey = SurveyStructure((b) {
                          b.questions = ListBuilder([
                            LinkOtherSurveyQuestion(
                              (b) {
                                b
                                  ..id = "top-up"
                                  ..title = "Basismaßnahme zur TopUp-Maßnahme";
                              },
                            )
                          ]);
                        });

                        const JsonEncoder encoder =
                            JsonEncoder.withIndent('  ');

                        final serializedSurvey = serializers.serialize(survey);

                        final json = encoder.convert(serializedSurvey);
                        jsonTextEditingController.text = json;
                        this.json = json;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: StreamBuilder(
                        stream: jsonSubject,
                        builder: (context, snapshot) {
                          return TextField(
                            style: const TextStyle(fontFamily: "Consolas"),
                            maxLines: null,
                            expands: true,
                            controller: jsonTextEditingController,
                            onChanged: (value) {
                              json = value;
                            },
                          );
                        })),
                Expanded(
                    flex: 1,
                    child: ChoiceQuestionPageHistory(
                      alwaysReplaceHistory: true,
                      child: StreamBuilder(
                          stream: surveyStructureSubject,
                          builder: (context, snapshot) {
                            final questions = surveyStructureSubject
                                    .value?.questions
                                    .toList() ??
                                [];
                            return QuestionsListView(
                                path: SurveyEntryPath(),
                                questions: questions,
                                errorText: errorText,
                                shrinkWrap: false);
                          }),
                    )),
                Expanded(
                    flex: 1,
                    child: StreamBuilder(
                        stream: AppState.of(context)
                            .sidebarNavigatorService
                            .multipleChoiceSelectionPageHistory,
                        builder: (context, snapshot) {
                          return Navigator(
                            key: AppState.of(context)
                                .sidebarNavigatorService
                                .sideBarNavigator,
                            pages: AppState.of(context)
                                .sidebarNavigatorService
                                .multipleChoiceSelectionPageHistory
                                .value
                                .toList(),
                            onPopPage: (route, result) {
                              if (!route.didPop(result)) {
                                return false;
                              }
                              if (route.settings is ChoiceQuestionPage) {
                                AppState.of(context)
                                    .sidebarNavigatorService
                                    .popPage();
                              }
                              return true;
                            },
                          );
                        }))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
