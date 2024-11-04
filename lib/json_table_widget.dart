
import 'dart:convert';

import 'package:flutter/material.dart';

class JsonTableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String jsonString = '''{
      "type": "Survey",
      "questions": [
          {
      "id": "id_bdl",
      "type": "SingleChoiceQuestion",
      "title": "Bundesland",
      "choices": [
        {"title": "Baden-Württemberg", "value": "bw"},
        {"title": "Bayern", "value": "by"},
        {"title": "Berlin", "value": "be"},
        {"title": "Brandenburg", "value": "bb"},
        {"title": "Bremen", "value": "hb"},
        {"title": "Hamburg", "value": "hh"},
        {"title": "Hessen", "value": "he"},
        {"title": "Mecklenburg-Vorpommern", "value": "mv"},
        {"title": "Niedersachsen", "value": "ni"},
        {"title": "Nordrhein-Westfalen", "value": "nw"},
        {"title": "Rheinland-Pfalz", "value": "rp"},
        {"title": "Saarland", "value": "sl"},
        {"title": "Sachsen", "value": "sn"},
        {"title": "Sachsen-Anhalt", "value": "st"},
        {"title": "Schleswig-Holstein", "value": "sh"},
        {"title": "Thüringen", "value": "th"}
      ]
    },
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
    return JsonTable(data: json);
  }
}

class JsonTable extends StatelessWidget {
  final dynamic data;

  JsonTable({required this.data});

  @override
  Widget build(BuildContext context) {
    return _buildTable(data, '');
  }

  Widget _buildTable(dynamic node, String path) {
    if (node is Map<String, dynamic>) {
      return DataTable(
        columns: [
          DataColumn(label: Text('Path')),
          DataColumn(label: Text('Key')),
          DataColumn(label: Text('Value')),
        ],
        rows: node.entries.map((entry) {
          String newPath = path.isEmpty ? entry.key : '$path/${entry.key}';
          return DataRow(cells: [
            DataCell(Text(newPath)),
            DataCell(Text(entry.key)),
            DataCell(
              entry.value is Map || entry.value is List
                  ? _buildTable(entry.value, newPath)
                  : Text(entry.value.toString()),
            ),
          ]);
        }).toList(),
      );
    } else if (node is List) {
      return Column(
        children: node.asMap().entries.map((entry) {
          String newPath = '$path[${entry.key}]';
          return _buildTable(entry.value, newPath);
        }).toList(),
      );
    } else {
      return Text(node.toString());
    }
  }
}