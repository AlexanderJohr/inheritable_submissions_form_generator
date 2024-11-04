final survey = {
  "id": 12,
  "name": "Maßnahmen Eingabe Workshop",
  "description": "Maßnahmen Eingabe Workshop",
  "structure": {
    "definitions": [
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "ja",
            "title": "Ja",
            "subQuestions": [
              {
                "type": "SingleChoiceQuestion",
                "choices": [
                  {
                    "value": "inkl",
                    "title": "Inklusiv / Vorgegebene Abfolge",
                    "subQuestions": []
                  },
                  {
                    "value": "exkl",
                    "title": "Exklusiv / Ausschluss von",
                    "subQuestions": []
                  },
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "staffelg_inkl_excl",
                "title": "Staffelung als Vorgabe oder mit Verzicht"
              },
              {
                "type": "MultipleChoiceQuestion",
                "choices": [
                  {"value": "räuml", "title": "räumlich", "subQuestions": []},
                  {"value": "zeitl", "title": "zeitlich", "subQuestions": []},
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "staffelg_räuml_zeitl",
                "title": "Staffelung im Raum oder im Zeitverlauf"
              }
            ]
          },
          {"value": "nein", "title": "Nein", "subQuestions": []},
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "staffelg",
        "title": "Staffelung",
        "description":
            "im zeitlichen Verlauf oder in einer räumlichen Anordnung müssen verschiedene Schritte/Prozesse hinter-/nebeneinander erfolgen oder sind ausgeschlossen"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "getreide",
            "title": "Getreide (alle / nicht spezifiziert)",
            "subQuestions": []
          },
          {
            "value": "hauptfr",
            "title": "Hauptfruchtarten (alle / nicht spezifiziert)",
            "subQuestions": []
          },
          {"value": "wwei", "title": "Winterweizen", "subQuestions": []},
          {"value": "mais", "title": "Mais", "subQuestions": []},
          {"value": "raps", "title": "Raps", "subQuestions": []},
          {
            "value": "hackfrüchte",
            "title": "Hackfrüchte (alle / nicht spezifiziert)",
            "subQuestions": []
          },
          {"value": "kart", "title": "Kartoffeln", "subQuestions": []},
          {"value": "gemüse", "title": "Gemüse", "subQuestions": []},
          {
            "value": "sommerkulturen",
            "title": "Sommerkulturen",
            "subQuestions": []
          },
          {"value": "skul", "title": "Sonderkulturen", "subQuestions": []},
          {
            "value": "untersaat",
            "title": "Untersaat (muss nicht detaillierter angegeben werden)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["zf_us", "extens", "anbaudiv", "erbt"]
            }
          },
          {
            "value": "legum",
            "title": "Leguminosen / Eiweißpflanzen (alle, auch in Gemengen)",
            "subQuestions": []
          },
          {
            "value": "kleinkörn-legum",
            "title":
                "kleinkörnige Leguminosen / Eiweißpflanzen (auch in Gemengen)",
            "subQuestions": []
          },
          {
            "value": "großkörn-legum",
            "title":
                "großkörnige Leguminosen / Eiweißpflanzen (auch in Gemengen)",
            "subQuestions": []
          },
          {
            "value": "mischung-ohne-legum",
            "title": "Mischung ohne Leguminosen",
            "subQuestions": []
          },
          {
            "value": "blüh-arten",
            "title":
                "blühende Arten oder Wildpflanzenarten ohne genauere Vorgabe",
            "subQuestions": []
          },
          {
            "value": "konkr-blühmisch",
            "title": "konkrete Blühmischung",
            "subQuestions": []
          },
          {
            "value": "auswahl-kulturen",
            "title":
                "Auswahlliste möglicher Arten/Kulturen (Referenzliste), aus denen gewählt werden kann",
            "subQuestions": []
          },
          {"value": "brache", "title": "Brache", "subQuestions": []},
          {
            "value": "seltene-kulturen",
            "title": "seltene Kulturen",
            "subQuestions": []
          },
          {
            "value": "grünland-feld-ackergras-gräser",
            "title": "Grünland, Feld- oder Ackergras / Ackerfutter, Gräser",
            "subQuestions": []
          },
          {
            "value": "winterhart-zwfrüchte",
            "title": "winterharte Zwischenfrüchte",
            "subQuestions": []
          },
          {
            "value": "abfrier-zwfrüchte",
            "title": "abfrierende Zwischenfrüchte",
            "subQuestions": []
          },
          {
            "value": "beliebig-kulturarten",
            "title": "beliebige Kulturarten VERALTET - BITTE NICHT MEHR WÄHLEN",
            "subQuestions": [],
            "description":
                "Alex: schauen, ob jemand etwas eingetragen hat. Wenn ja, WIE GEHT DAS DENN? Mit Norbert anschauen"
          },
          {
            "value": "schilf",
            "title":
                "nicht-invasives Schilf (Phragmites australis), oder Rohrkolben (Typha spec.)",
            "subQuestions": []
          },
          {"value": "sonstige", "title": "Sonstige", "subQuestions": []},
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "vorg-sorten-kulturen",
        "title": "Welche Sorten/Kulturen sind vorgegeben?",
        "description":
            "Ggf. das Formular 'Mengen-/Flächen-Vorgaben' (bei +) nutzen."
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "ja",
            "title": "Ja (bitte mit + Beschreibung im Freitext ergänzen)",
            "subQuestions": []
          },
          {"value": "nein", "title": "Nein", "subQuestions": []},
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "ausnahm",
        "title": "Gibt es Ausnahmen von dieser Auswahl?"
      }
    ],
    "questions": [
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "citavi",
            "title": "Citavi-IDs",
            "subQuestions": [],
            "description":
                "Aus dem Feld 'Freitext 9' der Titel-Ansicht im Citavi. Bei leerem Feld muss dies durch ein Makro gefüllt werden, siehe Handbuch zum Metadaten-Citavi (Cloud). Wenn mehrere Dokumente genutzt werden, mehrere Freitext-Felder nutzen.)"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "quellen",
        "title":
            "Quellen (Citavi-IDs der genutzten Dokumente im Metadaten-Citavi)"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "2014-2022", "title": "2014-2022", "subQuestions": []},
          {"value": "2023-2027", "title": "2023-2027", "subQuestions": []}
        ],
        "id": "id_foerd_per",
        "title": "Förderperiode"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "de",
            "title": "Ganz Deutschland (alle Bundesländer)",
            "subQuestions": []
          },
          {"value": "bw", "title": "Baden-Württemberg", "subQuestions": []},
          {"value": "by", "title": "Bayern", "subQuestions": []},
          {"value": "be", "title": "Berlin", "subQuestions": []},
          {"value": "bb", "title": "Brandenburg", "subQuestions": []},
          {"value": "hb", "title": "Bremen", "subQuestions": []},
          {"value": "hh", "title": "Hamburg", "subQuestions": []},
          {"value": "he", "title": "Hessen", "subQuestions": []},
          {
            "value": "mv",
            "title": "Mecklenburg-Vorpommern",
            "subQuestions": []
          },
          {"value": "ni", "title": "Niedersachsen", "subQuestions": []},
          {"value": "nw", "title": "Nordrhein-Westfalen", "subQuestions": []},
          {"value": "rp", "title": "Rheinland-Pfalz", "subQuestions": []},
          {"value": "sl", "title": "Saarland", "subQuestions": []},
          {"value": "sn", "title": "Sachsen", "subQuestions": []},
          {"value": "st", "title": "Sachsen-Anhalt", "subQuestions": []},
          {"value": "sh", "title": "Schleswig-Holstein", "subQuestions": []},
          {"value": "th", "title": "Thüringen", "subQuestions": []}
        ],
        "id": "id_bdl",
        "title": "Bundesland"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "code_land",
            "title": "Code der Maßnahme",
            "subQuestions": [],
            "description":
                "Steht i. d. R. vor der Maßnahmen-Bezeichnung (bspw: AL5). Code als Freitext eintragen. Sofern mehrere Codes vorhanden sind, über + ein weiteres Freitext-Feld je Code anlegen."
          },
          {"value": "o", "title": "kein Code vorhanden", "subQuestions": []},
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "code_land",
        "title": "Maßnahmen-Code"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "norm",
            "title": "nicht unterteilte Maßnahme (Standard).",
            "subQuestions": [],
            "description":
                "(siehe Handbuch); Ergänzende Top-Ups sind möglich, aber nicht erforderlich. Es gibt keine Unterteilung in verschiedene Varianten."
          },
          {
            "value": "komplex",
            "title":
                "Komplexmaßnahme (beinhaltet verschiedene Varianten) (siehe Handbuch)",
            "subQuestions": []
          },
          {
            "value": "variante",
            "title": "Variante einer Komplexmaßnahme",
            "subQuestions": [
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "variante",
                "title": "Zugeordnete Komplexmaßnahme"
              }
            ],
            "description": "(siehe Handbuch)"
          },
          {
            "value": "top_up",
            "title":
                "Top-Up-Maßnahme, die auf eine andere Maßnahme aufgesattelt werden kann",
            "subQuestions": [
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up",
                "title": "Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_2",
                "title": "Optional: 2. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_3",
                "title": "Optional: 3. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_4",
                "title": "Optional: 4. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_5",
                "title": "Optional: 5. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_6",
                "title": "Optional: 6. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_7",
                "title": "Optional: 7. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_8",
                "title": "Optional: 8. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_9",
                "title": "Optional: 9. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_10",
                "title": "Optional: 10. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_11",
                "title": "Optional: 11. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_12",
                "title": "Optional: 12. Basismaßnahme zur TopUp-Maßnahme"
              }
            ],
            "description":
                "(siehe Handbuch); (wird bspw. auf derselben Fläche umgesetzt). Ist aber dennoch als eigenständige Maßnahme definiert, nicht als Variante."
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "komplex_typ",
        "title": "Komplex-Maßnahme"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "aukm",
            "title": "Agrarumwelt- und Klimamaßnahme AUKM",
            "subQuestions": [],
            "description":
                "(inkl. Ökolandbau; in einem Programm/einer Richtlinie definierte Maßnahme mit detaillierten Auflagen, die für alle teilnehmenden Betriebe gleich angewendet werden (keine individuellen Absprachen/Verträge). Keine der anderen Optionen."
          },
          {
            "value": "azl",
            "title": "Ausgleichszulage für wirtschaftliche Benachteiligung",
            "subQuestions": []
          },
          {
            "value": "ea",
            "title":
                "Erschwernisausgleich für ordnungsrechtliche Auflagen  (bspw. Natura 2000)",
            "subQuestions": []
          },
          {
            "value": "vns",
            "title":
                "Vertragsnaturschutz, individuelle Verträge und Regelungen",
            "subQuestions": [],
            "description":
                "Maßnahmen, die im Programm bzw. der Richtlinie vollständig definiert und beschrieben sind = AUKM, auch wenn sie (wie in Bayern) Vertragsnaturschutz heißen."
          },
          {
            "value": "oer",
            "title": "Ökoregelung",
            "subQuestions": [],
            "description":
                "(bundesweit einheitliche Maßnahmen der ersten GAP-Säule, Stand 2023 sind dies 7 verschiedene Maßnahmen) sowie gekoppelte Prämien"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_foerd_klass",
        "title":
            "Förderklasse (Welche EU-rechtlichen Rahmenbedingungen gelten?)"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "zf_us",
            "title": "Anbau Zwischenfrucht/Untersaat",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["aukm", "oer"]
            }
          },
          {
            "value": "anlage_pflege",
            "title": "Anlage oder Pflege einer Struktur",
            "subQuestions": [],
            "description": "bspw. Hecke, Kleingewässer, Blühstreifen",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "dungmang",
            "title": "Düngemanagement",
            "subQuestions": [],
            "description":
                "Anpassung / Änderung der Düngung, meist Reduktion der Düngemenge oder bestimmte Düngemittel",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "extens",
            "title":
                "Extensivierung der Flächennutzung oder Tierhaltung, sofern nicht durch andere Optionen abgedeckt",
            "subQuestions": [],
            "description":
                "(bspw: Reduktion der Schnitthäufigkeit, Verzicht auf Pflanzenschutzmittel)"
          },
          {
            "value": "flst",
            "title":
                "Flächenstilllegung/Brache (Fläche wird aus jeglicher produktiver Nutzung genommen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "umwandlg",
            "title": "Nutzungsumwandlung (bspw: Grünland- statt Ackernutzung)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "bes_kult_rass",
            "title": "Förderung bestimmter Rassen / Sorten / Kulturen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["ea"]
            }
          },
          {
            "value": "anbaudiv",
            "title": "Anbaudiversität / Erhöhung der Kulturartenvielfalt",
            "subQuestions": []
          },
          {
            "value": "wasser",
            "title": "Wasserstandsanhebung / Stauhöhe",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "Anderes",
            "subQuestions": [],
            "description": "Bitte mit + Freitext hinzufügen und Ziel angeben"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_kat",
        "title": "Kategorie (Einschätzung auf Basis der Maßnahmenbeschreibung)"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title":
                "keine Angabe bzw. nicht aus den genutzten Dokumenten ersichtlich",
            "subQuestions": []
          },
          {
            "value": "eler",
            "title": "ELER, inkl. Ko-Finanzierung durch ELER",
            "subQuestions": [],
            "description":
                "(i. d. R. ist das gesamte Programm notifiziert, dann werden alle Maßnahmen im jeweiligen Programm ELER (ko-)finanziert. 100% ELER-Förderung kann es mit Umschichtungsmitteln von 1. in 2. Säule geben, ansonsten i. d. R. zusammen mit Landesmitteln.",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["vns"]
            }
          },
          {
            "value": "gak",
            "title":
                "Gemeinschaftsaufgabe Agrarstruktur und Küstenschutz (GAK)",
            "subQuestions": [],
            "description": " (i. d. R. in Ko-Finanzierung mit Landesmitteln)"
          },
          {
            "value": "land",
            "title": "Land, auch bei ELER-Kofinanzierung möglich",
            "subQuestions": [],
            "description":
                "(bspw: Landesprogramme, die nicht von der EU notifiziert wurden, werden oft nur aus Landesmitteln finanziert. Mit Notifizierung ist der Finanzierungsanteil durch das Land geringer)"
          },
          {
            "value": "sonst",
            "title": "Andere Finanzierungsquelle",
            "subQuestions": [],
            "description":
                "(als Freitext angeben. bspw: EGFL Europäischer Garantiefonds für die Landwirtschaft)"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_finanz",
        "title": "Finanzierung"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "lf",
            "title": "Landwirtschaftlich genutzte Fläche (LF)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "al",
            "title": "Ackerland (AL)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "hff",
            "title": "Hauptfutterfläche (HFF)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "gl",
            "title": "Grünland (GL)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "description":
                "Beinhaltet Dauergrünland, Ackergras und vergleichbare Kulturen / Flächen"
          },
          {
            "value": "dgl",
            "title": "Dauergrünland (DGL)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "dk_sk",
            "title": "Dauer- und/oder Sonderkulturen (DK/SK)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["twm_ziel"]
            }
          },
          {
            "value": "biotop_le",
            "title": "Landschaftselement/Biotop o.Ä.",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["azl", "ea", "vns", "aukm"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "wald",
            "title": "Wald/Forst",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["ea", "vns", "aukm"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "gewaesser",
            "title": "Gewässer, bspw. Teiche",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_fl",
        "title":
            "Zielfläche (Flächenart, auf der die Maßnahme umgesetzt wird bzw. auf die sie sich bezieht)",
        "description":
            "Sofern mehrere Angaben nötig wären, bitte die Maßnahme duplizieren und als zweite Maßnahme für beide Zielfläcen anlegen. Im Titel entsprechend kenntlich machen, um welche Ausführung es sich handelt"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "einh_praem",
            "title":
                "Einheitsprämie mit fester jährlicher Förderhöhe ohne Ausnahmen",
            "subQuestions": [],
            "description":
                "(Förderhöhe inkl. Einheit über Formular für Mengen-/Flächen-Vorgaben eingeben, bspw. 200 €/ha)"
          },
          {
            "value": "einh_abw",
            "title":
                "Einheitsprämie, aber Abweichungen wenn die Maßnahme mit anderen Maßnahmen kombiniert wird",
            "subQuestions": [],
            "description":
                "(jährliche Förderhöhe der Regel-Prämie im \"Normalfall\", also ohne die Abweichungen, inkl. Einheit über Formular für Mengen-/Flächen-Vorgaben eingeben, bspw. 200 €/ha)"
          },
          {
            "value": "var",
            "title":
                "Bei Top-Up bzw. Komplexmaßnahmen unterschiedliche Förderhöhen der Varianten",
            "subQuestions": [],
            "description": "(keine weitere Angabe nötig)"
          },
          {
            "value": "sto_dif",
            "title":
                "Differenziert nach Standort (Bodenpunkte) / Lagebasiert (am Gewässer) / Tierart",
            "subQuestions": [],
            "description":
                "(mit dem Formular für Mengen- / Flächen-Vorgabe kleinsten und größten Betrag als Spanne angeben, im Freitext konkretisieren (so konkret wie möglich, ohne einen Roman zu tippen;)"
          },
          {
            "value": "flaechen_diff",
            "title":
                "Gestaffelt nach Umsetzungsumfang / Menge (bspw. Anzahl ha) / Flächengröße / Tierzahl",
            "subQuestions": [],
            "description":
                "(mit dem Formular für Mengen- / Flächen-Vorgabe kleinsten und größten Betrag als Spanne angeben, im Freitext konkretisieren (so konkret wie möglich, ohne einen Roman zu tippen;) (bspw: Ökoregelung 1)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_honor",
        "title": "Honorierung"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "handlg_orient",
            "title":
                "Handlungsorientiert, d. h. die Durchführung einer bestimmten Aktion wird honoriert",
            "subQuestions": [],
            "description": "(häufigster Fall, bspw: Anlegen eines Streifens)"
          },
          {
            "value": "erg_orient",
            "title":
                "Ergebnisorientierte Honorierung, d. h. ein bestimmtes Ziel muss erreicht werden",
            "subQuestions": [],
            "description": "(bspw: Anzahl von Kennarten)"
          },
          {
            "value": "invest_foerderg",
            "title": "Investitionsförderung",
            "subQuestions": [],
            "description":
                "bspw. Stallbau, Anschaffung von Technik [deaktiviert, da Stand Mai 2023 nicht im Fokus der Erfassung]"
          },
          {
            "value": "markt_foerderg",
            "title": "marktorientierter Ausgleich",
            "subQuestions": [],
            "description":
                "[deaktiviert, da Stand Mai 2023 nicht im Fokus der Erfassung]",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "id_foerd_per",
              "values": ["2014-2022", "2023-2027"]
            }
          },
          {
            "value": "ertrag_foerederg",
            "title": "ertragsorientierte/ertragsmesszahlbasierte Auszahlung",
            "subQuestions": [],
            "description":
                "(bspw. je nach Standortgüte oder Ertragspotenzial einer Fläche"
          },
          {
            "value": "koop_foerderg",
            "title": "kooperative Förderung",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_foerd_variab",
        "title": "Art der Honorierung"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "bsch",
            "title": "Bodenschutz (bspw. Erosionsschutz)",
            "subQuestions": []
          },
          {
            "value": "wsch",
            "title":
                "Gewässerschutz (Schutz von Grund- und Oberflächengewässern, bspw. gegen Nährstoffeintrag)",
            "subQuestions": []
          },
          {
            "value": "asch",
            "title":
                "Spezieller Artenschutz bezogen auf einzelne Arten, bspw. Feldhamster",
            "subQuestions": []
          },
          {
            "value": "biodiv",
            "title": "Biodiversität",
            "subQuestions": [],
            "description":
                "(Erhalt / Wiederherstellung von Lebensräumen, Habitaten, Pflanzengesellschaften etc.)"
          },
          {
            "value": "strutktviel",
            "title": "Erhöhung der Strukturvielfalt in der Landschaft",
            "subQuestions": []
          },
          {
            "value": "genet_res",
            "title": "Erhaltung genetischer Ressourcen",
            "subQuestions": [],
            "description":
                "(bspw. alte Sorten bei Pflanzen oder bedrohte Rassen bei Nutztieren)"
          },
          {
            "value": "tsch",
            "title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb",
            "subQuestions": []
          },
          {
            "value": "klima",
            "title": "Klimaschutz oder -anpassung",
            "subQuestions": []
          },
          {
            "value": "nachh_res",
            "title": "Nachhaltige Ressourcennutzung",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "Anderes",
            "subQuestions": [],
            "description": "Bitte mit + Freitext hinzufügen und Ziel angeben"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_haupt",
        "title": "Hauptziel des Landes"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {"value": "bsch", "title": "Bodenschutz", "subQuestions": []},
          {
            "value": "wsch",
            "title":
                "Gewässerschutz (Schutz von Grund- und Oberflächengewässern, bspw. gegen Nährstoffeintrag)",
            "subQuestions": []
          },
          {
            "value": "asch",
            "title":
                "Spezieller Artenschutz bezogen auf einzelne Arten, bspw. Feldhamster",
            "subQuestions": []
          },
          {
            "value": "biodiv",
            "title": "Biodiversität",
            "subQuestions": [],
            "description":
                "(Erhalt / Wiederherstellung von Lebensräumen, Habitaten, Pflanzengesellschaften etc.)"
          },
          {
            "value": "strutktviel",
            "title": "Erhöhung der Strukturvielfalt",
            "subQuestions": []
          },
          {
            "value": "genet_res",
            "title": "Erhaltung genetischer Ressourcen",
            "subQuestions": [],
            "description":
                "(bspw. alte Sorten bei Pflanzen oder bedrohte Rassen bei Nutztieren)"
          },
          {
            "value": "tsch",
            "title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb",
            "subQuestions": []
          },
          {
            "value": "klima",
            "title": "Klimaschutz oder -anpassung",
            "subQuestions": []
          },
          {
            "value": "nachh_res",
            "title": "Nachhaltige Ressourcennutzung",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "Anderes",
            "subQuestions": [],
            "description": "Bitte mit + Freitext hinzufügen und Ziel angeben"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_neben",
        "title": "Weitere Ziele (Nebenziele) des Landes"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "flaeche",
            "title":
                "Einzelfläche oder bestimmte Gruppe von Tieren (aber nicht alle Flächen oder Tiere einer Art)",
            "subQuestions": [],
            "description":
                "(bspw. Blühstreifen/-flächen, Zwischenfrüchte und Untersaaten)"
          },
          {
            "value": "bzweig",
            "title":
                "Betriebszweig - Teile des Betriebs stehen im Fokus, bspw. bestimmte Flächen",
            "subQuestions": [],
            "description":
                "(bspw: Alles Grünland im Betrieb, gesamtes Ackerland im Betrieb (bspw. vielfältige Kulturen im Ackerbau), alle Gemüseflächen bzw. Änderung der Tierhaltung im Betrieb aber ohne Auswirkung auf angebaute Kulturen)"
          },
          {
            "value": "betr",
            "title":
                "Gesamtbetrieb - bezieht sich auf wirklich alle Flächen sowie die Tierhaltung eines Betriebs",
            "subQuestions": [],
            "description":
                "(bspw: Verzicht auf Pflanzenschutzmittel im gesamtem Betrieb, Ökolandbau)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ums_eb",
        "title": "Umsetzungsebene"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "no", "title": "Nein", "subQuestions": []},
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "oevf_oer",
            "title": "Greening/ÖVF",
            "subQuestions": [],
            "description":
                "(für Förderperiode 2014-2022) bzw. Ökoregelung (für Förderperiode ab 2023) - keine weitere Angabe erforderlich"
          },
          {
            "value": "aukm",
            "title": "AUKM",
            "subQuestions": [],
            "description":
                "(keine weitere Angabe notwendig, wenn dies durch eine Kombinationstabelle herausgefunden werden kann)"
          },
          {
            "value": "sonst",
            "title": "Andere",
            "subQuestions": [],
            "description":
                "(aber NICHT Greening/ÖVF, Ökoregelung oder AUKM) - als Freitext angeben, welche Kombinationen möglich sind."
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_kombi",
        "title": "Kombinierbar mit anderen Massnahmen auf der gleichen Fläche"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe/ohne obligate Beratung",
            "subQuestions": []
          },
          {
            "value": "beratg_oblig",
            "title":
                "obligate Beratung, Prüfung oder Begleitung (bspw. Imkerbeteiligung, technische Dienstleister)",
            "subQuestions": []
          },
          {
            "value": "unb",
            "title":
                "Stellungnahme bzw. Abstimmung mit der zuständigen Fachbehörde, bspw. Naturschutzbehörde",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_beratg",
        "title": "Beratung"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "1y", "title": "1 Jahr", "subQuestions": []},
          {"value": "2y", "title": "2 Jahre", "subQuestions": []},
          {"value": "3y", "title": "3 Jahre", "subQuestions": []},
          {"value": "4y", "title": "4 Jahre", "subQuestions": []},
          {
            "value": "5y",
            "title": "5 Jahre (Regelfall für AUKM)",
            "subQuestions": []
          },
          {
            "value": "bis5y",
            "title": "<= 5 Jahre (wenn nicht genauer angegeben)",
            "subQuestions": []
          },
          {"value": "bis10y", "title": "<= 10 Jahre", "subQuestions": []},
          {"value": "bis20y", "title": "<= 20 Jahre", "subQuestions": []},
          {"value": "na", "title": "nicht angegeben", "subQuestions": []},
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_dauer_vertr",
        "title": "Vertragslaufzeit"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "wechsel_ann",
            "title": "jährlich variabel",
            "subQuestions": [],
            "description":
                "(d. h. die Maßnahme kann während der Vertragslaufzeit jedes Jahr anderswo platziert werden)"
          },
          {
            "value": "lagetreu",
            "title": "Lagetreu über den Verpflichtungszeitraum",
            "subQuestions": [],
            "description":
                "(d. h. die Maßnahme liegt von Anfang bis Ende der Vertragslaufzeit an ein und derselben Stelle)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_dauer_lage",
        "title": "Lagetreue der Maßnahme",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ums_eb",
          "values": ["flaeche", "erbt"]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "ha",
            "title": "Hektar (ha)",
            "subQuestions": [],
            "description": "(bspw. Vielfältige Kulturen, Kennartenmaßnahmen)"
          },
          {
            "value": "pieces",
            "title": "Kopf / Stück/ Anzahl (bspw. Tier, Baum)",
            "subQuestions": [],
            "description":
                "bspw. Kennarten, Kennartengruppen, Tiere oder Bäume",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "twm_ziel", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "flst", "umwandlg"]
                }
              ]
            }
          },
          {
            "value": "gve",
            "title": "Großvieheinheiten (GV/GVE)",
            "subQuestions": [],
            "description": "absolut oder pro Hektar",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "twm_ziel", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
                }
              ]
            }
          },
          {
            "value": "rgve",
            "title": "Raufutter fressende Großvieheinheiten (RGV)",
            "subQuestions": [],
            "description": "absolut oder pro Hektar",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "twm_ziel", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
                }
              ]
            }
          },
          {
            "value": "m3",
            "title": "m³ (bspw. Gülle)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "erbt"]
                },
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_kat",
                  "values": ["dungmang", "extens", "erbt"]
                }
              ]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_einh",
        "title": "Zieleinheit (Einheit, für die die Zahlung gewährt wird)"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "flaeche1",
            "title":
                "Vorgeschriebene Flächengröße, bspw. Mindest- oder Maximalfläche.",
            "subQuestions": [],
            "description":
                "Mit + Formular 'Mengen-/Flächen-Vorgabe' nutzen! Bei mehreren, alternativen Vorgaben: Option 1 hier angeben, bei mehreren sich ergänzenden Vorgaben alle hier angeben (Formular mehrfach nutzen)."
          },
          {
            "value": "flaeche2",
            "title":
                "Vorgeschriebene Flächengröße, bspw. Mindest- oder Maximalfläche.",
            "subQuestions": [],
            "description":
                " Mit + Formular 'Mengen-/Flächen-Vorgabe' nutzen! Bei mehreren, alternativen Vorgaben: Option 2 hier angeben, bei mehreren sich ergänzenden Vorgaben alle hier angeben (Formular mehrfach nutzen)."
          },
          {
            "value": "flaeche3",
            "title":
                "Vorgeschriebene Flächengröße, bspw. Mindest- oder Maximalfläche.",
            "subQuestions": [],
            "description":
                " Mit + Formular 'Mengen-/Flächen-Vorgabe' nutzen! Bei mehreren, alternativen Vorgaben: Option 3 hier angeben, bei mehreren sich ergänzenden Vorgaben alle hier angeben (Formular mehrfach nutzen)."
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_flaeche",
        "title": "Flächengröße"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe", "subQuestions": []},
          {
            "value": "wiese",
            "title": "Wiese (nur geschnitten)",
            "subQuestions": []
          },
          {
            "value": "weide",
            "title": "Weide (nur beweidet)",
            "subQuestions": []
          },
          {
            "value": "wiese_weide",
            "title": "Wiese und/oder Weide",
            "subQuestions": [],
            "description":
                "Maßnahmenbeschreibung beinhaltet beide Optionen, d. h. Mahd und / oder Beweidung"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "gl_nutz_typ",
        "title": "Grünlandnutzungstyp",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["dgl", "gl", "hff", "lf", "o", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe", "subQuestions": []},
          {
            "value": "wiese",
            "title":
                "Wiese (nur geschnitten) (Das soll nach Grünlandnutzungstyp migriert werden und nach der Migration anschließend hier gelöscht werden)",
            "subQuestions": []
          },
          {
            "value": "weide",
            "title":
                "Weide (Das soll nach Grünlandnutzungstyp migriert werden und nach der Migration anschließend hier gelöscht werden)",
            "subQuestions": []
          },
          {
            "value": "wiese_weide",
            "title":
                "Wiese und/oder Weide (Das soll nach Grünlandnutzungstyp migriert werden und nach der Migration anschließend hier gelöscht werden)",
            "subQuestions": [],
            "description":
                "Maßnahmenbeschreibung beinhaltet beide Optionen, d. h. Mahd und / oder Beweidung"
          },
          {
            "value": "strob",
            "title": "Streuobst/-wiese/-bestand",
            "subQuestions": []
          },
          {"value": "heide", "title": "Heide", "subQuestions": []},
          {"value": "trock_ras", "title": "Trockenrasen", "subQuestions": []},
          {"value": "alm", "title": "Alm", "subQuestions": []},
          {"value": "hutu", "title": "Hutung", "subQuestions": []},
          {"value": "fgl", "title": "Feuchtgrünland", "subQuestions": []},
          {"value": "mras", "title": "Magerrasen", "subQuestions": []},
          {
            "value": "sens_gl",
            "title": "sensibles Grünland",
            "subQuestions": []
          },
          {
            "value": "wirtsch_gl",
            "title": "Wirtschaftsgrünland",
            "subQuestions": []
          },
          {
            "value": "sonst_gl",
            "title": "sonstiges Grünland",
            "subQuestions": [],
            "description":
                "mehrere oder nicht näher spezifizierte Grünland-typen. Ggf. im Freitext konkretisieren."
          },
          {
            "value": "biotop_ffh",
            "title":
                "sonstiges Biotopgrünland, inkl. FFH-Grünland (Flora-Fauna-Habitattypen)",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "gl_typ",
        "title":
            "Grünlandtyp bei Grünland-bezogenen Maßnahmen (wie im Text / der Beschreibung bezeichnet)",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["dgl", "gl", "hff", "lf", "o", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe", "subQuestions": []},
          {
            "value": "hauptnutz_zeit",
            "title": "Hauptnutzung zeitlich begrenzt",
            "subQuestions": [],
            "description":
                "(bspw. auch wenn Flächenstilllegung für das ganze Jahr gilt: dann Zeitraum 1.1. bis 31.12; verkürzte Weidedauer, verzögerter Auftrieb/Weidebeginn oder vorgezogener Abtrieb/Weidegangende) Mit + Zeitvorgabe anfügen, wann die Hauptnutzung zulässig ist."
          },
          {
            "value": "anz_schnitte",
            "title":
                "Anzahl Schnitte / Weidegänge  (wenn Mahd vorgegeben ist, dh. 1 oder mehr Schnitte)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "Bitte über + mit Mengen-/Flächenvorgabe konkretisieren"
          },
          {
            "value": "beweid_pflicht",
            "title": "Verpflichtende Beweidung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "Beweidung nach Mahd in Unterfrage \"Staffelung\" angeben."
          },
          {
            "value": "beweid_opt",
            "title": "Optionale Beweidung (nicht verpflichtend)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "Beweidung nach Mahd in Unterfrage \"Staffelung\" angeben."
          },
          {
            "value": "o_erneuerg",
            "title": "keine Grünland-Erneuerung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "(als Staffelung angeben, wenn GL-Erneuerung in bestimmten Situationen verboten ist, bspw. nach....)",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "gl_typ",
              "values": ["heide", "alm", "hutu", "fgl", "mras"]
            }
          },
          {
            "value": "o_walzen",
            "title": "kein Walzen",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "(als Staffelung angeben, wenn GL-Erneuerung in bestimmten Situationen verboten ist, bspw. nach....)",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "gl_typ",
              "values": ["heide", "alm", "hutu", "fgl", "mras"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          },
          {
            "value": "einschuer_o_weide",
            "title":
                "VERALTET - BITTE NICHT MEHR WÄHLEN einschürige Wiese (keine Beweidung)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "gl_typ",
                  "values": [
                    "wiese",
                    "wiese_weide",
                    "strob",
                    "fgl",
                    "mras",
                    "biotop_ffh"
                  ]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "id_foerd_per",
                  "values": ["2014-2022", "2023-2027"]
                }
              ]
            }
          },
          {
            "value": "einschuer_m_weide",
            "title":
                "VERALTET - BITTE NICHT MEHR WÄHLEN einschürige Wiese  mit darauf folgender obligater Beweidung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "gl_typ",
                  "values": ["wiese", "wiese_weide", "strob"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "id_foerd_per",
                  "values": ["2014-2022", "2023-2027"]
                }
              ]
            }
          }
        ],
        "id": "gl_bw_vg",
        "title": "Vorgaben zur Grünlandbewirtschaftung",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["ha", "erbt", "gve", "rgve"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "lf", "hff", "erbt", "o"]
            }
          ]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Struktur", "subQuestions": []},
          {
            "value": "hecke",
            "title": "Gehölz/Hecke",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["wald"]
            }
          },
          {
            "value": "saum",
            "title":
                "Blühfläche/-streifen/Brache und andere Saumstrukturen (ohne Gewässer- und Erosionsschutzstreifen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["wald"]
            }
          },
          {
            "value": "schutz_streif",
            "title": "Gewässer- oder Erosionsschutzstreifen",
            "subQuestions": []
          },
          {
            "value": "graben",
            "title": "Gräben - VERALTET - BITTE NICHT MEHR WÄHLEN",
            "subQuestions": [],
            "description":
                "Löschen falls niemand ewas hier eingegeben hat, ansonten wegen Migration rückfragen (evtl. under sonstige Struktur schieben)"
          },
          {
            "value": "vernaessg",
            "title": "Sonstiges Feuchtbiotop (bspw. Blänke, Tümpel, …)",
            "subQuestions": [],
            "description":
                "Alex: falls niemand hier etwas eingegeben hat Abkürzung vernaessg ändern in sonst_feuch_biotop"
          },
          {
            "value": "strobst",
            "title":
                "Streuobst/-wiese/-bestand - Löschen falls niemand ewas hier eingegeben hat, ansonten wegen Migration rückfragen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "lf", "hff", "biotop_le", "dk_sk", "erbt", "o"]
            }
          },
          {
            "value": "stein",
            "title": "Steinmauer, Lesesteinhaufen",
            "subQuestions": []
          },
          {
            "value": "biotop_bes",
            "title":
                "Trockenrasen, Heide etc. - Löschen falls niemand ewas hier eingegeben hat, ansonten wegen Migration rückfragen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": [
                "gl",
                "dgl",
                "lf",
                "hff",
                "biotop_le",
                "dk_sk",
                "erbt",
                "o"
              ]
            }
          },
          {
            "value": "le_undef",
            "title": "Strukturelemente nicht definiert",
            "subQuestions": [],
            "description":
                "(bspw. \"naturnahe Strukturelemente\" oder mehrere, unterschiedliche Elemente inbegriffen)\""
          },
          {
            "value": "biotop",
            "title": "Sonstige Biotope",
            "subQuestions": [],
            "description":
                "Alex: falls niemand hier etwas eingegeben hat Abkürzung biotop ändern in sonst_biotop",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "sh_art",
        "title": "Art der betreffenden Struktur / des Lebensraums",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["pieces", "ha", "erbt"]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "verpfl_neuanl_begin",
            "title":
                "einmalige Neuanlage zu Beginn der Verpflichtung (bspw: Pflanzung einer Hecke, Anlage Gewässer- oder Erosionsschutzstreifen)",
            "subQuestions": []
          },
          {
            "value": "verpfl_neuanl_regelm",
            "title":
                "regelmäßige Neuanlage im Verpflichtungszeitraum (bspw. jährl. Aussaat bei einjährigen Blühstreifen, einjährigen Altgrasstreifen)",
            "subQuestions": [],
            "description":
                "(bspw: überjährige Blühstreifen regelmäßig umbrechen und neu ansäen)"
          },
          {
            "value": "verpfl_pflege",
            "title":
                "Bewirtschaftung bzw. Pflege einer bestehenden Struktur im Verpflichtungszeitraum (bspw. einmal jährlich mähen auf Grünland, Heckenschnitt)",
            "subQuestions": [],
            "description":
                "(bspw: jährliche Heckenpflege, regelmäßiges Mulchen einer Feuchtwiese). + zur Konkretisierung nutzen."
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "sh_pflg_art",
        "title": "Bewirtschaftungs- oder Pflegeart bzw. Anlage-Zyklen",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["anlage_pflege", "extens", "flst", "umwandlg", "erbt"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["pieces", "ha", "erbt"]
            },
            {
              "type": "ContainsNoneOf",
              "field": "sh_art",
              "values": ["o"]
            }
          ]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Pflege vorgegeben / keine Angabe",
            "subQuestions": []
          },
          {
            "value": "pflege_einmal",
            "title":
                "einmalige Pflege oder Bewirtschaftung bestehender Strukturen",
            "subQuestions": []
          },
          {
            "value": "pflege_ann",
            "title":
                "mindestens jährliche Pflege oder Bewirtschaftung bestehender Strukturen",
            "subQuestions": []
          },
          {
            "value": "staffelg_t_ao",
            "title":
                "zeitlich und/oder räumliche Staffelung von Pflege-/Bewirtschaftungsschritten",
            "subQuestions": [],
            "description":
                "(bspw: zeitversetzte Mahd von Streifen im extensiven Grünland)"
          },
          {
            "value": "undef",
            "title": "Pflege-/Bewirtschaftungsrhytmus nicht definiert",
            "subQuestions": [],
            "description":
                "d. h. Pflege ist Bestandteil der Auflagen, wird aber nicht näher konkretisiert"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "sh_pflg_haeuf",
        "title": "Pflege- / Bewirtschaftungs-Häufigkeit",
        "description":
            "(Hier sind überjährige Aktivitäten, nicht die unterjährigen, anzugeben)",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["anlage_pflege", "extens", "flst", "umwandlg", "erbt"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["pieces", "ha", "erbt"]
            },
            {
              "type": "ContainsNoneOf",
              "field": "sh_art",
              "values": ["o"]
            }
          ]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title":
                "kein Nutzungsausschluss, Aufwuchs darf beliebig genutzt werden oder es gibt hierzu keine Angabe",
            "subQuestions": []
          },
          {
            "value": "o_abfuhr",
            "title": "Nutzung ist ausgeschlossen, keine Ernteabfuhr",
            "subQuestions": []
          },
          {
            "value": "abfuhr_f_biogs",
            "title": "Erntegutnutzung ausschließlich für Biogasanlagen",
            "subQuestions": []
          },
          {
            "value": "beweidg_af_erlaubt",
            "title":
                "ausschließlich Beweidung mit Schafen oder Ziegen auf nicht-Grünlandfläche erlaubt",
            "subQuestions": []
          },
          {
            "value": "schroepfen",
            "title": "ausschließlich Schröpfschnitt erlaubt",
            "subQuestions": [],
            "description": "(bspw. auf Blühstreifen und -flächen)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bw_nutz_ausschl",
        "title": "Nutzung des Aufwuchses / Nutzungsausschluss",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "pieces", "erbt"]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine", "subQuestions": []},
          {
            "value": "hfrucht",
            "title": "auf Hauptfrucht",
            "subQuestions": [],
            "description":
                "(Kultur die den Großteil des ökonomischen Nutzens bringt, steht normalerweise in der Hauptwachstumsphase (April bis Juli) auf der Fläche). Die Bewirtschaftung der Hauptkultur auf der Fläche, auf der die Maßnahme umgesetzt wird, wird verändert/beeinflusst, bspw. durch reduzierte Fläche, vorgeschriebene oder verbotene Bearbeitungsschritte oder bestimmte Kulturwahl (Konsequenz ist oft ein geringerer Ertrag)."
          },
          {
            "value": "nfrucht",
            "title": "nur auf Nebenfrucht",
            "subQuestions": [],
            "description":
                "(Kultur die meist keinen unmittelbaren oder zumindest einen deutlich geringeren ökonomischen Nutzen hat bspw. Zwischenfrüchte, Vorfrüchte (wie Grünroggen)). Maßnahme bezieht sich auf Kulturen, die nicht für die wesentliche Wertschöpfung im Betrieb dienen. bspw: Anbau bestimmter Zwischenfrüchte"
          },
          {
            "value": "h_n_nfrucht",
            "title": "auf Haupt- und Nebenfrucht",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bw_kult",
        "title": "betroffene Frucht",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["al", "lf", "hff", "dk_sk", "erbt", "o"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne Angabe", "subQuestions": []},
          {
            "value": "vieh_red",
            "title": "Vorgaben zum Viehbesatz/-bestand.",
            "subQuestions": [],
            "description":
                "Mit + im Formular Mengen-/Flächen-Vorgabe ggf. Besatzdichte angeben."
          },
          {
            "value": "veraenderg_tierhaltg",
            "title": "Vorgaben zu Haltungsbedingungen auf der Fläche",
            "subQuestions": [],
            "description":
                "bspw. Beweidung, Alex / mit Norbert: schauen wer hier etwas zu Stallumbau, Haltung auf Stroh, Einstreu, Platzangebot eingegeben hat -> migrieren nach Vorgaben zu Haltungsbedingungen im Stall, danach schauen ob noch etwas eingegeben ist. Falls nein: Abkürzung umbenennen in vg_halt_beding_flaech bzw. migieren",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["ea"]
            }
          },
          {
            "value": "vg_halt_beding_stall",
            "title": "Vorgaben zu Haltungsbedingungen im Stall",
            "subQuestions": [],
            "description":
                " (bspw. Einstreu, Platzangebot, Stallumbau) bspw. Beweidung, Alex / mit Norbert: schauen wer hier etwas zu Stallumbau, Haltung auf Stroh, Einstreu, Platzangebot eingegeben hat -> migrieren nach Vorgaben zu Haltungsbedingungen im Stall",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["ea"]
            }
          },
          {
            "value": "bweidg_kurz",
            "title":
                "verzögerter Auftrieb/Weidebeginn oder vorgezogener Abtrieb/Weidegangende, somit verkürzte Weidedauer VERALTET - BITTE NICHT MEHR WÄHLEN wurde verschoben nach Vorgaben zur Grünlandbewirtschaftung",
            "subQuestions": [],
            "description":
                "Alex: schauen, ob jemand etwas eingetragen hat. Wenn ja, migrieren nach Vorgaben zur Grünlandbewirtschaftung - verzögerter Auftrieb/Weidebeginn"
          },
          {
            "value": "bes_art_rasse",
            "title": "Haltung einer bestimmten Tierart",
            "subQuestions": [
              {
                "type": "MultipleChoiceQuestion",
                "choices": [
                  {"value": "o", "title": "keine/ohne", "subQuestions": []},
                  {"value": "schaf", "title": "Schafe", "subQuestions": []},
                  {"value": "ziege", "title": "Ziegen", "subQuestions": []},
                  {
                    "value": "w_bueffel",
                    "title": "Wasserbüffel",
                    "subQuestions": []
                  },
                  {"value": "schw", "title": "Schweine", "subQuestions": []},
                  {"value": "gefl", "title": "Geflügel", "subQuestions": []},
                  {
                    "value": "rind_o_miku",
                    "title": "Rinder ohne Milchkühe",
                    "subQuestions": []
                  },
                  {"value": "miku", "title": "Milchkühe", "subQuestions": []},
                  {"value": "pferd", "title": "Pferde", "subQuestions": []},
                  {"value": "biene", "title": "Bienen", "subQuestions": []},
                  {
                    "value": "selten",
                    "title":
                        "Andere oder nicht näher spezifizierte seltene/bedrohte Nutztierrassen",
                    "subQuestions": []
                  },
                  {
                    "value": "erbt",
                    "title": "wird in Varianten / Untermaßnahmen definiert",
                    "subQuestions": []
                  },
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "rv_tierart",
                "title": "Haltung einer bestimmten Tierart"
              }
            ]
          },
          {
            "value": "n_red_fuetterg",
            "title": "N/Stickstoff-reduzierte Fütterung von Tieren",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "twm_ziel", "erbt"]
            }
          },
          {
            "value": "verzicht",
            "title":
                "Verzicht Kupierung (Schnäbel, Hörner, Ringelschwänze etc.)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "twm_ziel", "erbt"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bw_vieh_vg",
        "title": "Tierhaltung",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsNoneOf",
              "field": "mch_kat",
              "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
            },
            {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["dk_sk", "biotop_le", "wald"]
            }
          ]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe/ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "red_bbearb_m_technik",
            "title":
                "reduzierte Bodenbearbeitung mit Vorgabe einer/mehrerer spezifischen/besonderen Bearbeitungstechnik/en",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "(bspw. mit Vorgabe, dass zu grubbern oder eggen ist, nicht gepflügt werden darf)",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_fl",
                  "values": ["wald"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "anlage_pflege"]
                }
              ]
            }
          },
          {
            "value": "red_bbearb_o_technik",
            "title":
                "Vorgabe der Flächengestaltung (bspw. Bewirtschaftung quer zum Hang)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "Alex: falls niemand hier etwas eingegeben hat Abkürzung red_bbearb_o_technik ändern in vg_flaech_gestal",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_fl",
                  "values": ["wald"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "o_bbearb",
            "title": "vollständiges Verbot der Bodenbearbeitung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "(ggf. Zeitfenster mit Formular \"Zeitvorgabe\" konkretisieren)"
          },
          {
            "value": "gl_erneu_flach",
            "title":
                "Grünlanderneuerung nur flachwendend / pfluglos / nicht wendend / durch vollflächiges Durchschneiden der Grasnarbe",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description": "",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "lf", "hff", "erbt", "o"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bbearb_vg",
        "title": "Bodenbearbeitung",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe / ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "keine",
            "title": "keine Düngung erlaubt",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "value": "ausbring_techn",
            "title": "besondere Ausbringungstechnik",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "(bspw. Schleppschlauch) mit weiteren Angaben in Technische Anforderungen"
          },
          {
            "value": "ausbring_t_kurz",
            "title": "verkürzte oder vorgegebene Ausbringungszeiten",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "value": "dueng_red",
            "title": "reduzierte Düngungsmenge",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
                "(erlaubte Düngemenge auf ein Jahr hochrechnen, wenn Menge pro Gabe und Anzahl Gaben benannt sind)"
          },
          {
            "value": "dueng_spez_art",
            "title": "Beschränkung auf spezifische Düngemittel",
            "subQuestions": [
              {
                "type": "MultipleChoiceQuestion",
                "choices": [
                  {"value": "o", "title": "keine Angabe", "subQuestions": []},
                  {
                    "value": "dueng_org_tier_liqu",
                    "title": "organisch",
                    "subQuestions": [
                      {
                        "type": "MultipleChoiceQuestion",
                        "choices": [
                          {
                            "value": "dueng_org_tier_fest",
                            "title": "tierisch, fest (Festmist)",
                            "subQuestions": []
                          },
                          {
                            "value": "dueng_org_tier_liqu",
                            "title": "tierisch, flüssig (bspw. Gülle)",
                            "subQuestions": []
                          },
                          {
                            "value": "dueng_org_pflz",
                            "title": "pflanzlich (Gärrest)",
                            "subQuestions": []
                          },
                          {
                            "value": "dueng_org",
                            "title":
                                "nicht genauer differenziert: Wirtschaftsdünger",
                            "subQuestions": []
                          }
                        ],
                        "id": "org_dueng_spez",
                        "title": "organisches Düngemittel"
                      }
                    ]
                  },
                  {
                    "value": "dueng_miner",
                    "title": "mineralisch",
                    "subQuestions": []
                  },
                  {
                    "value": "dueng_stoff",
                    "title":
                        "Bestimmte Inhalts- oder Nährstoffe sind zulässig oder ausgeschlossen.",
                    "subQuestions": [],
                    "description":
                        "Als Freitext angeben, wie die Auflage lautet."
                  },
                  {
                    "value": "dueng_bu",
                    "title": "Düngung auf Grundlage einer Bodenuntersuchung",
                    "subQuestions": []
                  },
                  {
                    "value": "stabil_dueng",
                    "title":
                        "Einsatz stabilisierter Dünger (bspw. CULTAN-Verfahren, N-Depotdüngung)",
                    "subQuestions": [],
                    "enabledIf": {
                      "type": "CheckAllConditions",
                      "conditions": [
                        {
                          "type": "ContainsAnyOf",
                          "field": "dueng_vg",
                          "values": ["dueng_spez_art", "erbt"]
                        },
                        {
                          "type": "ContainsNoneOf",
                          "field": "mch_foerd_klass",
                          "values": ["azl", "twm_ziel"]
                        },
                        {
                          "type": "ContainsNoneOf",
                          "field": "mch_kat",
                          "values": [
                            "anlage_pflege",
                            "umwandlg",
                            "bes_kult_rass"
                          ]
                        },
                        {
                          "type": "ContainsNoneOf",
                          "field": "mch_ziel_einh",
                          "values": ["rgve"]
                        }
                      ]
                    }
                  },
                  {
                    "value": "erbt",
                    "title": "wird in Varianten / Untermaßnahmen definiert",
                    "subQuestions": []
                  },
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "dueng_art",
                "title": "Düngung Art"
              },
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "dueng_vg",
        "title": "Düngung",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["wald"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["ha", "o", "erbt"]
            }
          ]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe / ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "pfl_sch_kein",
            "title":
                "kein Pflanzenschutz zulässig (Einzelpflanzenbehandlung auf Antrag kann möglich sein)",
            "subQuestions": []
          },
          {
            "value": "pflz_sch_integr",
            "title": "nur integrierter Pflanzenschutz",
            "subQuestions": []
          },
          {
            "value": "pflz_sch_biol_ausbring",
            "title": "nur gezielte Ausbringung von Nützlingen oder Pheromonen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "biotop_le", "o"]
            }
          },
          {
            "value": "pflz_sch_chem_einzel",
            "title":
                "nur Einzelpflanzenbehandlung mit chemischem Pflanzenschutz zulässig",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["al", "lf", "dk_sk", "erbt", "o"]
            }
          },
          {
            "value": "pflz_sch_o",
            "title":
                "kein chemischer Pflanzenschutz (Einzelpflanzenbehandlung auf Antrag kann möglich sein) VERALTET - BITTE NICHT MEHR WÄHLEN",
            "subQuestions": [],
            "description":
                "Alex: schauen, ob jemand etwas eingetragen hat. Wenn ja, migrieren nach kein Pflanzenschutz zulässig (Einzelpflanzenbehandlung auf Antrag kann möglich sein)"
          },
          {
            "value": "pflz_sch_o_herbiz",
            "title": "keine Herbizide",
            "subQuestions": []
          },
          {
            "value": "pflz_sch_o_wregelg",
            "title": "kein Wachstumsregler",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["al", "lf", "dk_sk", "erbt", "o"]
            }
          },
          {
            "value": "pflz_sch_einschraenk_option",
            "title": "optionale Einschränkung (im Freitext konkretisieren)",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "pflz_sch",
        "title": "Pflanzenschutz",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "o", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne", "subQuestions": []},
          {
            "value": "red_reifen_druck",
            "title": "Reduzierter Reifendruck",
            "subQuestions": []
          },
          {"value": "mulch_egge", "title": "Mulchen/Eggen", "subQuestions": []},
          {
            "value": "direkt_o_mulch_saat_o_pflanz",
            "title": "Direktsaat-/Mulchsaat-/Mulchpflanzverfahren",
            "subQuestions": []
          },
          {
            "value": "spez_maehtechn",
            "title": "Besondere Mähtechnik, bspw. Messerbalken",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "lf", "hff", "biotop_le", "erbt", "o"]
            }
          },
          {
            "value": "spez_weidetechn",
            "title": "Besondere Weidetechnik (Standweide)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["gl", "dgl", "lf", "hff", "biotop_le", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "gl_typ",
                  "values": ["wiese"]
                }
              ]
            }
          },
          {
            "value": "vernaessg",
            "title":
                "Vernässung, zumindest temporär (bspw: Wasserstandsanhebung im Winter, Rückbau von Drainagen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["oelb"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["twm_ziel"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["m3", "pieces", "gve", "rgve"]
                }
              ]
            }
          },
          {
            "value": "flaech_spezif_dueng",
            "title":
                "standortangepasst/teilflächenspezifisch (bspw. bei Düngung oder Einsatz von Exaktstreuer)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["twm_ziel"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "dueng_plang",
            "title": "Analysen zur Düngungsplanung",
            "subQuestions": [],
            "description":
                "bspw. Bodenuntersuchung/Frühjahres-Nmin-Analyse, Pflanzenanalysen, Wirtschaftsdünger- und Gärsubstratanalysen, Hoftorbilanzen, NIRS-Verfahren",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["twm_ziel"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege", "flst", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "remiss_red_ausbring_techn",
            "title":
                "Emissionsarme Ausbringungstechnik (Schleppschlauch/-Schuh etc.)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "dueng_vg",
                  "values": ["ausbring_techn", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": [
                    "anlage_pflege",
                    "flst",
                    "umwandlg",
                    "bes_kult_rass"
                  ]
                }
              ]
            }
          },
          {
            "value": "in_reihe",
            "title": "in Reihen (bspw. strip till oder Düngung in Reihen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege", "flst", "bes_kult_rass"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_fl",
                  "values": ["gl", "dgl", "biotop_le", "wald"]
                }
              ]
            }
          },
          {
            "value": "weite_reihe",
            "title":
                "Aussaat/Anpflanzung in weiter Reihe / doppeltem Reihenabstand / mit reduzierter Saatstärke/-menge",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "dk_sk", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["flst"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["m3"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["pieces", "gve", "rgve"]
                }
              ]
            }
          },
          {
            "value": "enge_reihe",
            "title": "Aussaat/Anpflanzung mit enger Reihe",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "dk_sk", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["flst"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["m3"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["pieces", "gve", "rgve"]
                }
              ]
            }
          },
          {
            "value": "dekant",
            "title": "Dekanter",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "dueng_vg",
              "values": ["ausbring_techn", "erbt"]
            }
          },
          {
            "value": "mark_stauhh",
            "title": "Feste Markierung der Stauhöhe am Bauwerk",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["wasser", "erbt"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "tech",
        "title":
            "Technische Anforderungen zur ordnungsgemäßen Umsetzung der Maßnahme"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne", "subQuestions": []},
          {
            "value": "natsch_kulissen",
            "title":
                "Naturschutzgebiete i. w. S. (NSG, SPA, FFH, Biosphärengebiete, Nationalparke, ...)",
            "subQuestions": []
          },
          {
            "value": "wassersch_kulissen",
            "title": "Wasserschutzgebiete (HQ20, rote Wasserkörper, …)",
            "subQuestions": []
          },
          {
            "value": "bsch_kulissen",
            "title":
                "Bodenschutzgebiete (Wassererosionsschutzgebiete, Winderosionsschutzgebiete, organische Böden, …)",
            "subQuestions": []
          },
          {"value": "gunst_lag", "title": "Gunstlagen", "subQuestions": []},
          {
            "value": "ungunst",
            "title": "Berglagen / Ungunstlagen",
            "subQuestions": [],
            "description":
                "Alex: schauen, ob jemand etwas zu Alm eingetragen hat. Wenn ja, wurde es auch dort angegeben wo es eigentlich hin gehört (gl_typ)? Hier gehört es jedenfalls nicht hin."
          },
          {
            "value": "organ_o_feucht",
            "title": "Moorstandorte / Feuchtgebiete / organische Böden",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "andere räumliche Definition (im Freitext angeben)",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "rv_kuliss_r_def",
        "title": "räumlich definierte Kulisse",
        "description":
            "(Angabe nur, wenn in Richtlinie die räumliche Kulisse explizit benannt ist; Maßnahme kann nur innerhalb von auf Landkarten abgrenzbaren Gebieten umgesetzt werden)"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne", "subQuestions": []},
          {
            "value": "lage",
            "title":
                "Lage (bspw. an Gewässern, an Knicks, an Waldrändern) - im Freitext konkretisieren",
            "subQuestions": []
          },
          {
            "value": "kultur",
            "title":
                "Kulturen / Kulturgruppen (nach Mais, Reihenkulturen, vor Wintergetreide, ...)",
            "subQuestions": [
              {
                "type": "SingleChoiceQuestion",
                "choices": [
                  {
                    "value": "ausschluss",
                    "title": "nicht zu / nicht bei",
                    "subQuestions": []
                  },
                  {"value": "vorab", "title": "vor", "subQuestions": []},
                  {"value": "incl", "title": "zu / bei", "subQuestions": []},
                  {"value": "danach", "title": "nach", "subQuestions": []},
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "rv_kuliss_i_erl_zuw",
                "title":
                    "Zuweisung für Erläuterung inhaltliche Flächendefinition \"thematische Kulisse\" "
              },
              {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
            ],
            "description":
                "im nächsten Feld als 'Zuweisung' die Präposition auswählen (bspw. 'vor'), danach die Unterfrage für Kulturen nutzen.",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["al", "lf", "dk_sk", "hff", "erbt", "o"]
            }
          },
          {
            "value": "habitat_o_art",
            "title":
                "Vorhandensein oder Vorkommen besonderer Habitate / Zielarten",
            "subQuestions": [],
            "description":
                "bspw. artenreiches Grünland, FFH-Lebensraumtypen, Ackerlebensräume, Feldhamstervorkommen"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "rv_kuliss_i_def",
        "title": "inhaltlich definierte Kulisse",
        "description":
            "(Maßnahme kann nur dort umgesetzt werden, wo bestimmte lokale Bedinungen erfüllt sind)"
      },
      {"type": "ReuseSurveyEntry", "reuseId": "staffelg"},
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe / ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "bereg",
            "title": "keine Beregnung",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "entwaess",
            "title": "keine Entwässerung, Drainage",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "gl", "dgl", "lf", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "meliorat",
            "title":
                "keine Melioration (jegliche Be- und Entwässerung der Fläche)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "gl", "dgl", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "rv_be_entwaesser",
        "title": "Wassermanagement (Be- und Entwässerung inkl. Vernässung)",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "keine-Vorgabe",
            "title": "keine Vorgabe",
            "subQuestions": []
          },
          {
            "value": "vorgeschr-anzahl-zeitgleich-kulturen",
            "title":
                "vorgeschriebene Anzahl von Arten/Kulturen, die zeitgleich angebaut werden müssen oder Anzahl nachzuweisender Kennarten",
            "subQuestions": [],
            "description":
                "(bspw: Mindestanzahl bestimmter Kulturen im Betrieb). Mit + im Formular für Mengen-/Flächen-Vorgaben die Anzahl der Kulturen angeben (Nenner: förderfähige Ackerkulturen). Ggf. Flächen- oder Mengenvorgaben einzelner Kulturen im nächsten Punkt bei \"Vorgaben zu Kulturen\" angeben."
          },
          {
            "value": "vorg-kulturen",
            "title":
                "Vorgaben zur Art der anzubauenden Kulturen oder anderen auszubringenden Pflanzen (welche, wie viel wird konkretisiert)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
            ]
          },
          {
            "value": "kultur",
            "title":
                "expliziter Ausschluss bestimmter Kulturen oder Kulturgruppen",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us"]
                }
              ]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "vorgabe-art-mischung-saatgut",
        "title":
            "Pflanzenart oder der Anzahl von Arten, die angebaut/gesät werden müssen bzw. nicht zulässig sind"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "bearb", "title": "in Bearbeitung", "subQuestions": []},
          {"value": "contact", "title": "Rücksprache", "subQuestions": []},
          {
            "value": "sonderfall",
            "title": "Sonderfall (nicht validierbar)",
            "subQuestions": [],
            "description":
                "Eingabe ist korrekt und abgeschlossen, aber aufgrund der starren Bedingungen im MET werden Fehler bei der Validierung angezeigt"
          },
          {"value": "fertig", "title": "abgeschlossen", "subQuestions": []}
        ],
        "id": "last_status",
        "title": "Status"
      }
    ]
  }
};

