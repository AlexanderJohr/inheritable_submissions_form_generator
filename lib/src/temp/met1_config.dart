const met1Config =
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// JsonToSurveyConfigurationGenerator
// **************************************************************************

    {
  "type": "Survey",
  "questions": [
    {
      "id": "last_status",
      "type": "SingleChoiceQuestion",
      "title": "Status",
      "choices": [
        {"title": "in Bearbeitung", "value": "bearb"},
        {"title": "Rücksprache", "value": "contact"},
        {"title": "abgeschlossen", "value": "fertig"}
      ]
    },
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
      "id": "mch_finanz",
      "type": "MultipleChoiceQuestion",
      "title": "Finanzierung",
      "choices": [
        {"title": "ELER", "value": "eler"},
        {"title": "GAK", "value": "gak"},
        {"title": "Landesmittel", "value": "land"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_foerd_klass",
      "type": "SingleChoiceQuestion",
      "title": "Förderklasse",
      "choices": [
        {"title": "Ökolandbau", "value": "oelb"},
        {"title": "Ausgleichszulage", "value": "azl"},
        {"title": "Erschwernisausgleich", "value": "ea"},
        {"title": "Vertragsnaturschutz", "value": "vns"},
        {"title": "Agrarumwelt- und Klimamaßnahmen AUKM", "value": "aukm"},
        {"title": "Tierschutz/Tierwohlmaßnahmen", "value": "twm_ziel"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_honor",
      "type": "MultipleChoiceQuestion",
      "title": "Honorierung",
      "choices": [
        {"title": "Differenziert nach Standort / Lagebasiert", "value": "sto_dif"},
        {"title": "Differenziert nach Umsetzungsumfang / gestaffelt nach Flächengröße", "value": "flaechen_diff"},
        {"title": "Einheitsprämie", "value": "einh_praem"},
        {"title": "Ergebnisorientiert", "value": "erg_orient"},
        {"title": "Handlungsorientiert", "value": "handlg_orient"},
        {"title": "Investitionsförderung", "value": "invest_foerderg"},
        {"title": "maktorientierter Ausgleich", "value": "markt_foerderg"},
        {"title": "ertragsorientierte/ertragsmesszahlbasierte Auszahlung", "value": "ertrag_foerederg"},
        {"title": "kooperative Förderung", "value": "koop_foerderg"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_foerd_variab",
      "type": "SingleChoiceQuestion",
      "title": "Variabilität",
      "choices": [
        {"title": "nein, feste Förderhöhe", "value": "fix"},
        {
          "title": "Grundbetrag einer Förderhöhe ist angegeben, kann aber abweichen wenn die Maßnahme kombiniert wird oder aus anderen Gründen",
          "value": "abw"
        },
        {"title": "keine einheitliche Förderhöhe angegeben, beispielsweise unterschiedliche Förderhöhen in einer Komplexmaßnahme", "value": "var"}
      ]
    },
    {
      "id": "mch_kat",
      "type": "SingleChoiceQuestion",
      "title": "Kategorie",
      "choices": [
        {
          "title": "Anbau Zwischenfrucht/Untersaat",
          "value": "zf_us",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["aukm"]
          }
        },
        {
          "title": "Anlage/Pflege Struktur",
          "value": "anlage_pflege",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["vns", "aukm"]
          }
        },
        {
          "title": "Düngemanagement",
          "value": "dungmang",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["vns", "aukm"]
          }
        },
        {"title": "Extensivierung", "value": "extens"},
        {
          "title": "Flächenstilllegung/Brache",
          "value": "flst",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["vns", "aukm"]
          }
        },
        {
          "title": "Nutzungsumwandlung",
          "value": "umwandlg",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["vns", "aukm"]
          }
        },
        {
          "title": "Förderung bestimmter Rassen / Sorten / Kulturen",
          "value": "bes_kult_rass",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_foerd_klass",
            "values": ["ea"]
          }
        },
        {"title": "Anbaudiversität / Erhöhung der Kulturartenvielfalt", "value": "anbaudiv"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_ums_eb",
      "type": "SingleChoiceQuestion",
      "title": "Umsetzungsebene",
      "choices": [
        {"title": "Einzelfläche", "value": "flaeche"},
        {"title": "Betriebszweig", "value": "bzweig"},
        {"title": "Gesamtbetrieb", "value": "betr"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_kombi",
      "type": "MultipleChoiceQuestion",
      "title": "Kombinierbar mit anderen Massnahmen",
      "choices": [
        {"title": "Nein", "value": "no"},
        {"title": "Greening/ÖVF (für Förderperiode 2014-2022) bzw. Ökoregelung (für Förderperiode ab 2023)", "value": "oevf_oer"},
        {"title": "AUKM", "value": "aukm"},
        {"title": "Andere (aber NICHT Greening/ÖVF, Ökoregelung oder AUKM)", "value": "sonst"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_beratg",
      "type": "SingleChoiceQuestion",
      "title": "Beratung",
      "choices": [
        {"title": "keine Angabe/ohne obligate Beratung", "value": "o"},
        {"title": "obligate Beratung (auch in Form der Imkerbeteiligung)", "value": "beratg_oblig"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "komplex_typ",
      "type": "SingleChoiceQuestion",
      "title": "Komplex-Maßnahme",
      "choices": [
        {"title": "nicht unterteilte Maßnahme (Standard)", "value": "norm"},
        {"title": "Komplexmaßnahme (beinhaltet verschiedene Varianten)", "value": "komplex"},
        {"title": "Variante einer Komplexmaßnahme", "value": "variante"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_topup_typ",
      "type": "SingleChoiceQuestion",
      "title": "Top-Up- oder Basis-Massnahme",
      "choices": [
        {"title": "nicht unterteilte Maßnahme (Standard)", "value": "norm"},
        {"title": "Basis-Maßnahme", "value": "basis"},
        {"title": "Top-Up-Maßnahme", "value": "top_up"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_dauer_vertr",
      "type": "SingleChoiceQuestion",
      "title": "Vertragslaufzeit",
      "choices": [
        {"title": "1 Jahr", "value": "1y"},
        {"title": "2 Jahre", "value": "2y"},
        {"title": "3 Jahre", "value": "3y"},
        {"title": "4 Jahre", "value": "4y"},
        {"title": "5 Jahre", "value": "5y"},
        {"title": "<= 5 Jahre (wenn nicht genauer angegeben)", "value": "bis5y"},
        {"title": "<= 10 Jahre", "value": "bis10y"},
        {"title": "<= 20 Jahre", "value": "bis20y"},
        {"title": "nicht angegeben", "value": "na"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_dauer_lage",
      "type": "SingleChoiceQuestion",
      "title": "Lagetreue der Maßnahme",
      "choices": [
        {"title": "jährlich variabel", "value": "wechsel_ann"},
        {"title": "Lagetreu über den Verpflichtungszeitraum", "value": "lagetreu"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_ziel_fl",
      "type": "SingleChoiceQuestion",
      "title": "Zielfläche",
      "choices": [
        {"title": "keine Angabe/Vorgabe", "value": "o"},
        {
          "title": "Ackerland (AL)",
          "value": "al",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_kat",
            "values": ["zf_us"]
          }
        },
        {"title": "Grünland (GL)", "value": "gl"},
        {"title": "Landwirtschaftlich genutzte Fläche (LF)", "value": "lf"},
        {
          "title": "Dauer- und/oder Sonderkulturen (DK/SK)",
          "value": "dk_sk",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_foerd_klass",
            "values": ["twm_ziel"]
          }
        },
        {"title": "Hauptfutterfläche (HFF)", "value": "hff"},
        {
          "title": "Landschaftselement/Biotop o.Ä.",
          "value": "biotop_le",
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
          "title": "Wald/Forst",
          "value": "wald",
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
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_ziel_einh",
      "type": "SingleChoiceQuestion",
      "title": "Zieleinheit",
      "choices": [
        {"title": "keine Angabe/Vorgabe", "value": "o"},
        {
          "title": "m³ (z.B. Gülle)",
          "value": "m3",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_foerd_klass",
                "values": ["vns", "aukm"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["dungmang", "extens"]
              }
            ]
          }
        },
        {
          "title": "Kopf/Stück (z.B. Tiere oder Bäume)",
          "value": "pieces",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_foerd_klass",
                "values": ["vns", "aukm", "twm_ziel"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us", "flst", "umwandlg"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_ziel_fl",
                "values": ["o"]
              }
            ]
          }
        },
        {
          "title": "Großvieheinheiten (GV/GVE)",
          "value": "gve",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_foerd_klass",
                "values": ["vns", "aukm", "twm_ziel"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_ziel_fl",
                "values": ["o"]
              }
            ]
          }
        },
        {
          "title": "Raufutter fressende Großvieheinheiten (RGV)",
          "value": "rgve",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_foerd_klass",
                "values": ["vns", "aukm", "twm_ziel"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us", "anlage_pflege", "flst", "umwandlg"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_ziel_fl",
                "values": ["o"]
              }
            ]
          }
        },
        {
          "title": "Hektar (ha)",
          "value": "ha",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_ziel_fl",
            "values": ["o"]
          }
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_ziel_haupt",
      "type": "SingleChoiceQuestion",
      "title": "Hauptzielsetzung Land",
      "choices": [
        {"title": "keine Angabe/Vorgabe", "value": "o"},
        {"title": "Bodenschutz", "value": "bsch"},
        {"title": "Gewässerschutz", "value": "wsch"},
        {"title": "Spezieller Artenschutz", "value": "asch"},
        {"title": "Biodiversität", "value": "biodiv"},
        {"title": "Erhöhung der Strukturvielfalt", "value": "strutktviel"},
        {"title": "Erhaltung genetischer Ressourcen (Pflanzen, z. B. im Grünland, und Tiere, z. B. bedrohte Rassen)", "value": "genet_res"},
        {"title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb", "value": "tsch"},
        {"title": "Klima", "value": "klima"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "mch_ziel_neben",
      "type": "MultipleChoiceQuestion",
      "title": "Nebenziele_Land",
      "choices": [
        {"title": "keine Angabe/Vorgabe", "value": "o"},
        {"title": "Bodenschutz", "value": "bsch"},
        {"title": "Gewässerschutz", "value": "wsch"},
        {"title": "Spezieller Artenschutz", "value": "asch"},
        {"title": "Biodiversität", "value": "biodiv"},
        {"title": "Erhöhung der Strukturvielfalt", "value": "strutktviel"},
        {"title": "Erhaltung genetischer Ressourcen (Pflanzen, z. B. im Grünland, und Tiere, z. B. bedrohte Rassen)", "value": "genet_res"},
        {"title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb", "value": "tsch"},
        {"title": "Klima", "value": "klima"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "gl_typ",
      "type": "SingleChoiceQuestion",
      "title": "Grünlandtyp",
      "choices": [
        {"title": "keine Angabe", "value": "o"},
        {"title": "Wiese", "value": "wiese"},
        {"title": "Weide", "value": "weide"},
        {"title": "Wiese/Weide (Maßnahmenbeschreibung beinhaltet beide Optionen)", "value": "wiese_weide"},
        {"title": "Streuobst/-wiese/-bestand", "value": "strob"},
        {"title": "Heide", "value": "heide"},
        {"title": "Alm", "value": "alm"},
        {"title": "Hutung", "value": "hutu"},
        {"title": "Feuchtgrünland", "value": "fgl"},
        {"title": "Magerrasen", "value": "mras"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "ContainsAnyOf",
        "field": "mch_ziel_fl",
        "values": ["gl", "lf"]
      }
    },
    {
      "id": "gl_bw_vg",
      "type": "MultipleChoiceQuestion",
      "title": "Grünlandbewirtschaftung",
      "choices": [
        {"title": "keine Angabe", "value": "o"},
        {
          "title": "einschürige Wiese (keine Beweidung)",
          "value": "einschuer_o_weide",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "gl_typ",
            "values": ["wiese", "wiese_weide", "strob"]
          },
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {
          "title": "einschürige Wiese  mit darauf folgender obligater Beweidung",
          "value": "einschuer_m_weide",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "gl_typ",
            "values": ["wiese", "wiese_weide", "strob"]
          },
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {
          "title": "keine Grünland-Erneuerung",
          "value": "o_erneuerg",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {
          "title": "kein Walzen",
          "value": "o_walzen",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "CheckAllConditions",
        "conditions": [
          {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_einh",
            "values": ["ha"]
          },
          {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl"]
          }
        ]
      }
    },
    {
      "id": "sh_art",
      "type": "SingleChoiceQuestion",
      "title": "Strukturart",
      "choices": [
        {"title": "keine Struktur", "value": "o"},
        {
          "title": "Gehölz/Hecke",
          "value": "hecke",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_ziel_fl",
            "values": ["wald"]
          }
        },
        {
          "title": "Blühfläche/-streifen/Brache und andere Saumstrukturen",
          "value": "saum",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_ziel_fl",
            "values": ["wald"]
          }
        },
        {"title": "Graben", "value": "graben"},
        {"title": "Vernässung", "value": "vernaessg"},
        {"title": "Gewässerschutzstreifen (incl. Erosionsschutzstreifen)", "value": "schutz_streif"},
        {"title": "Biotop", "value": "biotop"},
        {
          "title": "Streuobst/-wiese/-bestand",
          "value": "strobst",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff", "biotop_le"]
          }
        },
        {"title": "Steinmauer, Lesesteinhaufen", "value": "stein"},
        {
          "title": "Trockenrasen, Heide etc.",
          "value": "biotop_bes",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff", "biotop_le"]
          }
        },
        {
          "title": "Strukturelemente nicht definiert (z. B. \"naturnahe Strukturelemente\" oder mehrere, unterschiedliche Elemente inbegriffen)\"",
          "value": "le_undef"
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "ContainsAnyOf",
        "field": "mch_ziel_einh",
        "values": ["pieces", "ha"]
      }
    },
    {
      "id": "sh_pflg_art",
      "type": "SingleChoiceQuestion",
      "title": "Pflegeart",
      "choices": [
        {"title": "Neuanlage zu Beginn der Verpflichtung", "value": "verpfl_neuanl_begin"},
        {"title": "Pflege im Verpflichtungszeitraum", "value": "verpfl_pflege"},
        {"title": "regelmäßige Neuanlage im Verpflichtungszeitraum (z.B. überjährige Blühstreifen)", "value": "verpfl_neuanl_regelm"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "CheckAllConditions",
        "conditions": [
          {
            "type": "ContainsAnyOf",
            "field": "mch_kat",
            "values": ["anlage_pflege", "extens", "flst", "umwandlg"]
          },
          {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_einh",
            "values": ["pieces", "ha"]
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
      "id": "sh_pflg_haeuf",
      "type": "SingleChoiceQuestion",
      "title": "Pflege-Häufigkeit",
      "choices": [
        {"title": "keine Pflege", "value": "o"},
        {"title": "einmalige Pflege bestehender Strukturen", "value": "pflege_einmal"},
        {"title": "jährliche Pflege bestehender Strukturen", "value": "pflege_ann"},
        {"title": "zeitlich und räumliche Staffelung", "value": "staffelg_t_ao"},
        {"title": "Pflegerhytmus nicht definiert", "value": "undef"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "CheckAllConditions",
        "conditions": [
          {
            "type": "ContainsAnyOf",
            "field": "mch_kat",
            "values": ["anlage_pflege", "extens", "flst", "umwandlg"]
          },
          {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_einh",
            "values": ["pieces", "ha"]
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
      "id": "bw_nutz_ausschl",
      "type": "SingleChoiceQuestion",
      "title": "Nutzungsausschluss",
      "choices": [
        {"title": "keine Angabe (kein Nutzungsausschluss)", "value": "o"},
        {
          "title": "Nutzung ist ausgeschlossen, keine Ernteabfuhr",
          "value": "o_abfuhr",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["vns", "aukm"]
          }
        },
        {"title": "Erntegutnutzung ausschließlich für Biogasanlagen", "value": "abfuhr_f_biogs"},
        {"title": "ausschließlich Beweidung mit Schafen oder Ziegen auf nicht-Grünlandfläche erlaubt", "value": "beweidg_af_erlaubt"},
        {"title": "ausschließlich Schröpfschnitt erlaubt", "value": "schroepfen"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "bw_kult",
      "type": "SingleChoiceQuestion",
      "title": "betroffene Frucht",
      "choices": [
        {"title": "keine", "value": "o"},
        {"title": "auf Hauptfrucht", "value": "hfrucht"},
        {
          "title": "nur auf Nebenfrucht",
          "value": "nfrucht",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "biotop_le", "wald"]
          }
        },
        {
          "title": "auf Haupt- und Nebenfrucht",
          "value": "h_n_nfrucht",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "biotop_le", "wald"]
          }
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "bw_vieh_vg",
      "type": "MultipleChoiceQuestion",
      "title": "Tierbestandsvorgabe",
      "choices": [
        {"title": "ohne", "value": "o"},
        {"title": "Reduktion des Viehbestandes", "value": "vieh_red"},
        {
          "title": "Änderung der Haltungsbedingungen, z. B. Stallumbau, Einführung von Weidegang, Sommerweidehaltung, Haltung auf Stroh",
          "value": "veraenderg_tierhaltg",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_foerd_klass",
            "values": ["ea"]
          }
        },
        {"title": "verzögerter Auftrieb/Weidebeginn oder vorgezogener Abtrieb/Weidegangende", "value": "bweidg_kurz"},
        {"title": "Gezielte Auswahl der Tierart/Rasse --> s. Spalte 'besondere Kultur- oder Tierart'", "value": "bes_art_rasse"},
        {
          "title": "N/Stickstoff-reduzierte Fütterung von Tieren",
          "value": "n_red_fuetterg",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["vns", "aukm", "twm_ziel"]
          }
        },
        {
          "title": "Verzicht Kupierung (Schnäbel, Hörner, Ringelschwänze etc.)",
          "value": "verzicht",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_foerd_klass",
            "values": ["vns", "aukm", "twm_ziel"]
          }
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
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
            "values": ["dk_sk", "biotop_le", "wald", "al"]
          }
        ]
      }
    },
    {
      "id": "bbearb_vg",
      "type": "MultipleChoiceQuestion",
      "title": "Bodenbearbeitung",
      "choices": [
        {"title": "keine Angabe/ohne Einschränkung", "value": "o"},
        {
          "title": "reduzierte Bodenbearbeitung MIT spezifischer/besonderer Bearbeitungstechnik",
          "value": "red_bbearb_m_technik",
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
          },
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {
          "title": "reduzierte Bodenbearbeitung OHNE spezifische/besondere Bearbeitungstechnik",
          "value": "red_bbearb_o_technik",
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
          },
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {
          "title": "Verbot der Bodenbearbeitung",
          "value": "o_bbearb",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {
          "title": "Grünlanderneuerung nur flachwendend / pfluglos / nicht wendend / durch vollflächiges Durchschneiden der Grasnarbe",
          "value": "gl_erneu_flach",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff"]
          },
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "ContainsAnyOf",
        "field": "mch_ziel_einh",
        "values": ["ha"]
      }
    },
    {
      "id": "dueng_vg",
      "type": "MultipleChoiceQuestion",
      "title": "Düngung",
      "choices": [
        {"title": "keine Angabe / ohne Einschränkung", "value": "o"},
        {
          "title": "keine Düngung",
          "value": "keine",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {
          "title": "besondere Ausbringungstechnik (z.B. Schleppschlauch) mit weiteren Angaben in Technische Anforderungen",
          "value": "ausbring_techn",
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
              "type": "SingleChoiceQuestion",
              "title": "Düngung Art",
              "choices": [
                {"title": "keine Angabe", "value": "o"},
                {"title": "organisch, tierisch und flüssig: z.B. Gülle", "value": "dueng_org_tier_liqu"},
                {"title": "organisch, tierisch, fest: Festmist", "value": "dueng_org_tier_fest"},
                {"title": "organisch, pflanzlich: Gärrest", "value": "dueng_org_pflz"},
                {"title": "Wirtschaftsdünger (organisch, nicht genauer differenziert)", "value": "dueng_org"},
                {"title": "mineralisch", "value": "dueng_miner"},
                {"title": "organisch und mineralisch", "value": "dueng_org_n_miner"},
                {
                  "title": "Bestimmte Inhalts- oder Nährstoffe sind zulässig oder ausgeschlossen. Im Feld Sonstiges angeben, wie die Auflage lautet!",
                  "value": "dueng_stoff"
                },
                {"title": "Düngung auf Grundlage einer Bodenuntersuchung", "value": "dueng_bu"},
                {"title": "bitte um Unterstützung", "value": "contact"}
              ]
            },
            {"type": "ReuseSurveyEntry", "reuseId": "staffelg"}
          ]
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "ContainsNoneOf",
        "field": "mch_ziel_fl",
        "values": ["wald"]
      }
    },
    {
      "id": "dueng_art",
      "type": "SingleChoiceQuestion",
      "title": "Düngung Art",
      "choices": [
        {"title": "keine Angabe", "value": "o"},
        {"title": "organisch, tierisch und flüssig: z.B. Gülle", "value": "dueng_org_tier_liqu"},
        {"title": "organisch, tierisch, fest: Festmist", "value": "dueng_org_tier_fest"},
        {"title": "organisch, pflanzlich: Gärrest", "value": "dueng_org_pflz"},
        {"title": "Wirtschaftsdünger (organisch, nicht genauer differenziert)", "value": "dueng_org"},
        {"title": "mineralisch", "value": "dueng_miner"},
        {"title": "organisch und mineralisch", "value": "dueng_org_n_miner"},
        {
          "title": "Bestimmte Inhalts- oder Nährstoffe sind zulässig oder ausgeschlossen. Im Feld Sonstiges angeben, wie die Auflage lautet!",
          "value": "dueng_stoff"
        },
        {"title": "Düngung auf Grundlage einer Bodenuntersuchung", "value": "dueng_bu"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "pflz_sch",
      "type": "SingleChoiceQuestion",
      "title": "Pflanzenschutz",
      "choices": [
        {"title": "keine Angabe / ohne Einschränkung", "value": "o"},
        {"title": "integrierter Pflanzenschutz", "value": "pflz_sch_integr"},
        {
          "title": "gezielte Ausbringung von Nützlingen oder Pheromonen",
          "value": "pflz_sch_biol_ausbring",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "biotop_le"]
          }
        },
        {"title": "chem. Pflanzenschutz, auf Einzelpflanzenbehandlung beschränkt", "value": "pflz_sch_chem_einzel"},
        {"title": "kein chem. Pflanzenschutz", "value": "pflz_sch_o"},
        {"title": "Verzicht auf Herbizide", "value": "pflz_sch_o_herbiz"},
        {
          "title": "Verzicht auf Wachstumsregler",
          "value": "pflz_sch_o_wregelg",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["al", "lf", "dk_sk"]
          }
        },
        {"title": "optionale Einschränkung", "value": "pflz_sch_einschraenk_option"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "ContainsNoneOf",
        "field": "mch_ziel_einh",
        "values": ["m3", "pieces", "gve", "rgve"]
      }
    },
    {
      "id": "tech",
      "type": "MultipleChoiceQuestion",
      "title": "Technische Anforderungen",
      "choices": [
        {"title": "ohne", "value": "o"},
        {"title": "Reduzierter Reifendruck", "value": "red_reifen_druck"},
        {"title": "Mulchen/Eggen", "value": "mulch_egge"},
        {"title": "Direktsaat-/Mulchsaat-/Mulchpflanzverfahren", "value": "direkt_o_mulch_saat_o_pflanz"},
        {
          "title": "Besondere Mähtechnik, z. B: Messerbalken",
          "value": "spez_maehtechn",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff", "biotop_le"]
          }
        },
        {
          "title": "Besondere Weidetechnik (Standweide )",
          "value": "spez_weidetechn",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["gl", "lf", "hff", "biotop_le"]
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
          "title": "Vernässung, zumindest temporär (Wasserstandsanhebung im Winter, Rückbau von Drainagen)",
          "value": "vernaessg",
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
          "title": "Einsatz stabilisierter Dünger (z.B. CULTAN-Verfahren, N-Depotdüngung)",
          "value": "stabil_dueng",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "dueng_vg",
                "values": ["dueng_spez_art"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_foerd_klass",
                "values": ["azl", "twm_ziel"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["anlage_pflege", "umwandlg", "bes_kult_rass"]
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
          "title": "standortangepasst/teilflächenspezifisch (z.B. bei Düngung oder Einsatz von Exaktstreuer)",
          "value": "flaech_spezif_dueng",
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
          "title":
              "Analysen zur Düngungsplanung, z.B. Bodenuntersuchung/Frühjahres-Nmin-Analyse, Pflanzenanalysen, Wirtschaftsdünger- und Gärsubstratanalysen, Hoftorbilanzen, NIRS-Verfahren",
          "value": "dueng_plang",
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
          "title": "Emissionsarme Ausbringungstechnik (Schleppschlauch/-Schuh etc.)",
          "value": "remiss_red_ausbring_techn",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "dueng_vg",
                "values": ["ausbring_techn"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["anlage_pflege", "flst", "umwandlg", "bes_kult_rass"]
              }
            ]
          }
        },
        {
          "title": "in Reihen (z.B. strip till oder Düngung in Reihen)",
          "value": "in_reihe",
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
                "values": ["gl", "biotop_le", "wald"]
              }
            ]
          }
        },
        {
          "title": "Aussaat/Anpflazung in weiter Reihe / doppeltem Reihenabstand / mit reduzierter Saatstärke/-menge",
          "value": "weite_reihe",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "dk_sk", "hff"]
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
          "title": "Aussaat/Anpflanzung mit enger Reihe",
          "value": "enge_reihe",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "dk_sk", "hff"]
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
          "title": "Dekanter",
          "value": "dekant",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "dueng_vg",
            "values": ["ausbring_techn"]
          }
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "rv_kuliss_r_def",
      "type": "SingleChoiceQuestion",
      "title": "räumlich definierte Kulisse",
      "choices": [
        {"title": "ohne", "value": "o"},
        {"title": "Naturschutzgebiete i. w. S. (NSG, SPA, FFH, Biosphärengebiete, Nationalparke, ...)", "value": "natsch_kulissen"},
        {"title": "Wasserschutzgebiete (HQ20, rote Wasserkörper, …)", "value": "wassersch_kulissen"},
        {"title": "Bodenschutzgebiete (Wassererosionsschutzgebiete, Winderosionsschutzgebiete, organische Böden, …)", "value": "bsch_kulissen"},
        {"title": "Almen / Berglagen / Ungunstlagen", "value": "ungunst"},
        {"title": "Moorstandorte / Feuchtgebiete / organische Böden", "value": "organ_o_feucht"},
        {"title": "andere räumliche Definition", "value": "andere"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "rv_kuliss_i_def",
      "type": "SingleChoiceQuestion",
      "title": "inhaltlich definierte Kulisse",
      "choices": [
        {"title": "ohne", "value": "o"},
        {"title": "Lage (z. B. an Gewässern, an Knicks, an Waldrändern)", "value": "lage"},
        {
          "title": "Kulturen / Kulturgruppen (nach Mais, Reihenkulturen, vor Wintergetreide, ...)",
          "value": "kultur",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["al", "lf", "dk_sk", "hff"]
          }
        },
        {
          "title": "Habitate / Zielarten (z.B. artenreiches Grünland, FFH-Lebensraumtypen, Ackerlebensräume, bei Vorkommen bestimmter Arten)",
          "value": "habitat_o_art"
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "rv_kuliss_i_erl_zuw",
      "type": "SingleChoiceQuestion",
      "title": "Zuweisung für Erläuterung inhaltlich Flächendefinition \"thematische Kulisse\" ",
      "choices": [
        {"title": "nicht zu / nicht bei", "value": "ausschluss"},
        {"title": "vor", "value": "vorab"},
        {"title": "zu / bei", "value": "incl"},
        {"title": "nach", "value": "danach"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {"type": "ReuseSurveyEntry", "reuseId": "staffelg"},
    {
      "id": "rv_pflz_art",
      "type": "MultipleChoiceQuestion",
      "title": "Pflanzenart oder der Anzahl von Arten, die angebaut/gesät werden müssen",
      "choices": [
        {"title": "keine/ohne", "value": "o"},
        {
          "title": "Blühmischung konkret vorgegeben",
          "value": "mischg_def",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["zf_us", "anlage_pflege", "extens", "flst", "umwandlg"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "Blühmischung mit Optionen vorgegeben (z. B. Anzahl Arten, Artherkunft)",
          "value": "mischg_option",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["zf_us", "anlage_pflege", "extens", "flst", "umwandlg"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "<=4-gliedrige Fruchtfolge",
          "value": "fruchtfolge_lt_n_is_4teil",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["extens", "umwandlg", "bes_kult_rass"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": ">=5-gliedrige Fruchtfolge",
          "value": "fruchtfolge_gt_n_is_5teil",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["extens", "umwandlg", "bes_kult_rass"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "vorgegebene Anzahl von Kulturen, die zeitgleich angebaut werden müssen",
          "value": "kulturen_zeitgl",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["extens", "umwandlg", "bes_kult_rass"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "Fruchtfolge mit Bracheanteil",
          "value": "fruchtfolge_m_bache",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["dungmang"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_ziel_fl",
                "values": ["wald"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "weitere/andere Fruchtfolgen",
          "value": "fruchtfolge_andere",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["anlage_pflege", "umwandlg"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "dk_sk", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "seltene Kulturen",
          "value": "kultur_selten",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "dk_sk", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us", "dungmang"]
              }
            ]
          }
        },
        {
          "title": "Leguminosen",
          "value": "legum",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us", "dungmang"]
              }
            ]
          }
        },
        {
          "title": "Zwischenfrucht",
          "value": "zf",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["zf_us"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "dk_sk", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "Untersaat",
          "value": "us",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["zf_us"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "dk_sk", "hff"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {
          "title": "Grünland/Feldgraseinsaat/-Anlage",
          "value": "gl_einsaat",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_foerd_klass",
                "values": ["vns", "aukm"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_kat",
                "values": ["extens", "flst", "umwandlg"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_ziel_fl",
                "values": ["dk_sk", "wald"]
              }
            ]
          }
        },
        {
          "title": "Nachweis von Kennarten",
          "value": "kennart",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_foerd_klass",
                "values": ["vns", "aukm"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us", "dungmang"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["gl", "biotop_le"]
              },
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_einh",
                "values": ["ha"]
              }
            ]
          }
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "rv_pflz_saat",
      "type": "SingleChoiceQuestion",
      "title": "Vorgaben an die Art/Mischung des Saatgutes",
      "choices": [
        {
          "title": "keine/ohne",
          "value": "o",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "rv_pflz_art",
            "values": ["mischg_def", "mischg_option"]
          }
        },
        {
          "title": "Regiosaat",
          "value": "reg_saat",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "rv_pflz_art",
            "values": ["mischg_def", "mischg_option"]
          }
        },
        {
          "title": "Wildpflanzen",
          "value": "wild_pflz",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "rv_pflz_art",
            "values": ["mischg_def", "mischg_option"]
          }
        },
        {
          "title": "Kulturarten",
          "value": "kult_art",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "rv_pflz_art",
            "values": ["gl_einsaat", "kennart"]
          }
        },
        {
          "title": "ohne Leguminosen",
          "value": "o_legum",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "rv_pflz_art",
            "values": ["gl_einsaat", "kennart"]
          }
        },
        {
          "title": "kleinkörnige Leguminosen",
          "value": "legum_kkoern",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "rv_pflz_art",
            "values": ["legum"]
          }
        },
        {
          "title": "winterhart (Zwischenfrucht mit Standzeit > 3 Monaten/mit spätem Umbruch/frostresistent)",
          "value": "wi_hart",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "rv_pflz_art",
            "values": ["zf"]
          }
        },
        {
          "title": "abfrierend (Zwischenfrucht mit Standzeit < 3 Monaten/mit frühem Umbruch/nicht-frostresistent)",
          "value": "wi_abfr",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "rv_pflz_art",
            "values": ["zf"]
          }
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "rv_tierart",
      "type": "MultipleChoiceQuestion",
      "title": "Verwendung einer bestimmten Tierart",
      "choices": [
        {"title": "keine/ohne", "value": "o"},
        {
          "title": "Schafe",
          "value": "schaf",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff", "biotop_le"]
          }
        },
        {
          "title": "Ziegen",
          "value": "ziege",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff", "biotop_le"]
          }
        },
        {
          "title": "Wasserbüffel",
          "value": "w_bueffel",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff", "biotop_le"]
          }
        },
        {
          "title": "Schweine",
          "value": "schw",
          "enabledIf": {
            "type": "ContainsNoneOf",
            "field": "mch_ziel_fl",
            "values": ["gl"]
          }
        },
        {"title": "Geflügel", "value": "gefl"},
        {"title": "Rinder ohne Milchkühe", "value": "rind_o_miku"},
        {"title": "Milchkühe", "value": "miku"},
        {
          "title": "Pferde",
          "value": "pferd",
          "enabledIf": {
            "type": "ContainsAnyOf",
            "field": "mch_ziel_fl",
            "values": ["gl", "lf", "hff", "biotop_le"]
          }
        },
        {"title": "Bienen", "value": "biene"},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "ContainsNoneOf",
        "field": "mch_kat",
        "values": ["zf_us", "flst"]
      }
    },
    {
      "id": "rv_ausschl_basis",
      "type": "SingleChoiceQuestion",
      "title": "Ausschluss von:",
      "choices": [
        {"title": "keine/ohne", "value": "o"},
        {
          "title": "Silage (Maßnahme z.B. Silageverzicht im gesamten Betrieb)",
          "value": "silage",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["gl", "lf", "hff"]
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
          "title": "Herbstumbruch",
          "value": "umbruch_herbst",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "hff"]
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
          "title": "Beregnung",
          "value": "bereg",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "hff"]
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
          "title": "Entwässerung, Drainage",
          "value": "entwaess",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "gl", "lf", "hff"]
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
          "title": "Melioration (jegliche Be- und Entwässerung der Fläche)",
          "value": "meliorat",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "gl", "hff"]
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
          "title": "Kulturen/Kulturgruppen/Kulturmischungen",
          "value": "kultur",
          "enabledIf": {
            "type": "CheckAllConditions",
            "conditions": [
              {
                "type": "ContainsAnyOf",
                "field": "mch_ziel_fl",
                "values": ["al", "lf", "hff"]
              },
              {
                "type": "ContainsNoneOf",
                "field": "mch_kat",
                "values": ["zf_us"]
              }
            ]
          },
          "subQuestions": [
            {
              "id": "rv_ausschl_konkr",
              "type": "SingleChoiceQuestion",
              "title": "Ausschluss - Konkretisierung",
              "choices": [
                {"title": "keine/ohne", "value": "o"},
                {"title": "alle ausgeschlossen", "value": "ausschluss"},
                {"title": "Raps", "value": "raps"},
                {"title": "Mais", "value": "mais"},
                {"title": "Kartoffeln", "value": "kart"},
                {"title": "Winterweizen", "value": "wwei"},
                {"title": "Leguminosen (allgemein/alle)", "value": "legum_allg"},
                {"title": "großkörnige Leguminosen", "value": "legum_gkoern"},
                {"title": "Sonderkulturen", "value": "skul"},
                {"title": "Gemüse", "value": "gem"},
                {"title": "bitte um Unterstützung", "value": "contact"}
              ]
            }
          ]
        },
        {"title": "bitte um Unterstützung", "value": "contact"}
      ],
      "enabledIf": {
        "type": "ContainsAnyOf",
        "field": "mch_ziel_einh",
        "values": ["ha"]
      }
    },
    {
      "id": "vorgabe-art-mischung-saatgut",
      "type": "MultipleChoiceQuestion",
      "title": "Vorgabe an die Art/Mischung des Saatgutes",
      "choices": [
        {"title": "keine Vorgabe", "value": "keine-Vorgabe", "subQuestions": []},
        {
          "title": "vorgeschriebene Anzahl von Arten/Kulturen, die zeitgleich angebaut werden sollen, Anzahl nachzuweisender Kennarten",
          "value": "vorgeschr-anzahl-zeitgleich-kulturen",
          "subQuestions": []
        },
        {
          "title": "Vorgaben zu Kulturen (welche, wie viel wird konkretisiert)",
          "value": "vorg-kulturen",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
          ]
        },
        {
          "title": "Untersaat",
          "value": "untersaat",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
          ]
        },
        {
          "title": "Zwischenfrüchte",
          "value": "zwischenfrüchte",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
          ]
        },
        {
          "title": "Blühmischung",
          "value": "blühmischung",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
          ]
        }
      ]
    }
  ],
  "definitions": [
    {
      "id": "staffelg",
      "type": "SingleChoiceQuestion",
      "title": "Staffelung",
      "choices": [
        {
          "title": "Ja",
          "value": "ja",
          "subQuestions": [
            {
              "id": "staffelg_inkl_excl",
              "type": "SingleChoiceQuestion",
              "title": "Staffelung als Vorgabe oder mit Verzicht",
              "choices": [
                {"title": "Inklusiv / Vorgegebene Abfolge", "value": "inkl", "subQuestions": []},
                {"title": "Exklusiv / Ausschluss von", "value": "exkl", "subQuestions": []}
              ]
            },
            {
              "id": "staffelg_räuml_zeitl",
              "type": "SingleChoiceQuestion",
              "title": "Staffelung im Raum oder im Zeitverlauf",
              "choices": [
                {"title": "räumlich", "value": "räuml", "subQuestions": []},
                {"title": "zeitlich", "value": "zeitl", "subQuestions": []}
              ]
            }
          ]
        },
        {"title": "Nein", "value": "nein", "subQuestions": []},
        {"title": "bitte um Unterstützung", "value": "contact"}
      ]
    },
    {
      "id": "vorg-sorten-kulturen",
      "type": "MultipleChoiceQuestion",
      "title": "Welche Sorten/Kulturen sind vorgegeben?",
      "choices": [
        {"title": "Getreide", "value": "getreide", "subQuestions": []},
        {"title": "Leguminosen (alle, auch in Gemengen)", "value": "legum", "subQuestions": []},
        {"title": "kleinkörnige Leguminosen (auch in Gemengen)", "value": "kleinkörn-legum", "subQuestions": []},
        {"title": "großkörnige Leguminosen (auch in Gemengen)", "value": "großkörn-legum", "subQuestions": []},
        {"title": "blühende Arten", "value": "blüh-arten", "subQuestions": []},
        {"title": "konkrete Blühmischung", "value": "konkr-blühmisch", "subQuestions": []},
        {"title": "Auswahlliste möglicher Arten/Kulturen (Referenzliste)", "value": "auswahl-kulturen", "subQuestions": []},
        {"title": "Brache", "value": "brache", "subQuestions": []},
        {"title": "Sommerkulturen", "value": "sommerkulturen", "subQuestions": []},
        {"title": "seltene Kulturen", "value": "seltene-kulturen", "subQuestions": []},
        {"title": "Grünland, Feld- oder Ackergras, Gräser", "value": "grünland-feld-ackergras-gräser", "subQuestions": []},
        {"title": "Hackfrüchte", "value": "hackfrüchte", "subQuestions": []},
        {"title": "Gemüse", "value": "gemüse", "subQuestions": []},
        {"title": "winterharte Zwischenfrüchte", "value": "winterhart-zwfrüchte", "subQuestions": []},
        {"title": "abfrierende Zwischenfrüchte", "value": "abfrier-zwfrüchte", "subQuestions": []},
        {"title": "beliebige Kulturarten", "value": "beliebig-kulturarten", "subQuestions": []},
        {"title": "Mischung ohne Leguminosen", "value": "mischung-ohne-legum", "subQuestions": []},
        {"title": "Mais", "value": "mais", "subQuestions": []},
        {"title": "Sonstige", "value": "sonstige", "subQuestions": []}
      ]
    }
  ]
};
