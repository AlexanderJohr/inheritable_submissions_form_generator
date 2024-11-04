// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction

import 'dart:convert';
import 'dart:io';
import 'package:dotenv/dotenv.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:built_collection/built_collection.dart';
import 'package:collection/collection.dart';
import 'package:dartssh2/dartssh2.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_to_survey/src/store/local_store.dart';
import 'package:json_to_survey/src/value_types/submission_extensions.dart';
import 'package:json_to_survey/src/value_types/survey.dart';
import 'package:json_to_survey/src/widgets/app_state.dart';
import 'package:postgres/postgres.dart';

class JsonXPathNode {
  final String path;
  final dynamic value;

  JsonXPathNode(this.path, this.value);
}

class JsonXPathIterator extends Iterable<JsonXPathNode> {
  final Map<String, dynamic> json;

  JsonXPathIterator(this.json);

  @override
  Iterator<JsonXPathNode> get iterator => _JsonXPathIterator(json);
}

class _JsonXPathIterator implements Iterator<JsonXPathNode> {
  final List<JsonXPathNode> _nodes = [];
  int _currentIndex = -1;

  _JsonXPathIterator(Map<String, dynamic> json) {
    _traverseJson(json, '');
  }

  void _traverseJson(dynamic node, String path) {
    if (node is Map<String, dynamic>) {
      node.forEach((key, value) {
        String newPath = path.isEmpty ? key : '$path/$key';
        _nodes.add(JsonXPathNode(newPath, value));
        _traverseJson(value, newPath);
      });
    } else if (node is List) {
      for (int i = 0; i < node.length; i++) {
        String newPath = '$path[$i]';
        _nodes.add(JsonXPathNode(newPath, node[i]));
        _traverseJson(node[i], newPath);
      }
    } else {
      _nodes.add(JsonXPathNode(path, node));
    }
  }

  @override
  JsonXPathNode get current => _nodes[_currentIndex];

  @override
  bool moveNext() {
    if (_currentIndex + 1 < _nodes.length) {
      _currentIndex++;
      return true;
    }
    return false;
  }
}