final surveyString = '''{
  "id": 12,
  "name": "Maßnahmen Eingabe Workshop",
  "description": "Maßnahmen Eingabe Workshop",
  "structure": {
    "definitions": [
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "ja",
            "title": "Ja",
            "subQuestions": [
              {
                "type": "SingleChoiceQuestion",
                "choices": [
                  {
                    "value": "inkl",
                    "title": "Inklusiv / Vorgegebene Abfolge",
                    "subQuestions": []
                  },
                  {
                    "value": "exkl",
                    "title": "Exklusiv / Ausschluss von",
                    "subQuestions": []
                  },
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "staffelg_inkl_excl",
                "title": "Staffelung als Vorgabe oder mit Verzicht"
              },
              {
                "type": "MultipleChoiceQuestion",
                "choices": [
                  {"value": "räuml", "title": "räumlich", "subQuestions": []},
                  {"value": "zeitl", "title": "zeitlich", "subQuestions": []},
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "staffelg_räuml_zeitl",
                "title": "Staffelung im Raum oder im Zeitverlauf"
              }
            ]
          },
          {"value": "nein", "title": "Nein", "subQuestions": []},
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "staffelg",
        "title": "Staffelung",
        "description":
        "im zeitlichen Verlauf oder in einer räumlichen Anordnung müssen verschiedene Schritte/Prozesse hinter-/nebeneinander erfolgen oder sind ausgeschlossen"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "getreide",
            "title": "Getreide (alle / nicht spezifiziert)",
            "subQuestions": []
          },
          {
            "value": "hauptfr",
            "title": "Hauptfruchtarten (alle / nicht spezifiziert)",
            "subQuestions": []
          },
          {"value": "wwei", "title": "Winterweizen", "subQuestions": []},
          {"value": "mais", "title": "Mais", "subQuestions": []},
          {"value": "raps", "title": "Raps", "subQuestions": []},
          {
            "value": "hackfrüchte",
            "title": "Hackfrüchte (alle / nicht spezifiziert)",
            "subQuestions": []
          },
          {"value": "kart", "title": "Kartoffeln", "subQuestions": []},
          {"value": "gemüse", "title": "Gemüse", "subQuestions": []},
          {
            "value": "sommerkulturen",
            "title": "Sommerkulturen",
            "subQuestions": []
          },
          {"value": "skul", "title": "Sonderkulturen", "subQuestions": []},
          {
            "value": "untersaat",
            "title": "Untersaat (muss nicht detaillierter angegeben werden)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["zf_us", "extens", "anbaudiv", "erbt"]
            }
          },
          {
            "value": "legum",
            "title": "Leguminosen / Eiweißpflanzen (alle, auch in Gemengen)",
            "subQuestions": []
          },
          {
            "value": "kleinkörn-legum",
            "title":
            "kleinkörnige Leguminosen / Eiweißpflanzen (auch in Gemengen)",
            "subQuestions": []
          },
          {
            "value": "großkörn-legum",
            "title":
            "großkörnige Leguminosen / Eiweißpflanzen (auch in Gemengen)",
            "subQuestions": []
          },
          {
            "value": "mischung-ohne-legum",
            "title": "Mischung ohne Leguminosen",
            "subQuestions": []
          },
          {
            "value": "blüh-arten",
            "title":
            "blühende Arten oder Wildpflanzenarten ohne genauere Vorgabe",
            "subQuestions": []
          },
          {
            "value": "konkr-blühmisch",
            "title": "konkrete Blühmischung",
            "subQuestions": []
          },
          {
            "value": "auswahl-kulturen",
            "title":
            "Auswahlliste möglicher Arten/Kulturen (Referenzliste), aus denen gewählt werden kann",
            "subQuestions": []
          },
          {"value": "brache", "title": "Brache", "subQuestions": []},
          {
            "value": "seltene-kulturen",
            "title": "seltene Kulturen",
            "subQuestions": []
          },
          {
            "value": "grünland-feld-ackergras-gräser",
            "title": "Grünland, Feld- oder Ackergras / Ackerfutter, Gräser",
            "subQuestions": []
          },
          {
            "value": "winterhart-zwfrüchte",
            "title": "winterharte Zwischenfrüchte",
            "subQuestions": []
          },
          {
            "value": "abfrier-zwfrüchte",
            "title": "abfrierende Zwischenfrüchte",
            "subQuestions": []
          },
          {
            "value": "beliebig-kulturarten",
            "title": "beliebige Kulturarten VERALTET - BITTE NICHT MEHR WÄHLEN",
            "subQuestions": [],
            "description":
            "Alex: schauen, ob jemand etwas eingetragen hat. Wenn ja, WIE GEHT DAS DENN? Mit Norbert anschauen"
          },
          {
            "value": "schilf",
            "title":
            "nicht-invasives Schilf (Phragmites australis), oder Rohrkolben (Typha spec.)",
            "subQuestions": []
          },
          {"value": "sonstige", "title": "Sonstige", "subQuestions": []},
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "vorg-sorten-kulturen",
        "title": "Welche Sorten/Kulturen sind vorgegeben?",
        "description":
        "Ggf. das Formular 'Mengen-/Flächen-Vorgaben' (bei +) nutzen."
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "ja",
            "title": "Ja (bitte mit + Beschreibung im Freitext ergänzen)",
            "subQuestions": []
          },
          {"value": "nein", "title": "Nein", "subQuestions": []},
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "ausnahm",
        "title": "Gibt es Ausnahmen von dieser Auswahl?"
      }
    ],
    "questions": [
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "citavi",
            "title": "Citavi-IDs",
            "subQuestions": [],
            "description":
            "Aus dem Feld 'Freitext 9' der Titel-Ansicht im Citavi. Bei leerem Feld muss dies durch ein Makro gefüllt werden, siehe Handbuch zum Metadaten-Citavi (Cloud). Wenn mehrere Dokumente genutzt werden, mehrere Freitext-Felder nutzen.)"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "quellen",
        "title":
        "Quellen (Citavi-IDs der genutzten Dokumente im Metadaten-Citavi)"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "2014-2022", "title": "2014-2022", "subQuestions": []},
          {"value": "2023-2027", "title": "2023-2027", "subQuestions": []}
        ],
        "id": "id_foerd_per",
        "title": "Förderperiode"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "de",
            "title": "Ganz Deutschland (alle Bundesländer)",
            "subQuestions": []
          },
          {"value": "bw", "title": "Baden-Württemberg", "subQuestions": []},
          {"value": "by", "title": "Bayern", "subQuestions": []},
          {"value": "be", "title": "Berlin", "subQuestions": []},
          {"value": "bb", "title": "Brandenburg", "subQuestions": []},
          {"value": "hb", "title": "Bremen", "subQuestions": []},
          {"value": "hh", "title": "Hamburg", "subQuestions": []},
          {"value": "he", "title": "Hessen", "subQuestions": []},
          {
            "value": "mv",
            "title": "Mecklenburg-Vorpommern",
            "subQuestions": []
          },
          {"value": "ni", "title": "Niedersachsen", "subQuestions": []},
          {"value": "nw", "title": "Nordrhein-Westfalen", "subQuestions": []},
          {"value": "rp", "title": "Rheinland-Pfalz", "subQuestions": []},
          {"value": "sl", "title": "Saarland", "subQuestions": []},
          {"value": "sn", "title": "Sachsen", "subQuestions": []},
          {"value": "st", "title": "Sachsen-Anhalt", "subQuestions": []},
          {"value": "sh", "title": "Schleswig-Holstein", "subQuestions": []},
          {"value": "th", "title": "Thüringen", "subQuestions": []}
        ],
        "id": "id_bdl",
        "title": "Bundesland"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "code_land",
            "title": "Code der Maßnahme",
            "subQuestions": [],
            "description":
            "Steht i. d. R. vor der Maßnahmen-Bezeichnung (bspw: AL5). Code als Freitext eintragen. Sofern mehrere Codes vorhanden sind, über + ein weiteres Freitext-Feld je Code anlegen."
          },
          {"value": "o", "title": "kein Code vorhanden", "subQuestions": []},
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "code_land",
        "title": "Maßnahmen-Code"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "norm",
            "title": "nicht unterteilte Maßnahme (Standard).",
            "subQuestions": [],
            "description":
            "(siehe Handbuch); Ergänzende Top-Ups sind möglich, aber nicht erforderlich. Es gibt keine Unterteilung in verschiedene Varianten."
          },
          {
            "value": "komplex",
            "title":
            "Komplexmaßnahme (beinhaltet verschiedene Varianten) (siehe Handbuch)",
            "subQuestions": []
          },
          {
            "value": "variante",
            "title": "Variante einer Komplexmaßnahme",
            "subQuestions": [
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "variante",
                "title": "Zugeordnete Komplexmaßnahme"
              }
            ],
            "description": "(siehe Handbuch)"
          },
          {
            "value": "top_up",
            "title":
            "Top-Up-Maßnahme, die auf eine andere Maßnahme aufgesattelt werden kann",
            "subQuestions": [
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up",
                "title": "Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_2",
                "title": "Optional: 2. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_3",
                "title": "Optional: 3. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_4",
                "title": "Optional: 4. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_5",
                "title": "Optional: 5. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_6",
                "title": "Optional: 6. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_7",
                "title": "Optional: 7. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_8",
                "title": "Optional: 8. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_9",
                "title": "Optional: 9. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_10",
                "title": "Optional: 10. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_11",
                "title": "Optional: 11. Basismaßnahme zur TopUp-Maßnahme"
              },
              {
                "type": "LinkOtherSurveyQuestion",
                "id": "top_up_12",
                "title": "Optional: 12. Basismaßnahme zur TopUp-Maßnahme"
              }
            ],
            "description":
            "(siehe Handbuch); (wird bspw. auf derselben Fläche umgesetzt). Ist aber dennoch als eigenständige Maßnahme definiert, nicht als Variante."
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "komplex_typ",
        "title": "Komplex-Maßnahme"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "aukm",
            "title": "Agrarumwelt- und Klimamaßnahme AUKM",
            "subQuestions": [],
            "description":
            "(inkl. Ökolandbau; in einem Programm/einer Richtlinie definierte Maßnahme mit detaillierten Auflagen, die für alle teilnehmenden Betriebe gleich angewendet werden (keine individuellen Absprachen/Verträge). Keine der anderen Optionen."
          },
          {
            "value": "azl",
            "title": "Ausgleichszulage für wirtschaftliche Benachteiligung",
            "subQuestions": []
          },
          {
            "value": "ea",
            "title":
            "Erschwernisausgleich für ordnungsrechtliche Auflagen  (bspw. Natura 2000)",
            "subQuestions": []
          },
          {
            "value": "vns",
            "title":
            "Vertragsnaturschutz, individuelle Verträge und Regelungen",
            "subQuestions": [],
            "description":
            "Maßnahmen, die im Programm bzw. der Richtlinie vollständig definiert und beschrieben sind = AUKM, auch wenn sie (wie in Bayern) Vertragsnaturschutz heißen."
          },
          {
            "value": "oer",
            "title": "Ökoregelung",
            "subQuestions": [],
            "description":
            "(bundesweit einheitliche Maßnahmen der ersten GAP-Säule, Stand 2023 sind dies 7 verschiedene Maßnahmen) sowie gekoppelte Prämien"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_foerd_klass",
        "title":
        "Förderklasse (Welche EU-rechtlichen Rahmenbedingungen gelten?)"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "zf_us",
            "title": "Anbau Zwischenfrucht/Untersaat",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["aukm", "oer"]
            }
          },
          {
            "value": "anlage_pflege",
            "title": "Anlage oder Pflege einer Struktur",
            "subQuestions": [],
            "description": "bspw. Hecke, Kleingewässer, Blühstreifen",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "dungmang",
            "title": "Düngemanagement",
            "subQuestions": [],
            "description":
            "Anpassung / Änderung der Düngung, meist Reduktion der Düngemenge oder bestimmte Düngemittel",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "extens",
            "title":
            "Extensivierung der Flächennutzung oder Tierhaltung, sofern nicht durch andere Optionen abgedeckt",
            "subQuestions": [],
            "description":
            "(bspw: Reduktion der Schnitthäufigkeit, Verzicht auf Pflanzenschutzmittel)"
          },
          {
            "value": "flst",
            "title":
            "Flächenstilllegung/Brache (Fläche wird aus jeglicher produktiver Nutzung genommen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "umwandlg",
            "title": "Nutzungsumwandlung (bspw: Grünland- statt Ackernutzung)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "oer"]
            }
          },
          {
            "value": "bes_kult_rass",
            "title": "Förderung bestimmter Rassen / Sorten / Kulturen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["ea"]
            }
          },
          {
            "value": "anbaudiv",
            "title": "Anbaudiversität / Erhöhung der Kulturartenvielfalt",
            "subQuestions": []
          },
          {
            "value": "wasser",
            "title": "Wasserstandsanhebung / Stauhöhe",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "Anderes",
            "subQuestions": [],
            "description": "Bitte mit + Freitext hinzufügen und Ziel angeben"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_kat",
        "title": "Kategorie (Einschätzung auf Basis der Maßnahmenbeschreibung)"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title":
            "keine Angabe bzw. nicht aus den genutzten Dokumenten ersichtlich",
            "subQuestions": []
          },
          {
            "value": "eler",
            "title": "ELER, inkl. Ko-Finanzierung durch ELER",
            "subQuestions": [],
            "description":
            "(i. d. R. ist das gesamte Programm notifiziert, dann werden alle Maßnahmen im jeweiligen Programm ELER (ko-)finanziert. 100% ELER-Förderung kann es mit Umschichtungsmitteln von 1. in 2. Säule geben, ansonsten i. d. R. zusammen mit Landesmitteln.",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["vns"]
            }
          },
          {
            "value": "gak",
            "title":
            "Gemeinschaftsaufgabe Agrarstruktur und Küstenschutz (GAK)",
            "subQuestions": [],
            "description": " (i. d. R. in Ko-Finanzierung mit Landesmitteln)"
          },
          {
            "value": "land",
            "title": "Land, auch bei ELER-Kofinanzierung möglich",
            "subQuestions": [],
            "description":
            "(bspw: Landesprogramme, die nicht von der EU notifiziert wurden, werden oft nur aus Landesmitteln finanziert. Mit Notifizierung ist der Finanzierungsanteil durch das Land geringer)"
          },
          {
            "value": "sonst",
            "title": "Andere Finanzierungsquelle",
            "subQuestions": [],
            "description":
            "(als Freitext angeben. bspw: EGFL Europäischer Garantiefonds für die Landwirtschaft)"
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_finanz",
        "title": "Finanzierung"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "lf",
            "title": "Landwirtschaftlich genutzte Fläche (LF)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "al",
            "title": "Ackerland (AL)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "hff",
            "title": "Hauptfutterfläche (HFF)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "gl",
            "title": "Grünland (GL)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "description":
            "Beinhaltet Dauergrünland, Ackergras und vergleichbare Kulturen / Flächen"
          },
          {
            "value": "dgl",
            "title": "Dauergrünland (DGL)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "dk_sk",
            "title": "Dauer- und/oder Sonderkulturen (DK/SK)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["twm_ziel"]
            }
          },
          {
            "value": "biotop_le",
            "title": "Landschaftselement/Biotop o.Ä.",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["azl", "ea", "vns", "aukm"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "wald",
            "title": "Wald/Forst",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["ea", "vns", "aukm"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "gewaesser",
            "title": "Gewässer, bspw. Teiche",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "ausnahm"}
            ]
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_fl",
        "title":
        "Zielfläche (Flächenart, auf der die Maßnahme umgesetzt wird bzw. auf die sie sich bezieht)",
        "description":
        "Sofern mehrere Angaben nötig wären, bitte die Maßnahme duplizieren und als zweite Maßnahme für beide Zielfläcen anlegen. Im Titel entsprechend kenntlich machen, um welche Ausführung es sich handelt"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "einh_praem",
            "title":
            "Einheitsprämie mit fester jährlicher Förderhöhe ohne Ausnahmen",
            "subQuestions": [],
            "description":
            "(Förderhöhe inkl. Einheit über Formular für Mengen-/Flächen-Vorgaben eingeben, bspw. 200 €/ha)"
          },
          {
            "value": "einh_abw",
            "title":
            "Einheitsprämie, aber Abweichungen wenn die Maßnahme mit anderen Maßnahmen kombiniert wird",
            "subQuestions": [],
            "description":
            "(jährliche Förderhöhe der Regel-Prämie im \"Normalfall\", also ohne die Abweichungen, inkl. Einheit über Formular für Mengen-/Flächen-Vorgaben eingeben, bspw. 200 €/ha)"
          },
          {
            "value": "var",
            "title":
            "Bei Top-Up bzw. Komplexmaßnahmen unterschiedliche Förderhöhen der Varianten",
            "subQuestions": [],
            "description": "(keine weitere Angabe nötig)"
          },
          {
            "value": "sto_dif",
            "title":
            "Differenziert nach Standort (Bodenpunkte) / Lagebasiert (am Gewässer) / Tierart",
            "subQuestions": [],
            "description":
            "(mit dem Formular für Mengen- / Flächen-Vorgabe kleinsten und größten Betrag als Spanne angeben, im Freitext konkretisieren (so konkret wie möglich, ohne einen Roman zu tippen;)"
          },
          {
            "value": "flaechen_diff",
            "title":
            "Gestaffelt nach Umsetzungsumfang / Menge (bspw. Anzahl ha) / Flächengröße / Tierzahl",
            "subQuestions": [],
            "description":
            "(mit dem Formular für Mengen- / Flächen-Vorgabe kleinsten und größten Betrag als Spanne angeben, im Freitext konkretisieren (so konkret wie möglich, ohne einen Roman zu tippen;) (bspw: Ökoregelung 1)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_honor",
        "title": "Honorierung"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "handlg_orient",
            "title":
            "Handlungsorientiert, d. h. die Durchführung einer bestimmten Aktion wird honoriert",
            "subQuestions": [],
            "description": "(häufigster Fall, bspw: Anlegen eines Streifens)"
          },
          {
            "value": "erg_orient",
            "title":
            "Ergebnisorientierte Honorierung, d. h. ein bestimmtes Ziel muss erreicht werden",
            "subQuestions": [],
            "description": "(bspw: Anzahl von Kennarten)"
          },
          {
            "value": "invest_foerderg",
            "title": "Investitionsförderung",
            "subQuestions": [],
            "description":
            "bspw. Stallbau, Anschaffung von Technik [deaktiviert, da Stand Mai 2023 nicht im Fokus der Erfassung]"
          },
          {
            "value": "markt_foerderg",
            "title": "marktorientierter Ausgleich",
            "subQuestions": [],
            "description":
            "[deaktiviert, da Stand Mai 2023 nicht im Fokus der Erfassung]",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "id_foerd_per",
              "values": ["2014-2022", "2023-2027"]
            }
          },
          {
            "value": "ertrag_foerederg",
            "title": "ertragsorientierte/ertragsmesszahlbasierte Auszahlung",
            "subQuestions": [],
            "description":
            "(bspw. je nach Standortgüte oder Ertragspotenzial einer Fläche"
          },
          {
            "value": "koop_foerderg",
            "title": "kooperative Förderung",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_foerd_variab",
        "title": "Art der Honorierung"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "bsch",
            "title": "Bodenschutz (bspw. Erosionsschutz)",
            "subQuestions": []
          },
          {
            "value": "wsch",
            "title":
            "Gewässerschutz (Schutz von Grund- und Oberflächengewässern, bspw. gegen Nährstoffeintrag)",
            "subQuestions": []
          },
          {
            "value": "asch",
            "title":
            "Spezieller Artenschutz bezogen auf einzelne Arten, bspw. Feldhamster",
            "subQuestions": []
          },
          {
            "value": "biodiv",
            "title": "Biodiversität",
            "subQuestions": [],
            "description":
            "(Erhalt / Wiederherstellung von Lebensräumen, Habitaten, Pflanzengesellschaften etc.)"
          },
          {
            "value": "strutktviel",
            "title": "Erhöhung der Strukturvielfalt in der Landschaft",
            "subQuestions": []
          },
          {
            "value": "genet_res",
            "title": "Erhaltung genetischer Ressourcen",
            "subQuestions": [],
            "description":
            "(bspw. alte Sorten bei Pflanzen oder bedrohte Rassen bei Nutztieren)"
          },
          {
            "value": "tsch",
            "title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb",
            "subQuestions": []
          },
          {
            "value": "klima",
            "title": "Klimaschutz oder -anpassung",
            "subQuestions": []
          },
          {
            "value": "nachh_res",
            "title": "Nachhaltige Ressourcennutzung",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "Anderes",
            "subQuestions": [],
            "description": "Bitte mit + Freitext hinzufügen und Ziel angeben"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_haupt",
        "title": "Hauptziel des Landes"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {"value": "bsch", "title": "Bodenschutz", "subQuestions": []},
          {
            "value": "wsch",
            "title":
            "Gewässerschutz (Schutz von Grund- und Oberflächengewässern, bspw. gegen Nährstoffeintrag)",
            "subQuestions": []
          },
          {
            "value": "asch",
            "title":
            "Spezieller Artenschutz bezogen auf einzelne Arten, bspw. Feldhamster",
            "subQuestions": []
          },
          {
            "value": "biodiv",
            "title": "Biodiversität",
            "subQuestions": [],
            "description":
            "(Erhalt / Wiederherstellung von Lebensräumen, Habitaten, Pflanzengesellschaften etc.)"
          },
          {
            "value": "strutktviel",
            "title": "Erhöhung der Strukturvielfalt",
            "subQuestions": []
          },
          {
            "value": "genet_res",
            "title": "Erhaltung genetischer Ressourcen",
            "subQuestions": [],
            "description":
            "(bspw. alte Sorten bei Pflanzen oder bedrohte Rassen bei Nutztieren)"
          },
          {
            "value": "tsch",
            "title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb",
            "subQuestions": []
          },
          {
            "value": "klima",
            "title": "Klimaschutz oder -anpassung",
            "subQuestions": []
          },
          {
            "value": "nachh_res",
            "title": "Nachhaltige Ressourcennutzung",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "Anderes",
            "subQuestions": [],
            "description": "Bitte mit + Freitext hinzufügen und Ziel angeben"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_neben",
        "title": "Weitere Ziele (Nebenziele) des Landes"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "flaeche",
            "title":
            "Einzelfläche oder bestimmte Gruppe von Tieren (aber nicht alle Flächen oder Tiere einer Art)",
            "subQuestions": [],
            "description":
            "(bspw. Blühstreifen/-flächen, Zwischenfrüchte und Untersaaten)"
          },
          {
            "value": "bzweig",
            "title":
            "Betriebszweig - Teile des Betriebs stehen im Fokus, bspw. bestimmte Flächen",
            "subQuestions": [],
            "description":
            "(bspw: Alles Grünland im Betrieb, gesamtes Ackerland im Betrieb (bspw. vielfältige Kulturen im Ackerbau), alle Gemüseflächen bzw. Änderung der Tierhaltung im Betrieb aber ohne Auswirkung auf angebaute Kulturen)"
          },
          {
            "value": "betr",
            "title":
            "Gesamtbetrieb - bezieht sich auf wirklich alle Flächen sowie die Tierhaltung eines Betriebs",
            "subQuestions": [],
            "description":
            "(bspw: Verzicht auf Pflanzenschutzmittel im gesamtem Betrieb, Ökolandbau)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ums_eb",
        "title": "Umsetzungsebene"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "no", "title": "Nein", "subQuestions": []},
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "oevf_oer",
            "title": "Greening/ÖVF",
            "subQuestions": [],
            "description":
            "(für Förderperiode 2014-2022) bzw. Ökoregelung (für Förderperiode ab 2023) - keine weitere Angabe erforderlich"
          },
          {
            "value": "aukm",
            "title": "AUKM",
            "subQuestions": [],
            "description":
            "(keine weitere Angabe notwendig, wenn dies durch eine Kombinationstabelle herausgefunden werden kann)"
          },
          {
            "value": "sonst",
            "title": "Andere",
            "subQuestions": [],
            "description":
            "(aber NICHT Greening/ÖVF, Ökoregelung oder AUKM) - als Freitext angeben, welche Kombinationen möglich sind."
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_kombi",
        "title": "Kombinierbar mit anderen Massnahmen auf der gleichen Fläche"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe/ohne obligate Beratung",
            "subQuestions": []
          },
          {
            "value": "beratg_oblig",
            "title":
            "obligate Beratung, Prüfung oder Begleitung (bspw. Imkerbeteiligung, technische Dienstleister)",
            "subQuestions": []
          },
          {
            "value": "unb",
            "title":
            "Stellungnahme bzw. Abstimmung mit der zuständigen Fachbehörde, bspw. Naturschutzbehörde",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_beratg",
        "title": "Beratung"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "1y", "title": "1 Jahr", "subQuestions": []},
          {"value": "2y", "title": "2 Jahre", "subQuestions": []},
          {"value": "3y", "title": "3 Jahre", "subQuestions": []},
          {"value": "4y", "title": "4 Jahre", "subQuestions": []},
          {
            "value": "5y",
            "title": "5 Jahre (Regelfall für AUKM)",
            "subQuestions": []
          },
          {
            "value": "bis5y",
            "title": "<= 5 Jahre (wenn nicht genauer angegeben)",
            "subQuestions": []
          },
          {"value": "bis10y", "title": "<= 10 Jahre", "subQuestions": []},
          {"value": "bis20y", "title": "<= 20 Jahre", "subQuestions": []},
          {"value": "na", "title": "nicht angegeben", "subQuestions": []},
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_dauer_vertr",
        "title": "Vertragslaufzeit"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "wechsel_ann",
            "title": "jährlich variabel",
            "subQuestions": [],
            "description":
            "(d. h. die Maßnahme kann während der Vertragslaufzeit jedes Jahr anderswo platziert werden)"
          },
          {
            "value": "lagetreu",
            "title": "Lagetreu über den Verpflichtungszeitraum",
            "subQuestions": [],
            "description":
            "(d. h. die Maßnahme liegt von Anfang bis Ende der Vertragslaufzeit an ein und derselben Stelle)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_dauer_lage",
        "title": "Lagetreue der Maßnahme",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ums_eb",
          "values": ["flaeche", "erbt"]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "ha",
            "title": "Hektar (ha)",
            "subQuestions": [],
            "description": "(bspw. Vielfältige Kulturen, Kennartenmaßnahmen)"
          },
          {
            "value": "pieces",
            "title": "Kopf / Stück/ Anzahl (bspw. Tier, Baum)",
            "subQuestions": [],
            "description":
            "bspw. Kennarten, Kennartengruppen, Tiere oder Bäume",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "twm_ziel", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "flst", "umwandlg"]
                }
              ]
            }
          },
          {
            "value": "gve",
            "title": "Großvieheinheiten (GV/GVE)",
            "subQuestions": [],
            "description": "absolut oder pro Hektar",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "twm_ziel", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
                }
              ]
            }
          },
          {
            "value": "rgve",
            "title": "Raufutter fressende Großvieheinheiten (RGV)",
            "subQuestions": [],
            "description": "absolut oder pro Hektar",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "twm_ziel", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
                }
              ]
            }
          },
          {
            "value": "m3",
            "title": "m³ (bspw. Gülle)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_foerd_klass",
                  "values": ["vns", "aukm", "erbt"]
                },
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_kat",
                  "values": ["dungmang", "extens", "erbt"]
                }
              ]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_ziel_einh",
        "title": "Zieleinheit (Einheit, für die die Zahlung gewährt wird)"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe/Vorgabe", "subQuestions": []},
          {
            "value": "flaeche1",
            "title":
            "Vorgeschriebene Flächengröße, bspw. Mindest- oder Maximalfläche.",
            "subQuestions": [],
            "description":
            "Mit + Formular 'Mengen-/Flächen-Vorgabe' nutzen! Bei mehreren, alternativen Vorgaben: Option 1 hier angeben, bei mehreren sich ergänzenden Vorgaben alle hier angeben (Formular mehrfach nutzen)."
          },
          {
            "value": "flaeche2",
            "title":
            "Vorgeschriebene Flächengröße, bspw. Mindest- oder Maximalfläche.",
            "subQuestions": [],
            "description":
            " Mit + Formular 'Mengen-/Flächen-Vorgabe' nutzen! Bei mehreren, alternativen Vorgaben: Option 2 hier angeben, bei mehreren sich ergänzenden Vorgaben alle hier angeben (Formular mehrfach nutzen)."
          },
          {
            "value": "flaeche3",
            "title":
            "Vorgeschriebene Flächengröße, bspw. Mindest- oder Maximalfläche.",
            "subQuestions": [],
            "description":
            " Mit + Formular 'Mengen-/Flächen-Vorgabe' nutzen! Bei mehreren, alternativen Vorgaben: Option 3 hier angeben, bei mehreren sich ergänzenden Vorgaben alle hier angeben (Formular mehrfach nutzen)."
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "mch_flaeche",
        "title": "Flächengröße"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe", "subQuestions": []},
          {
            "value": "wiese",
            "title": "Wiese (nur geschnitten)",
            "subQuestions": []
          },
          {
            "value": "weide",
            "title": "Weide (nur beweidet)",
            "subQuestions": []
          },
          {
            "value": "wiese_weide",
            "title": "Wiese und/oder Weide",
            "subQuestions": [],
            "description":
            "Maßnahmenbeschreibung beinhaltet beide Optionen, d. h. Mahd und / oder Beweidung"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "gl_nutz_typ",
        "title": "Grünlandnutzungstyp",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["dgl", "gl", "hff", "lf", "o", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe", "subQuestions": []},
          {
            "value": "wiese",
            "title":
            "Wiese (nur geschnitten) (Das soll nach Grünlandnutzungstyp migriert werden und nach der Migration anschließend hier gelöscht werden)",
            "subQuestions": []
          },
          {
            "value": "weide",
            "title":
            "Weide (Das soll nach Grünlandnutzungstyp migriert werden und nach der Migration anschließend hier gelöscht werden)",
            "subQuestions": []
          },
          {
            "value": "wiese_weide",
            "title":
            "Wiese und/oder Weide (Das soll nach Grünlandnutzungstyp migriert werden und nach der Migration anschließend hier gelöscht werden)",
            "subQuestions": [],
            "description":
            "Maßnahmenbeschreibung beinhaltet beide Optionen, d. h. Mahd und / oder Beweidung"
          },
          {
            "value": "strob",
            "title": "Streuobst/-wiese/-bestand",
            "subQuestions": []
          },
          {"value": "heide", "title": "Heide", "subQuestions": []},
          {"value": "trock_ras", "title": "Trockenrasen", "subQuestions": []},
          {"value": "alm", "title": "Alm", "subQuestions": []},
          {"value": "hutu", "title": "Hutung", "subQuestions": []},
          {"value": "fgl", "title": "Feuchtgrünland", "subQuestions": []},
          {"value": "mras", "title": "Magerrasen", "subQuestions": []},
          {
            "value": "sens_gl",
            "title": "sensibles Grünland",
            "subQuestions": []
          },
          {
            "value": "wirtsch_gl",
            "title": "Wirtschaftsgrünland",
            "subQuestions": []
          },
          {
            "value": "sonst_gl",
            "title": "sonstiges Grünland",
            "subQuestions": [],
            "description":
            "mehrere oder nicht näher spezifizierte Grünland-typen. Ggf. im Freitext konkretisieren."
          },
          {
            "value": "biotop_ffh",
            "title":
            "sonstiges Biotopgrünland, inkl. FFH-Grünland (Flora-Fauna-Habitattypen)",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "gl_typ",
        "title":
        "Grünlandtyp bei Grünland-bezogenen Maßnahmen (wie im Text / der Beschreibung bezeichnet)",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["dgl", "gl", "hff", "lf", "o", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Angabe", "subQuestions": []},
          {
            "value": "hauptnutz_zeit",
            "title": "Hauptnutzung zeitlich begrenzt",
            "subQuestions": [],
            "description":
            "(bspw. auch wenn Flächenstilllegung für das ganze Jahr gilt: dann Zeitraum 1.1. bis 31.12; verkürzte Weidedauer, verzögerter Auftrieb/Weidebeginn oder vorgezogener Abtrieb/Weidegangende) Mit + Zeitvorgabe anfügen, wann die Hauptnutzung zulässig ist."
          },
          {
            "value": "anz_schnitte",
            "title":
            "Anzahl Schnitte / Weidegänge  (wenn Mahd vorgegeben ist, dh. 1 oder mehr Schnitte)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "Bitte über + mit Mengen-/Flächenvorgabe konkretisieren"
          },
          {
            "value": "beweid_pflicht",
            "title": "Verpflichtende Beweidung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "Beweidung nach Mahd in Unterfrage \"Staffelung\" angeben."
          },
          {
            "value": "beweid_opt",
            "title": "Optionale Beweidung (nicht verpflichtend)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "Beweidung nach Mahd in Unterfrage \"Staffelung\" angeben."
          },
          {
            "value": "o_erneuerg",
            "title": "keine Grünland-Erneuerung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "(als Staffelung angeben, wenn GL-Erneuerung in bestimmten Situationen verboten ist, bspw. nach....)",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "gl_typ",
              "values": ["heide", "alm", "hutu", "fgl", "mras"]
            }
          },
          {
            "value": "o_walzen",
            "title": "kein Walzen",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "(als Staffelung angeben, wenn GL-Erneuerung in bestimmten Situationen verboten ist, bspw. nach....)",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "gl_typ",
              "values": ["heide", "alm", "hutu", "fgl", "mras"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          },
          {
            "value": "einschuer_o_weide",
            "title":
            "VERALTET - BITTE NICHT MEHR WÄHLEN einschürige Wiese (keine Beweidung)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "gl_typ",
                  "values": [
                    "wiese",
                    "wiese_weide",
                    "strob",
                    "fgl",
                    "mras",
                    "biotop_ffh"
                  ]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "id_foerd_per",
                  "values": ["2014-2022", "2023-2027"]
                }
              ]
            }
          },
          {
            "value": "einschuer_m_weide",
            "title":
            "VERALTET - BITTE NICHT MEHR WÄHLEN einschürige Wiese  mit darauf folgender obligater Beweidung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "gl_typ",
                  "values": ["wiese", "wiese_weide", "strob"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "id_foerd_per",
                  "values": ["2014-2022", "2023-2027"]
                }
              ]
            }
          }
        ],
        "id": "gl_bw_vg",
        "title": "Vorgaben zur Grünlandbewirtschaftung",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["ha", "erbt", "gve", "rgve"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "lf", "hff", "erbt", "o"]
            }
          ]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine Struktur", "subQuestions": []},
          {
            "value": "hecke",
            "title": "Gehölz/Hecke",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["wald"]
            }
          },
          {
            "value": "saum",
            "title":
            "Blühfläche/-streifen/Brache und andere Saumstrukturen (ohne Gewässer- und Erosionsschutzstreifen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["wald"]
            }
          },
          {
            "value": "schutz_streif",
            "title": "Gewässer- oder Erosionsschutzstreifen",
            "subQuestions": []
          },
          {
            "value": "graben",
            "title": "Gräben - VERALTET - BITTE NICHT MEHR WÄHLEN",
            "subQuestions": [],
            "description":
            "Löschen falls niemand ewas hier eingegeben hat, ansonten wegen Migration rückfragen (evtl. under sonstige Struktur schieben)"
          },
          {
            "value": "vernaessg",
            "title": "Sonstiges Feuchtbiotop (bspw. Blänke, Tümpel, …)",
            "subQuestions": [],
            "description":
            "Alex: falls niemand hier etwas eingegeben hat Abkürzung vernaessg ändern in sonst_feuch_biotop"
          },
          {
            "value": "strobst",
            "title":
            "Streuobst/-wiese/-bestand - Löschen falls niemand ewas hier eingegeben hat, ansonten wegen Migration rückfragen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "lf", "hff", "biotop_le", "dk_sk", "erbt", "o"]
            }
          },
          {
            "value": "stein",
            "title": "Steinmauer, Lesesteinhaufen",
            "subQuestions": []
          },
          {
            "value": "biotop_bes",
            "title":
            "Trockenrasen, Heide etc. - Löschen falls niemand ewas hier eingegeben hat, ansonten wegen Migration rückfragen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": [
                "gl",
                "dgl",
                "lf",
                "hff",
                "biotop_le",
                "dk_sk",
                "erbt",
                "o"
              ]
            }
          },
          {
            "value": "le_undef",
            "title": "Strukturelemente nicht definiert",
            "subQuestions": [],
            "description":
            "(bspw. \"naturnahe Strukturelemente\" oder mehrere, unterschiedliche Elemente inbegriffen)\""
          },
          {
            "value": "biotop",
            "title": "Sonstige Biotope",
            "subQuestions": [],
            "description":
            "Alex: falls niemand hier etwas eingegeben hat Abkürzung biotop ändern in sonst_biotop",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "sh_art",
        "title": "Art der betreffenden Struktur / des Lebensraums",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["pieces", "ha", "erbt"]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "verpfl_neuanl_begin",
            "title":
            "einmalige Neuanlage zu Beginn der Verpflichtung (bspw: Pflanzung einer Hecke, Anlage Gewässer- oder Erosionsschutzstreifen)",
            "subQuestions": []
          },
          {
            "value": "verpfl_neuanl_regelm",
            "title":
            "regelmäßige Neuanlage im Verpflichtungszeitraum (bspw. jährl. Aussaat bei einjährigen Blühstreifen, einjährigen Altgrasstreifen)",
            "subQuestions": [],
            "description":
            "(bspw: überjährige Blühstreifen regelmäßig umbrechen und neu ansäen)"
          },
          {
            "value": "verpfl_pflege",
            "title":
            "Bewirtschaftung bzw. Pflege einer bestehenden Struktur im Verpflichtungszeitraum (bspw. einmal jährlich mähen auf Grünland, Heckenschnitt)",
            "subQuestions": [],
            "description":
            "(bspw: jährliche Heckenpflege, regelmäßiges Mulchen einer Feuchtwiese). + zur Konkretisierung nutzen."
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "sh_pflg_art",
        "title": "Bewirtschaftungs- oder Pflegeart bzw. Anlage-Zyklen",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["anlage_pflege", "extens", "flst", "umwandlg", "erbt"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["pieces", "ha", "erbt"]
            },
            {
              "type": "ContainsNoneOf",
              "field": "sh_art",
              "values": ["o"]
            }
          ]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Pflege vorgegeben / keine Angabe",
            "subQuestions": []
          },
          {
            "value": "pflege_einmal",
            "title":
            "einmalige Pflege oder Bewirtschaftung bestehender Strukturen",
            "subQuestions": []
          },
          {
            "value": "pflege_ann",
            "title":
            "mindestens jährliche Pflege oder Bewirtschaftung bestehender Strukturen",
            "subQuestions": []
          },
          {
            "value": "staffelg_t_ao",
            "title":
            "zeitlich und/oder räumliche Staffelung von Pflege-/Bewirtschaftungsschritten",
            "subQuestions": [],
            "description":
            "(bspw: zeitversetzte Mahd von Streifen im extensiven Grünland)"
          },
          {
            "value": "undef",
            "title": "Pflege-/Bewirtschaftungsrhytmus nicht definiert",
            "subQuestions": [],
            "description":
            "d. h. Pflege ist Bestandteil der Auflagen, wird aber nicht näher konkretisiert"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "sh_pflg_haeuf",
        "title": "Pflege- / Bewirtschaftungs-Häufigkeit",
        "description":
        "(Hier sind überjährige Aktivitäten, nicht die unterjährigen, anzugeben)",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["anlage_pflege", "extens", "flst", "umwandlg", "erbt"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["pieces", "ha", "erbt"]
            },
            {
              "type": "ContainsNoneOf",
              "field": "sh_art",
              "values": ["o"]
            }
          ]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title":
            "kein Nutzungsausschluss, Aufwuchs darf beliebig genutzt werden oder es gibt hierzu keine Angabe",
            "subQuestions": []
          },
          {
            "value": "o_abfuhr",
            "title": "Nutzung ist ausgeschlossen, keine Ernteabfuhr",
            "subQuestions": []
          },
          {
            "value": "abfuhr_f_biogs",
            "title": "Erntegutnutzung ausschließlich für Biogasanlagen",
            "subQuestions": []
          },
          {
            "value": "beweidg_af_erlaubt",
            "title":
            "ausschließlich Beweidung mit Schafen oder Ziegen auf nicht-Grünlandfläche erlaubt",
            "subQuestions": []
          },
          {
            "value": "schroepfen",
            "title": "ausschließlich Schröpfschnitt erlaubt",
            "subQuestions": [],
            "description": "(bspw. auf Blühstreifen und -flächen)"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bw_nutz_ausschl",
        "title": "Nutzung des Aufwuchses / Nutzungsausschluss",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "pieces", "erbt"]
        }
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "keine", "subQuestions": []},
          {
            "value": "hfrucht",
            "title": "auf Hauptfrucht",
            "subQuestions": [],
            "description":
            "(Kultur die den Großteil des ökonomischen Nutzens bringt, steht normalerweise in der Hauptwachstumsphase (April bis Juli) auf der Fläche). Die Bewirtschaftung der Hauptkultur auf der Fläche, auf der die Maßnahme umgesetzt wird, wird verändert/beeinflusst, bspw. durch reduzierte Fläche, vorgeschriebene oder verbotene Bearbeitungsschritte oder bestimmte Kulturwahl (Konsequenz ist oft ein geringerer Ertrag)."
          },
          {
            "value": "nfrucht",
            "title": "nur auf Nebenfrucht",
            "subQuestions": [],
            "description":
            "(Kultur die meist keinen unmittelbaren oder zumindest einen deutlich geringeren ökonomischen Nutzen hat bspw. Zwischenfrüchte, Vorfrüchte (wie Grünroggen)). Maßnahme bezieht sich auf Kulturen, die nicht für die wesentliche Wertschöpfung im Betrieb dienen. bspw: Anbau bestimmter Zwischenfrüchte"
          },
          {
            "value": "h_n_nfrucht",
            "title": "auf Haupt- und Nebenfrucht",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bw_kult",
        "title": "betroffene Frucht",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_fl",
          "values": ["al", "lf", "hff", "dk_sk", "erbt", "o"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne Angabe", "subQuestions": []},
          {
            "value": "vieh_red",
            "title": "Vorgaben zum Viehbesatz/-bestand.",
            "subQuestions": [],
            "description":
            "Mit + im Formular Mengen-/Flächen-Vorgabe ggf. Besatzdichte angeben."
          },
          {
            "value": "veraenderg_tierhaltg",
            "title": "Vorgaben zu Haltungsbedingungen auf der Fläche",
            "subQuestions": [],
            "description":
            "bspw. Beweidung, Alex / mit Norbert: schauen wer hier etwas zu Stallumbau, Haltung auf Stroh, Einstreu, Platzangebot eingegeben hat -> migrieren nach Vorgaben zu Haltungsbedingungen im Stall, danach schauen ob noch etwas eingegeben ist. Falls nein: Abkürzung umbenennen in vg_halt_beding_flaech bzw. migieren",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["ea"]
            }
          },
          {
            "value": "vg_halt_beding_stall",
            "title": "Vorgaben zu Haltungsbedingungen im Stall",
            "subQuestions": [],
            "description":
            " (bspw. Einstreu, Platzangebot, Stallumbau) bspw. Beweidung, Alex / mit Norbert: schauen wer hier etwas zu Stallumbau, Haltung auf Stroh, Einstreu, Platzangebot eingegeben hat -> migrieren nach Vorgaben zu Haltungsbedingungen im Stall",
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_foerd_klass",
              "values": ["ea"]
            }
          },
          {
            "value": "bweidg_kurz",
            "title":
            "verzögerter Auftrieb/Weidebeginn oder vorgezogener Abtrieb/Weidegangende, somit verkürzte Weidedauer VERALTET - BITTE NICHT MEHR WÄHLEN wurde verschoben nach Vorgaben zur Grünlandbewirtschaftung",
            "subQuestions": [],
            "description":
            "Alex: schauen, ob jemand etwas eingetragen hat. Wenn ja, migrieren nach Vorgaben zur Grünlandbewirtschaftung - verzögerter Auftrieb/Weidebeginn"
          },
          {
            "value": "bes_art_rasse",
            "title": "Haltung einer bestimmten Tierart",
            "subQuestions": [
              {
                "type": "MultipleChoiceQuestion",
                "choices": [
                  {"value": "o", "title": "keine/ohne", "subQuestions": []},
                  {"value": "schaf", "title": "Schafe", "subQuestions": []},
                  {"value": "ziege", "title": "Ziegen", "subQuestions": []},
                  {
                    "value": "w_bueffel",
                    "title": "Wasserbüffel",
                    "subQuestions": []
                  },
                  {"value": "schw", "title": "Schweine", "subQuestions": []},
                  {"value": "gefl", "title": "Geflügel", "subQuestions": []},
                  {
                    "value": "rind_o_miku",
                    "title": "Rinder ohne Milchkühe",
                    "subQuestions": []
                  },
                  {"value": "miku", "title": "Milchkühe", "subQuestions": []},
                  {"value": "pferd", "title": "Pferde", "subQuestions": []},
                  {"value": "biene", "title": "Bienen", "subQuestions": []},
                  {
                    "value": "selten",
                    "title":
                    "Andere oder nicht näher spezifizierte seltene/bedrohte Nutztierrassen",
                    "subQuestions": []
                  },
                  {
                    "value": "erbt",
                    "title": "wird in Varianten / Untermaßnahmen definiert",
                    "subQuestions": []
                  },
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "rv_tierart",
                "title": "Haltung einer bestimmten Tierart"
              }
            ]
          },
          {
            "value": "n_red_fuetterg",
            "title": "N/Stickstoff-reduzierte Fütterung von Tieren",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "twm_ziel", "erbt"]
            }
          },
          {
            "value": "verzicht",
            "title":
            "Verzicht Kupierung (Schnäbel, Hörner, Ringelschwänze etc.)",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_foerd_klass",
              "values": ["vns", "aukm", "twm_ziel", "erbt"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bw_vieh_vg",
        "title": "Tierhaltung",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsNoneOf",
              "field": "mch_kat",
              "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
            },
            {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["dk_sk", "biotop_le", "wald"]
            }
          ]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe/ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "red_bbearb_m_technik",
            "title":
            "reduzierte Bodenbearbeitung mit Vorgabe einer/mehrerer spezifischen/besonderen Bearbeitungstechnik/en",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "(bspw. mit Vorgabe, dass zu grubbern oder eggen ist, nicht gepflügt werden darf)",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_fl",
                  "values": ["wald"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "anlage_pflege"]
                }
              ]
            }
          },
          {
            "value": "red_bbearb_o_technik",
            "title":
            "Vorgabe der Flächengestaltung (bspw. Bewirtschaftung quer zum Hang)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "Alex: falls niemand hier etwas eingegeben hat Abkürzung red_bbearb_o_technik ändern in vg_flaech_gestal",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_fl",
                  "values": ["wald"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "o_bbearb",
            "title": "vollständiges Verbot der Bodenbearbeitung",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "(ggf. Zeitfenster mit Formular \"Zeitvorgabe\" konkretisieren)"
          },
          {
            "value": "gl_erneu_flach",
            "title":
            "Grünlanderneuerung nur flachwendend / pfluglos / nicht wendend / durch vollflächiges Durchschneiden der Grasnarbe",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description": "",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "lf", "hff", "erbt", "o"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "bbearb_vg",
        "title": "Bodenbearbeitung",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe / ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "keine",
            "title": "keine Düngung erlaubt",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "value": "ausbring_techn",
            "title": "besondere Ausbringungstechnik",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "(bspw. Schleppschlauch) mit weiteren Angaben in Technische Anforderungen"
          },
          {
            "value": "ausbring_t_kurz",
            "title": "verkürzte oder vorgegebene Ausbringungszeiten",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "value": "dueng_red",
            "title": "reduzierte Düngungsmenge",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ],
            "description":
            "(erlaubte Düngemenge auf ein Jahr hochrechnen, wenn Menge pro Gabe und Anzahl Gaben benannt sind)"
          },
          {
            "value": "dueng_spez_art",
            "title": "Beschränkung auf spezifische Düngemittel",
            "subQuestions": [
              {
                "type": "MultipleChoiceQuestion",
                "choices": [
                  {"value": "o", "title": "keine Angabe", "subQuestions": []},
                  {
                    "value": "dueng_org_tier_liqu",
                    "title": "organisch",
                    "subQuestions": [
                      {
                        "type": "MultipleChoiceQuestion",
                        "choices": [
                          {
                            "value": "dueng_org_tier_fest",
                            "title": "tierisch, fest (Festmist)",
                            "subQuestions": []
                          },
                          {
                            "value": "dueng_org_tier_liqu",
                            "title": "tierisch, flüssig (bspw. Gülle)",
                            "subQuestions": []
                          },
                          {
                            "value": "dueng_org_pflz",
                            "title": "pflanzlich (Gärrest)",
                            "subQuestions": []
                          },
                          {
                            "value": "dueng_org",
                            "title":
                            "nicht genauer differenziert: Wirtschaftsdünger",
                            "subQuestions": []
                          }
                        ],
                        "id": "org_dueng_spez",
                        "title": "organisches Düngemittel"
                      }
                    ]
                  },
                  {
                    "value": "dueng_miner",
                    "title": "mineralisch",
                    "subQuestions": []
                  },
                  {
                    "value": "dueng_stoff",
                    "title":
                    "Bestimmte Inhalts- oder Nährstoffe sind zulässig oder ausgeschlossen.",
                    "subQuestions": [],
                    "description":
                    "Als Freitext angeben, wie die Auflage lautet."
                  },
                  {
                    "value": "dueng_bu",
                    "title": "Düngung auf Grundlage einer Bodenuntersuchung",
                    "subQuestions": []
                  },
                  {
                    "value": "stabil_dueng",
                    "title":
                    "Einsatz stabilisierter Dünger (bspw. CULTAN-Verfahren, N-Depotdüngung)",
                    "subQuestions": [],
                    "enabledIf": {
                      "type": "CheckAllConditions",
                      "conditions": [
                        {
                          "type": "ContainsAnyOf",
                          "field": "dueng_vg",
                          "values": ["dueng_spez_art", "erbt"]
                        },
                        {
                          "type": "ContainsNoneOf",
                          "field": "mch_foerd_klass",
                          "values": ["azl", "twm_ziel"]
                        },
                        {
                          "type": "ContainsNoneOf",
                          "field": "mch_kat",
                          "values": [
                            "anlage_pflege",
                            "umwandlg",
                            "bes_kult_rass"
                          ]
                        },
                        {
                          "type": "ContainsNoneOf",
                          "field": "mch_ziel_einh",
                          "values": ["rgve"]
                        }
                      ]
                    }
                  },
                  {
                    "value": "erbt",
                    "title": "wird in Varianten / Untermaßnahmen definiert",
                    "subQuestions": []
                  },
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "dueng_art",
                "title": "Düngung Art"
              },
              {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
            ]
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "dueng_vg",
        "title": "Düngung",
        "enabledIf": {
          "type": "CheckAllConditions",
          "conditions": [
            {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["wald"]
            },
            {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_einh",
              "values": ["ha", "o", "erbt"]
            }
          ]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe / ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "pfl_sch_kein",
            "title":
            "kein Pflanzenschutz zulässig (Einzelpflanzenbehandlung auf Antrag kann möglich sein)",
            "subQuestions": []
          },
          {
            "value": "pflz_sch_integr",
            "title": "nur integrierter Pflanzenschutz",
            "subQuestions": []
          },
          {
            "value": "pflz_sch_biol_ausbring",
            "title": "nur gezielte Ausbringung von Nützlingen oder Pheromonen",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsNoneOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "biotop_le", "o"]
            }
          },
          {
            "value": "pflz_sch_chem_einzel",
            "title":
            "nur Einzelpflanzenbehandlung mit chemischem Pflanzenschutz zulässig",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["al", "lf", "dk_sk", "erbt", "o"]
            }
          },
          {
            "value": "pflz_sch_o",
            "title":
            "kein chemischer Pflanzenschutz (Einzelpflanzenbehandlung auf Antrag kann möglich sein) VERALTET - BITTE NICHT MEHR WÄHLEN",
            "subQuestions": [],
            "description":
            "Alex: schauen, ob jemand etwas eingetragen hat. Wenn ja, migrieren nach kein Pflanzenschutz zulässig (Einzelpflanzenbehandlung auf Antrag kann möglich sein)"
          },
          {
            "value": "pflz_sch_o_herbiz",
            "title": "keine Herbizide",
            "subQuestions": []
          },
          {
            "value": "pflz_sch_o_wregelg",
            "title": "kein Wachstumsregler",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["al", "lf", "dk_sk", "erbt", "o"]
            }
          },
          {
            "value": "pflz_sch_einschraenk_option",
            "title": "optionale Einschränkung (im Freitext konkretisieren)",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "pflz_sch",
        "title": "Pflanzenschutz",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "o", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne", "subQuestions": []},
          {
            "value": "red_reifen_druck",
            "title": "Reduzierter Reifendruck",
            "subQuestions": []
          },
          {"value": "mulch_egge", "title": "Mulchen/Eggen", "subQuestions": []},
          {
            "value": "direkt_o_mulch_saat_o_pflanz",
            "title": "Direktsaat-/Mulchsaat-/Mulchpflanzverfahren",
            "subQuestions": []
          },
          {
            "value": "spez_maehtechn",
            "title": "Besondere Mähtechnik, bspw. Messerbalken",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["gl", "dgl", "lf", "hff", "biotop_le", "erbt", "o"]
            }
          },
          {
            "value": "spez_weidetechn",
            "title": "Besondere Weidetechnik (Standweide)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["gl", "dgl", "lf", "hff", "biotop_le", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "gl_typ",
                  "values": ["wiese"]
                }
              ]
            }
          },
          {
            "value": "vernaessg",
            "title":
            "Vernässung, zumindest temporär (bspw: Wasserstandsanhebung im Winter, Rückbau von Drainagen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["oelb"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["twm_ziel"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["m3", "pieces", "gve", "rgve"]
                }
              ]
            }
          },
          {
            "value": "flaech_spezif_dueng",
            "title":
            "standortangepasst/teilflächenspezifisch (bspw. bei Düngung oder Einsatz von Exaktstreuer)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["twm_ziel"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "dueng_plang",
            "title": "Analysen zur Düngungsplanung",
            "subQuestions": [],
            "description":
            "bspw. Bodenuntersuchung/Frühjahres-Nmin-Analyse, Pflanzenanalysen, Wirtschaftsdünger- und Gärsubstratanalysen, Hoftorbilanzen, NIRS-Verfahren",
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_foerd_klass",
                  "values": ["twm_ziel"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege", "flst", "bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "remiss_red_ausbring_techn",
            "title":
            "Emissionsarme Ausbringungstechnik (Schleppschlauch/-Schuh etc.)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "dueng_vg",
                  "values": ["ausbring_techn", "erbt"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": [
                    "anlage_pflege",
                    "flst",
                    "umwandlg",
                    "bes_kult_rass"
                  ]
                }
              ]
            }
          },
          {
            "value": "in_reihe",
            "title": "in Reihen (bspw. strip till oder Düngung in Reihen)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege", "flst", "bes_kult_rass"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_fl",
                  "values": ["gl", "dgl", "biotop_le", "wald"]
                }
              ]
            }
          },
          {
            "value": "weite_reihe",
            "title":
            "Aussaat/Anpflanzung in weiter Reihe / doppeltem Reihenabstand / mit reduzierter Saatstärke/-menge",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "dk_sk", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["flst"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["m3"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["pieces", "gve", "rgve"]
                }
              ]
            }
          },
          {
            "value": "enge_reihe",
            "title": "Aussaat/Anpflanzung mit enger Reihe",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "dk_sk", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["anlage_pflege"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["flst"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["m3"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_ziel_einh",
                  "values": ["pieces", "gve", "rgve"]
                }
              ]
            }
          },
          {
            "value": "dekant",
            "title": "Dekanter",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "dueng_vg",
              "values": ["ausbring_techn", "erbt"]
            }
          },
          {
            "value": "mark_stauhh",
            "title": "Feste Markierung der Stauhöhe am Bauwerk",
            "subQuestions": [],
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_kat",
              "values": ["wasser", "erbt"]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "tech",
        "title":
        "Technische Anforderungen zur ordnungsgemäßen Umsetzung der Maßnahme"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne", "subQuestions": []},
          {
            "value": "natsch_kulissen",
            "title":
            "Naturschutzgebiete i. w. S. (NSG, SPA, FFH, Biosphärengebiete, Nationalparke, ...)",
            "subQuestions": []
          },
          {
            "value": "wassersch_kulissen",
            "title": "Wasserschutzgebiete (HQ20, rote Wasserkörper, …)",
            "subQuestions": []
          },
          {
            "value": "bsch_kulissen",
            "title":
            "Bodenschutzgebiete (Wassererosionsschutzgebiete, Winderosionsschutzgebiete, organische Böden, …)",
            "subQuestions": []
          },
          {"value": "gunst_lag", "title": "Gunstlagen", "subQuestions": []},
          {
            "value": "ungunst",
            "title": "Berglagen / Ungunstlagen",
            "subQuestions": [],
            "description":
            "Alex: schauen, ob jemand etwas zu Alm eingetragen hat. Wenn ja, wurde es auch dort angegeben wo es eigentlich hin gehört (gl_typ)? Hier gehört es jedenfalls nicht hin."
          },
          {
            "value": "organ_o_feucht",
            "title": "Moorstandorte / Feuchtgebiete / organische Böden",
            "subQuestions": []
          },
          {
            "value": "andere",
            "title": "andere räumliche Definition (im Freitext angeben)",
            "subQuestions": []
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "rv_kuliss_r_def",
        "title": "räumlich definierte Kulisse",
        "description":
        "(Angabe nur, wenn in Richtlinie die räumliche Kulisse explizit benannt ist; Maßnahme kann nur innerhalb von auf Landkarten abgrenzbaren Gebieten umgesetzt werden)"
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {"value": "o", "title": "ohne", "subQuestions": []},
          {
            "value": "lage",
            "title":
            "Lage (bspw. an Gewässern, an Knicks, an Waldrändern) - im Freitext konkretisieren",
            "subQuestions": []
          },
          {
            "value": "kultur",
            "title":
            "Kulturen / Kulturgruppen (nach Mais, Reihenkulturen, vor Wintergetreide, ...)",
            "subQuestions": [
              {
                "type": "SingleChoiceQuestion",
                "choices": [
                  {
                    "value": "ausschluss",
                    "title": "nicht zu / nicht bei",
                    "subQuestions": []
                  },
                  {"value": "vorab", "title": "vor", "subQuestions": []},
                  {"value": "incl", "title": "zu / bei", "subQuestions": []},
                  {"value": "danach", "title": "nach", "subQuestions": []},
                  {
                    "value": "contact",
                    "title": "bitte um Unterstützung",
                    "subQuestions": []
                  }
                ],
                "id": "rv_kuliss_i_erl_zuw",
                "title":
                "Zuweisung für Erläuterung inhaltliche Flächendefinition \"thematische Kulisse\" "
              },
              {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
            ],
            "description":
            "im nächsten Feld als 'Zuweisung' die Präposition auswählen (bspw. 'vor'), danach die Unterfrage für Kulturen nutzen.",
            "enabledIf": {
              "type": "ContainsAnyOf",
              "field": "mch_ziel_fl",
              "values": ["al", "lf", "dk_sk", "hff", "erbt", "o"]
            }
          },
          {
            "value": "habitat_o_art",
            "title":
            "Vorhandensein oder Vorkommen besonderer Habitate / Zielarten",
            "subQuestions": [],
            "description":
            "bspw. artenreiches Grünland, FFH-Lebensraumtypen, Ackerlebensräume, Feldhamstervorkommen"
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "rv_kuliss_i_def",
        "title": "inhaltlich definierte Kulisse",
        "description":
        "(Maßnahme kann nur dort umgesetzt werden, wo bestimmte lokale Bedinungen erfüllt sind)"
      },
      {"type": "ReuseSurveyEntry", "reuseId": "staffelg"},
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "o",
            "title": "keine Angabe / ohne Einschränkung",
            "subQuestions": []
          },
          {
            "value": "bereg",
            "title": "keine Beregnung",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "entwaess",
            "title": "keine Entwässerung, Drainage",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "gl", "dgl", "lf", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "meliorat",
            "title":
            "keine Melioration (jegliche Be- und Entwässerung der Fläche)",
            "subQuestions": [],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "gl", "dgl", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["bes_kult_rass"]
                }
              ]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "rv_be_entwaesser",
        "title": "Wassermanagement (Be- und Entwässerung inkl. Vernässung)",
        "enabledIf": {
          "type": "ContainsAnyOf",
          "field": "mch_ziel_einh",
          "values": ["ha", "erbt"]
        }
      },
      {
        "type": "MultipleChoiceQuestion",
        "choices": [
          {
            "value": "keine-Vorgabe",
            "title": "keine Vorgabe",
            "subQuestions": []
          },
          {
            "value": "vorgeschr-anzahl-zeitgleich-kulturen",
            "title":
            "vorgeschriebene Anzahl von Arten/Kulturen, die zeitgleich angebaut werden müssen oder Anzahl nachzuweisender Kennarten",
            "subQuestions": [],
            "description":
            "(bspw: Mindestanzahl bestimmter Kulturen im Betrieb). Mit + im Formular für Mengen-/Flächen-Vorgaben die Anzahl der Kulturen angeben (Nenner: förderfähige Ackerkulturen). Ggf. Flächen- oder Mengenvorgaben einzelner Kulturen im nächsten Punkt bei \"Vorgaben zu Kulturen\" angeben."
          },
          {
            "value": "vorg-kulturen",
            "title":
            "Vorgaben zur Art der anzubauenden Kulturen oder anderen auszubringenden Pflanzen (welche, wie viel wird konkretisiert)",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
            ]
          },
          {
            "value": "kultur",
            "title":
            "expliziter Ausschluss bestimmter Kulturen oder Kulturgruppen",
            "subQuestions": [
              {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
            ],
            "enabledIf": {
              "type": "CheckAllConditions",
              "conditions": [
                {
                  "type": "ContainsAnyOf",
                  "field": "mch_ziel_fl",
                  "values": ["al", "lf", "hff", "erbt", "o"]
                },
                {
                  "type": "ContainsNoneOf",
                  "field": "mch_kat",
                  "values": ["zf_us"]
                }
              ]
            }
          },
          {
            "value": "erbt",
            "title": "wird in Varianten / Untermaßnahmen definiert",
            "subQuestions": []
          },
          {
            "value": "contact",
            "title": "bitte um Unterstützung",
            "subQuestions": []
          }
        ],
        "id": "vorgabe-art-mischung-saatgut",
        "title":
        "Pflanzenart oder der Anzahl von Arten, die angebaut/gesät werden müssen bzw. nicht zulässig sind"
      },
      {
        "type": "SingleChoiceQuestion",
        "choices": [
          {"value": "bearb", "title": "in Bearbeitung", "subQuestions": []},
          {"value": "contact", "title": "Rücksprache", "subQuestions": []},
          {
            "value": "sonderfall",
            "title": "Sonderfall (nicht validierbar)",
            "subQuestions": [],
            "description":
            "Eingabe ist korrekt und abgeschlossen, aber aufgrund der starren Bedingungen im MET werden Fehler bei der Validierung angezeigt"
          },
          {"value": "fertig", "title": "abgeschlossen", "subQuestions": []}
        ],
        "id": "last_status",
        "title": "Status"
      }
    ]
  }
}
''';