void main() {
  group('PostgreSQL Notification Listener', () {
    test('iterateJson', () async {
      void iterateJson(dynamic node, {required String path}) {
        if (node is Map<String, dynamic>) {
          node.forEach((key, value) {
            String newPath = path.isEmpty ? key : '$path/$key';
            print(newPath);
            iterateJson(value, path: newPath);
          });
        } else if (node is List) {
          for (int i = 0; i < node.length; i++) {
            String newPath = '$path[$i]';
            print(newPath);
            iterateJson(node[i], path: newPath);
          }
        }
      }

      String jsonString = '''{
    "type": "Survey",
    "questions": [
      {
        "id": "dueng_vg",
        "type": "MultipleChoiceQuestion",
        "title": "Düngung",
        "choices": [
          {"title": "keine Angabe / ohne Einschränkung", "value": "o"},
          {
            "title": "keine Düngung erlaubt",
            "value": "keine",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "title": "besondere Ausbringungstechnik",
            "value": "ausbring_techn",
            "description": "(bspw. Schleppschlauch) mit weiteren Angaben in Technische Anforderungen",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "title": "verkürzte oder vorgegebene Ausbringungszeiten",
            "value": "ausbring_t_kurz",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "title": "reduzierte Düngungsmenge",
            "value": "dueng_red",
            "description": "(erlaubte Düngemenge auf ein Jahr hochrechnen, wenn Menge pro Gabe und Anzahl Gaben benannt sind)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "title": "Beschränkung auf spezifische Düngemittel",
            "value": "dueng_spez_art",
            "subQuestions": [
              {
                "id": "dueng_art",
                "type": "MultipleChoiceQuestion",
                "title": "Düngung Art",
                "choices": [
                  {"title": "keine Angabe", "value": "o"},
                  {
                    "title": "organisch",
                    "value": "dueng_org_tier_liqu",
                    "subQuestions": [
                      {
                        "id": "org_dueng_spez",
                        "type": "MultipleChoiceQuestion",
                        "title": "organisches Düngemittel",
                        "choices": [
                          {"title": "tierisch, fest (Festmist)", "value": "dueng_org_tier_fest"},
                          {"title": "tierisch, flüssig (bspw. Gülle)", "value": "dueng_org_tier_liqu"},
                          {"title": "pflanzlich (Gärrest)", "value": "dueng_org_pflz"},
                          {"title": "nicht genauer differenziert: Wirtschaftsdünger", "value": "dueng_org"}
                        ]
                      }
                    ]
                  },
                  {"title": "mineralisch", "value": "dueng_miner"},
                  {
                    "title": "Bestimmte Inhalts- oder Nährstoffe sind zulässig oder ausgeschlossen.",
                    "value": "dueng_stoff",
                    "description": "Als Freitext angeben, wie die Auflage lautet."
                  },
                  {"title": "Düngung auf Grundlage einer Bodenuntersuchung", "value": "dueng_bu"},
                  {
                    "title": "Einsatz stabilisierter Dünger (bspw. CULTAN-Verfahren, N-Depotdüngung)",
                    "value": "stabil_dueng",
                    "enabledIf": {
                      "type": "CheckAllConditions",
                      "conditions": [
                        {"type": "ContainsAnyOf", "field": "dueng_vg", "values": ["dueng_spez_art", "erbt"]},
                        {"type": "ContainsNoneOf", "field": "mch_foerd_klass", "values": ["azl", "twm_ziel"]},
                        {"type": "ContainsNoneOf", "field": "mch_kat", "values": ["anlage_pflege", "umwandlg", "bes_kult_rass"]},
                        {"type": "ContainsNoneOf", "field": "mch_ziel_einh", "values": ["rgve"]}
                      ]
                    }
                  },
                  {"title": "wird in Varianten / Untermaßnahmen definiert", "value": "erbt"},
                  {"title": "bitte um Unterstützung", "value": "contact"}
                ]
              },
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {"title": "wird in Varianten / Untermaßnahmen definiert", "value": "erbt"},
          {"title": "bitte um Unterstützung", "value": "contact"}
        ],
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {"type": "ContainsNoneOf", "field": "mch_ziel_fl", "values": ["wald"]},
            {"type": "ContainsAnyOf", "field": "mch_ziel_einh", "values": ["ha", "o", "erbt"]}
          ]
        }
      }
    ]
  }''';
      Map<String, dynamic> json = jsonDecode(jsonString);

      final surveyStructure = SurveyStructure.fromJson(json);
      final questions = surveyStructure?.questions;

      expect(true, isTrue);
    });
  });

  group('PostgreSQL Notification Listener', () {
    late PostgreSQLConnection connection;
    DotEnv env = DotEnv(includePlatformEnvironment: true);

    setUp(() async {
      var env = DotEnv(includePlatformEnvironment: true);
      env.load();

      connection = PostgreSQLConnection(
        env['DB_HOST']!,
        int.parse(env['DB_PORT']!),
        env['DB_NAME']!,
        username: env['DB_USERNAME'],
        password: env['DB_PASSWORD'],
      );

      await connection.open();
    });

    tearDown(() async {
      await connection.close();
    });

    test('Listen for notifications', () async {
      const channelName = 'row_changes';
      const payload = 'test_payload';

      var notificationReceived = false;

      // Listen to the channel
      connection.notifications.listen((event) {
        print(event.payload);
        if (event.channel == channelName && event.payload == payload) {
          notificationReceived = true;
        }
      });

      // Ensure we're listening
      await connection.execute('LISTEN $channelName');

      // Simulate notificationrow_changes
      await connection.execute("NOTIFY $channelName, '$payload'");

      // Wait a short time for the notification to be received
      await Future.delayed(const Duration(seconds: 120));

      expect(notificationReceived, isTrue);
    });
  });

  group('Survey serializer', () {
    test('test', () {
      print('Using sqlite3 ${sqlite3.version}');

      // Create a new in-memory database. To use a database backed by a file, you
      // can replace this with sqlite3.open(yourFilePath).
      final db = sqlite3.openInMemory();

      // Create a table and insert some data
      db.execute('''
    CREATE TABLE t0(
  a INTEGER PRIMARY KEY,
  b DATE DEFAULT CURRENT_TIMESTAMP,
  c INTEGER
);
  ''');

      // Create a table and insert some data
      db.execute('''
    CREATE TABLE artists (
      id INTEGER NOT NULL PRIMARY KEY,
      name TEXT NOT NULL
    );
  ''');

      final resultReturning = db.select("INSERT INTO t0(c) VALUES(random()) RETURNING *;");
      print(resultReturning);

      // Prepare a statement to run it multiple times:
      final stmt = db.prepare('INSERT INTO artists (name) VALUES (?)');
      stmt
        ..execute(['The Beatles'])
        ..execute(['Led Zeppelin'])
        ..execute(['The Who'])
        ..execute(['Nirvana']);

      // Dispose a statement when you don't need it anymore to clean up resources.
      stmt.dispose();

      // You can run select statements with PreparedStatement.select, or directly
      // on the database:
      final ResultSet resultSet = db.select('SELECT * FROM artists WHERE name LIKE ?', ['The %']);

      // You can iterate on the result set in multiple ways to retrieve Row objects
      // one by one.
      for (final Row row in resultSet) {
        print('Artist[id: ${row['id']}, name: ${row['name']}]');
      }

      expect(
          resultSet.rows,
          equals([
            [1, 'The Beatles'],
            [3, 'The Who']
          ]));

      // Don't forget to dispose the database to avoid memory leaks
      db.dispose();

      final result = serializers.serialize(SurveyStructure((b) {
        b.questions = ListBuilder([]);
      }));
      expect(result, equals({'type': 'SurveyStructure', 'definitions': [], 'questions': []}));
    });

    test('should serialize empty survey', () {
      final result = serializers.serialize(SurveyStructure((b) {
        b.questions = ListBuilder([]);
      }));
      expect(result, equals({'type': 'SurveyStructure', 'definitions': [], 'questions': []}));
    });

    test('should serialize survey with all question types', () {
      final result = serializers.serialize(SurveyStructure((b) {
        b.questions = ListBuilder([
          SingleChoiceQuestion(
            (b) {
              b
                ..id = "first_question"
                ..title = "First Question";
            },
          ),
          MultipleChoiceQuestion(
            (b) {
              b
                ..id = "second_question"
                ..title = "Second Question";
            },
          ),
          FreeTextQuestion(
            (b) {
              b
                ..id = "third_question"
                ..title = "Third Question";
            },
          )
        ]);
      }));

      expect(
          result,
          equals({
            'type': 'SurveyStructure',
            'definitions': [],
            'questions': [
              {'type': 'SingleChoiceQuestion', 'choices': [], 'id': 'first_question', 'title': 'First Question'},
              {'type': 'MultipleChoiceQuestion', 'choices': [], 'id': 'second_question', 'title': 'Second Question'},
              {'type': 'FreeTextQuestion', 'id': 'third_question', 'title': 'Third Question'}
            ]
          }));
    });
  });

  group('SingleChoiceQuestion serializer', () {
    test('should serialize empty SingleChoiceQuestion', () {
      final result = SingleChoiceQuestion((b) {
        b
          ..id = "question_1"
          ..title = "First Question";
      }).toJson();

      expect(result, equals({'id': 'question_1', 'title': 'First Question', 'choices': []}));
    });

    test('should serialize SingleChoiceQuestion with one Choice', () {
      final result = SingleChoiceQuestion((b) {
        b
          ..id = "question_1"
          ..title = "First Question"
          ..choices = ListBuilder([
            Choice(
              (b) {
                b
                  ..value = "first"
                  ..title = "First Choice";
              },
            )
          ]);
      }).toJson();

      expect(
          result,
          equals({
            'choices': [
              {'value': 'first', 'title': 'First Choice', 'subQuestions': []}
            ],
            'id': 'question_1',
            'title': 'First Question'
          }));
    });
  });

  group('MultipleChoiceQuestion serializer', () {
    test('should serialize empty MultipleChoiceQuestion', () {
      final result = MultipleChoiceQuestion((b) {
        b
          ..id = "question_1"
          ..title = "First Question";
      }).toJson();

      expect(result, equals({'id': 'question_1', 'title': 'First Question', 'choices': []}));
    });

    test('should serialize MultipleChoiceQuestion with one Choice', () {
      final result = MultipleChoiceQuestion((b) {
        b
          ..id = "question_1"
          ..title = "First Question"
          ..choices = ListBuilder([
            Choice(
              (b) {
                b
                  ..value = "first"
                  ..title = "First Choice";
              },
            )
          ]);
      }).toJson();

      expect(
          result,
          equals({
            'choices': [
              {'value': 'first', 'title': 'First Choice', 'subQuestions': []}
            ],
            'id': 'question_1',
            'title': 'First Question'
          }));
    });
  });

  group('Survey Validation', () {
    test('should not show errors if a question has no answers when that question is disabled', () async {
      final store = LocalStore();
      SurveyBuilder b = SurveyBuilder();
      final type = Survey((b) => b
        ..id = 0
        ..name = ""
        ..description = ""
        ..structure = SurveyStructure((b) => b
          ..definitions = ListBuilder()
          ..questions = ListBuilder([
            SingleChoiceQuestion((b) => b
              ..title = "A"
              ..id = "a"
              ..choices = ListBuilder([
                Choice((b) => b
                  ..title = "A1"
                  ..value = "a1"),
                Choice((b) => b
                  ..title = "A2"
                  ..value = "a2")
              ])),
            SingleChoiceQuestion((b) => b
              ..title = "B"
              ..id = "b"
              ..enabledIf = ContainsAnyOf((b) => b
                ..field = "a"
                ..values = SetBuilder(["a2"]))
              ..choices = ListBuilder([
                Choice((b) => b
                  ..title = "B1"
                  ..value = "b1"
                  ..subQuestions = ListBuilder([
                    SingleChoiceQuestion((b) => b
                      ..title = "B1C"
                      ..id = "b1c"
                      ..choices = ListBuilder([
                        Choice((b) => b
                          ..title = "B1C1"
                          ..value = "b1c1")
                      ]))
                  ]))
              ]))
          ])).toBuilder());

      store.addSurveysTypesToCache([type].toBuiltList());

      final submission = await store.addSubmission(survey: type, submissionTitle: "", createdBy: "");

      final answer = ChoiceQuestionAnswer((b) => b
        ..id = (store.choiceQuestionAnswersById.value.keys.maxOrNull ?? 0) + 1
        ..submissionId = submission.id
        ..linkedSubmissionId = submission.id
        ..parentId = null
        ..question = "a"
        ..answer = "a1");

      store.addChoiceAnswers({answer});

      final errors = submission.validate3(store);

      expect(errors.errorsByPath.isEmpty, equals(true));
    });

    test('should not show errors if a question has no answers when that question is a subquestion of an unchecked choice', () async {
      final store = LocalStore();

      final survey = Survey((b) => b
        ..id = 0
        ..name = ""
        ..description = ""
        ..structure = SurveyStructure((b) => b
          ..definitions = ListBuilder()
          ..questions = ListBuilder([
            SingleChoiceQuestion((b) => b
              ..title = "A"
              ..id = "a"
              ..choices = ListBuilder([
                Choice((b) => b
                  ..title = "A1"
                  ..value = "a1"),
                Choice((b) => b
                  ..title = "A2"
                  ..value = "a2"
                  ..subQuestions = ListBuilder([
                    SingleChoiceQuestion((b) => b
                      ..title = "A1B"
                      ..id = "a1b"
                      ..choices = ListBuilder([
                        Choice((b) => b
                          ..title = "A1B1"
                          ..value = "a1b1")
                      ]))
                  ]))
              ])),
          ])).toBuilder());

      store.addSurveysTypesToCache([survey].toBuiltList());

      final submission = await store.addSubmission(survey: survey, submissionTitle: "", createdBy: "");

      final answer = ChoiceQuestionAnswer((b) => b
        ..id = (store.choiceQuestionAnswersById.value.keys.maxOrNull ?? 0) + 1
        ..submissionId = submission.id
        ..linkedSubmissionId = submission.id
        ..parentId = null
        ..question = "a"
        ..answer = "a1");

      store.addChoiceAnswers({answer});

      final errors = submission.validate3(store);

      expect(errors.errorsByPath.isEmpty, equals(true));
    });

    test('should show error if a subquestion has no answer', () async {
      final store = LocalStore();

      final type = Survey((b) => b
        ..id = 0
        ..name = ""
        ..description = ""
        ..structure = SurveyStructure((b) => b
          ..definitions = ListBuilder()
          ..questions = ListBuilder([
            SingleChoiceQuestion((b) => b
              ..title = "A"
              ..id = "a"
              ..choices = ListBuilder([
                Choice((b) => b
                  ..title = "A1"
                  ..value = "a1"
                  ..subQuestions = ListBuilder([
                    SingleChoiceQuestion((b) => b
                      ..title = "A1A"
                      ..id = "a1a"
                      ..choices = ListBuilder([
                        Choice((b) => b
                          ..title = "A1A1"
                          ..value = "a1a1")
                      ]))
                  ])),
              ])),
          ])).toBuilder());

      store.addSurveysTypesToCache([type].toBuiltList());

      final submission = await store.addSubmission(survey: type, submissionTitle: "", createdBy: "");

      final answer = ChoiceQuestionAnswer((b) => b
        ..id = (store.choiceQuestionAnswersById.value.keys.maxOrNull ?? 0) + 1
        ..submissionId = submission.id
        ..linkedSubmissionId = submission.id
        ..parentId = null
        ..question = "a"
        ..answer = "a1");

      store.addChoiceAnswers({answer});

      final actualValidationResult = submission.validate3(store);

      const expectedValidationResult = """ChoiceAnswerValidationResult {
  errorsByPath={{"chainElements":[],"leafQuestion":"a"}: [ChoiceQuestionHasNoAnswersError {
    questionTitle=A1A,
    pathSegments=[{"chainElements":[],"leafQuestion":"a"}, {"chainElements":[{"question":"a","answer":"a1"}]}, {"chainElements":[{"question":"a","answer":"a1"}],"leafQuestion":"a1a"}],
  }], {"chainElements":[{"question":"a","answer":"a1"}],"leafQuestion":"a1a"}: [ChoiceQuestionHasNoAnswersError {
    questionTitle=A1A,
    pathSegments=[{"chainElements":[],"leafQuestion":"a"}, {"chainElements":[{"question":"a","answer":"a1"}]}, {"chainElements":[{"question":"a","answer":"a1"}],"leafQuestion":"a1a"}],
  }]},
}""";

      expect(actualValidationResult.toString(), equals(expectedValidationResult));
    });

    test('should show error if a question and/or a subquestion has an answer but the parent question is disabled', () async {
      final store = LocalStore();

      final type = Survey((b) => b
        ..id = 0
        ..name = ""
        ..description = ""
        ..structure = SurveyStructure((b) => b
          ..definitions = ListBuilder()
          ..questions = ListBuilder([
            SingleChoiceQuestion((b) => b
              ..title = "A"
              ..id = "a"
              ..choices = ListBuilder([
                Choice((b) => b
                  ..title = "A1"
                  ..value = "a1"),
                Choice((b) => b
                  ..title = "A2"
                  ..value = "a2")
              ])),
            SingleChoiceQuestion((b) => b
              ..title = "B"
              ..id = "b"
              ..enabledIf = ContainsAnyOf((b) => b
                ..field = "a"
                ..values = SetBuilder(["a2"]))
              ..choices = ListBuilder([
                Choice((b) => b
                  ..title = "B1"
                  ..value = "b1"
                  ..subQuestions = ListBuilder([
                    SingleChoiceQuestion((b) => b
                      ..title = "B1C"
                      ..id = "b1c"
                      ..choices = ListBuilder([
                        Choice((b) => b
                          ..title = "B1C1"
                          ..value = "b1c1")
                      ]))
                  ]))
              ]))
          ])).toBuilder());

      store.addSurveysTypesToCache([type].toBuiltList());

      final submission = await store.addSubmission(survey: type, submissionTitle: "", createdBy: "");

      final answerA = ChoiceQuestionAnswer((b) => b
        ..id = (store.choiceQuestionAnswersById.value.keys.maxOrNull ?? 0) + 1
        ..submissionId = submission.id
        ..linkedSubmissionId = submission.id
        ..parentId = null
        ..question = "a"
        ..answer = "a1");
      store.addChoiceAnswers({answerA});

      final answerB = ChoiceQuestionAnswer((b) => b
        ..id = (store.choiceQuestionAnswersById.value.keys.maxOrNull ?? 0) + 1
        ..submissionId = submission.id
        ..linkedSubmissionId = submission.id
        ..parentId = null
        ..question = "b"
        ..answer = "b1");
      store.addChoiceAnswers({answerB});

      final answerB1C = ChoiceQuestionAnswer((b) => b
        ..id = (store.choiceQuestionAnswersById.value.keys.maxOrNull ?? 0) + 1
        ..submissionId = submission.id
        ..linkedSubmissionId = submission.id
        ..parentId = answerB.id
        ..question = "b1c"
        ..answer = "b1c1");

      store.addChoiceAnswers({answerB1C});

      final actualValidationResult = submission.validate3(store);

      final expectedValidationResult = ChoiceAnswerValidationResult.fromJson({
        "errorsByPath": {
          "{\"chainElements\":[],\"leafQuestion\":\"b\"}": [
            {
              "type": "ChoiceQuestionHasAnswersButPathIsDisabledError",
              "disabledPathSegments": [
                {"chainElements": [], "leafQuestion": "b"}
              ],
              "questionTitle": "B",
              "pathSegments": [
                {"chainElements": [], "leafQuestion": "b"}
              ]
            },
            {
              "type": "PathIsDisabledButHasAnsweredSubquestionsError",
              "subQuestionPath": {"chainElements": [], "leafQuestion": "b"},
              "disabledPathSegments": [
                {"chainElements": [], "leafQuestion": "b"}
              ],
              "questionTitle": "B",
              "pathSegments": [
                {"chainElements": [], "leafQuestion": "b"}
              ]
            },
            {
              "type": "ChoiceQuestionHasAnswersButPathIsDisabledError",
              "disabledPathSegments": [
                {"chainElements": [], "leafQuestion": "b"},
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ]
                }
              ],
              "questionTitle": "B1C",
              "pathSegments": [
                {"chainElements": [], "leafQuestion": "b"},
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ]
                },
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ],
                  "leafQuestion": "b1c"
                }
              ]
            },
            {
              "type": "PathIsDisabledButHasAnsweredSubquestionsError",
              "subQuestionPath": {
                "chainElements": [
                  {"question": "b", "answer": "b1"}
                ],
                "leafQuestion": "b1c"
              },
              "disabledPathSegments": [
                {"chainElements": [], "leafQuestion": "b"},
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ]
                }
              ],
              "questionTitle": "B",
              "pathSegments": [
                {"chainElements": [], "leafQuestion": "b"},
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ]
                },
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ],
                  "leafQuestion": "b1c"
                }
              ]
            }
          ],
          "{\"chainElements\":[{\"question\":\"b\",\"answer\":\"b1\"}],\"leafQuestion\":\"b1c\"}": [
            {
              "type": "ChoiceQuestionHasAnswersButPathIsDisabledError",
              "disabledPathSegments": [
                {"chainElements": [], "leafQuestion": "b"},
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ]
                }
              ],
              "questionTitle": "B1C",
              "pathSegments": [
                {"chainElements": [], "leafQuestion": "b"},
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ]
                },
                {
                  "chainElements": [
                    {"question": "b", "answer": "b1"}
                  ],
                  "leafQuestion": "b1c"
                }
              ]
            }
          ]
        }
      });
      expect(actualValidationResult, equals(expectedValidationResult));
    });
  });
}
