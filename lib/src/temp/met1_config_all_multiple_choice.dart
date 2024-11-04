const met1AllMultipleChoiceConfig =
// GENERATED CODE - DO NOT MODIFY BY HAND

// "MultipleChoiceQuestion" ersetzt durch "MultipleChoiceQuestion" ersetzen

// "?e?n?a?b?l?e?d?I?f?"?:? ?\{[\n ]+"type": "Contains[ \n"a-zA-Z:,_\[\]0-9]+\},?
// löschen

// ,[\n ]+"enabledIf": \{[\n "a-z:,_\[\]]+\}
// löschen

// **************************************************************************
// JsonToSurveyConfigurationGenerator
// **************************************************************************
    {
  "type": "Survey",
  "questions": [
    {
      "type": "MultipleChoiceQuestion",
      "id": "last_status",
      "title": "Status",
      "choices": [
        {"value": "bearb", "title": "in Bearbeitung"},
        {"value": "contact", "title": "Rücksprache"},
        {"value": "fertig", "title": "abgeschlossen"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "id_bdl",
      "title": "Bundesland",
      "choices": [
        {"value": "bw", "title": "Baden-Württemberg"},
        {"value": "by", "title": "Bayern"},
        {"value": "be", "title": "Berlin"},
        {"value": "bb", "title": "Brandenburg"},
        {"value": "hb", "title": "Bremen"},
        {"value": "hh", "title": "Hamburg"},
        {"value": "he", "title": "Hessen"},
        {"value": "mv", "title": "Mecklenburg-Vorpommern"},
        {"value": "ni", "title": "Niedersachsen"},
        {"value": "nw", "title": "Nordrhein-Westfalen"},
        {"value": "rp", "title": "Rheinland-Pfalz"},
        {"value": "sl", "title": "Saarland"},
        {"value": "sn", "title": "Sachsen"},
        {"value": "st", "title": "Sachsen-Anhalt"},
        {"value": "sh", "title": "Schleswig-Holstein"},
        {"value": "th", "title": "Thüringen"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_finanz",
      "title": "Finanzierung",
      "choices": [
        {"value": "eler", "title": "ELER"},
        {"value": "gak", "title": "GAK"},
        {"value": "land", "title": "Landesmittel"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_foerd_klass",
      "title": "Förderklasse",
      "choices": [
        {"value": "oelb", "title": "Ökolandbau"},
        {"value": "azl", "title": "Ausgleichszulage"},
        {"value": "ea", "title": "Erschwernisausgleich"},
        {"value": "vns", "title": "Vertragsnaturschutz"},
        {"value": "aukm", "title": "Agrarumwelt- und Klimamaßnahmen AUKM"},
        {"value": "twm_ziel", "title": "Tierschutz/Tierwohlmaßnahmen"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_honor",
      "title": "Honorierung",
      "choices": [
        {
          "value": "sto_dif",
          "title": "Differenziert nach Standort / Lagebasiert"
        },
        {
          "value": "flaechen_diff",
          "title":
              "Differenziert nach Umsetzungsumfang / gestaffelt nach Flächengröße"
        },
        {"value": "einh_praem", "title": "Einheitsprämie"},
        {"value": "erg_orient", "title": "Ergebnisorientiert"},
        {"value": "handlg_orient", "title": "Handlungsorientiert"},
        {"value": "invest_foerderg", "title": "Investitionsförderung"},
        {"value": "markt_foerderg", "title": "maktorientierter Ausgleich"},
        {
          "value": "ertrag_foerederg",
          "title": "ertragsorientierte/ertragsmesszahlbasierte Auszahlung"
        },
        {"value": "koop_foerderg", "title": "kooperative Förderung"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_foerd_variab",
      "title": "Variabilität",
      "choices": [
        {"value": "fix", "title": "nein, feste Förderhöhe"},
        {
          "value": "abw",
          "title":
              "Grundbetrag einer Förderhöhe ist angegeben, kann aber abweichen wenn die Maßnahme kombiniert wird oder aus anderen Gründen"
        },
        {
          "value": "var",
          "title":
              "keine einheitliche Förderhöhe angegeben, beispielsweise unterschiedliche Förderhöhen in einer Komplexmaßnahme"
        }
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_kat",
      "title": "Kategorie",
      "choices": [
        {"value": "zf_us", "title": "Anbau Zwischenfrucht/Untersaat"},
        {"value": "anlage_pflege", "title": "Anlage/Pflege Struktur"},
        {"value": "dungmang", "title": "Düngemanagement"},
        {"value": "extens", "title": "Extensivierung"},
        {"value": "flst", "title": "Flächenstilllegung/Brache"},
        {"value": "umwandlg", "title": "Nutzungsumwandlung"},
        {
          "value": "bes_kult_rass",
          "title": "Förderung bestimmter Rassen / Sorten / Kulturen"
        },
        {
          "value": "anbaudiv",
          "title": "Anbaudiversität / Erhöhung der Kulturartenvielfalt"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_ums_eb",
      "title": "Umsetzungsebene",
      "choices": [
        {"value": "flaeche", "title": "Einzelfläche"},
        {"value": "bzweig", "title": "Betriebszweig"},
        {"value": "betr", "title": "Gesamtbetrieb"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_kombi",
      "title": "Kombinierbar mit anderen Massnahmen",
      "choices": [
        {"value": "no", "title": "Nein"},
        {
          "value": "oevf_oer",
          "title":
              "Greening/ÖVF (für Förderperiode 2014-2022) bzw. Ökoregelung (für Förderperiode ab 2023)"
        },
        {"value": "aukm", "title": "AUKM"},
        {
          "value": "sonst",
          "title": "Andere (aber NICHT Greening/ÖVF, Ökoregelung oder AUKM)"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_beratg",
      "title": "Beratung",
      "choices": [
        {"value": "o", "title": "keine Angabe/ohne obligate Beratung"},
        {
          "value": "beratg_oblig",
          "title": "obligate Beratung (auch in Form der Imkerbeteiligung)"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "komplex_typ",
      "title": "Komplex-Maßnahme",
      "choices": [
        {"value": "norm", "title": "nicht unterteilte Maßnahme (Standard)"},
        {
          "value": "komplex",
          "title": "Komplexmaßnahme (beinhaltet verschiedene Varianten)"
        },
        {"value": "variante", "title": "Variante einer Komplexmaßnahme"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_topup_typ",
      "title": "Top-Up- oder Basis-Massnahme",
      "choices": [
        {"value": "norm", "title": "nicht unterteilte Maßnahme (Standard)"},
        {"value": "basis", "title": "Basis-Maßnahme"},
        {"value": "top_up", "title": "Top-Up-Maßnahme"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_dauer_vertr",
      "title": "Vertragslaufzeit",
      "choices": [
        {"value": "1y", "title": "1 Jahr"},
        {"value": "2y", "title": "2 Jahre"},
        {"value": "3y", "title": "3 Jahre"},
        {"value": "4y", "title": "4 Jahre"},
        {"value": "5y", "title": "5 Jahre"},
        {
          "value": "bis5y",
          "title": "<= 5 Jahre (wenn nicht genauer angegeben)"
        },
        {"value": "bis10y", "title": "<= 10 Jahre"},
        {"value": "bis20y", "title": "<= 20 Jahre"},
        {"value": "na", "title": "nicht angegeben"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_dauer_lage",
      "title": "Lagetreue der Maßnahme",
      "choices": [
        {"value": "wechsel_ann", "title": "jährlich variabel"},
        {
          "value": "lagetreu",
          "title": "Lagetreu über den Verpflichtungszeitraum"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_ziel_fl",
      "title": "Zielfläche",
      "choices": [
        {"value": "o", "title": "keine Angabe/Vorgabe"},
        {"value": "al", "title": "Ackerland (AL)"},
        {"value": "gl", "title": "Grünland (GL)"},
        {"value": "lf", "title": "Landwirtschaftlich genutzte Fläche (LF)"},
        {"value": "dk_sk", "title": "Dauer- und/oder Sonderkulturen (DK/SK)"},
        {"value": "hff", "title": "Hauptfutterfläche (HFF)"},
        {"value": "biotop_le", "title": "Landschaftselement/Biotop o.Ä."},
        {"value": "wald", "title": "Wald/Forst"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_ziel_einh",
      "title": "Zieleinheit",
      "choices": [
        {"value": "o", "title": "keine Angabe/Vorgabe"},
        {"value": "m3", "title": "m³ (z.B. Gülle)"},
        {"value": "pieces", "title": "Kopf/Stück (z.B. Tiere oder Bäume)"},
        {"value": "gve", "title": "Großvieheinheiten (GV/GVE)"},
        {
          "value": "rgve",
          "title": "Raufutter fressende Großvieheinheiten (RGV)"
        },
        {"value": "ha", "title": "Hektar (ha)"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_ziel_haupt",
      "title": "Zielsetzung Land",
      "choices": [
        {"value": "o", "title": "keine Angabe/Vorgabe"},
        {"value": "bsch", "title": "Bodenschutz"},
        {"value": "wsch", "title": "Gewässerschutz"},
        {"value": "asch", "title": "Spezieller Artenschutz"},
        {"value": "biodiv", "title": "Biodiversität"},
        {"value": "strutktviel", "title": "Erhöhung der Strukturvielfalt"},
        {
          "value": "genet_res",
          "title":
              "Erhaltung genetischer Ressourcen (Pflanzen, z. B. im Grünland, und Tiere, z. B. bedrohte Rassen)"
        },
        {
          "value": "tsch",
          "title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb"
        },
        {"value": "klima", "title": "Klima"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "gl_typ",
      "title": "Grünlandtyp",
      "choices": [
        {"value": "o", "title": "keine Angabe"},
        {"value": "wiese", "title": "Wiese"},
        {"value": "weide", "title": "Weide"},
        {
          "value": "wiese_weide",
          "title":
              "Wiese/Weide (Maßnahmenbeschreibung beinhaltet beide Optionen)"
        },
        {"value": "strob", "title": "Streuobst/-wiese/-bestand"},
        {"value": "heide", "title": "Heide"},
        {"value": "alm", "title": "Alm"},
        {"value": "hutu", "title": "Hutung"},
        {"value": "fgl", "title": "Feuchtgrünland"},
        {"value": "mras", "title": "Magerrasen"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "gl_bw_vg",
      "title": "Grünlandbewirtschaftung",
      "choices": [
        {"value": "o", "title": "keine Angabe"},
        {
          "value": "einschuer_o_weide",
          "title": "einschürige Wiese (keine Beweidung)"
        },
        {
          "value": "einschuer_m_weide",
          "title": "einschürige Wiese  mit darauf folgender obligater Beweidung"
        },
        {"value": "o_erneuerg", "title": "keine Grünland-Erneuerung"},
        {"value": "o_walzen", "title": "kein Walzen"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "sh_art",
      "title": "Strukturart",
      "choices": [
        {"value": "o", "title": "keine Struktur"},
        {"value": "hecke", "title": "Gehölz/Hecke"},
        {
          "value": "saum",
          "title": "Blühfläche/-streifen/Brache und andere Saumstrukturen"
        },
        {"value": "graben", "title": "Graben"},
        {"value": "vernaessg", "title": "Vernässung"},
        {
          "value": "schutz_streif",
          "title": "Gewässerschutzstreifen (incl. Erosionsschutzstreifen)"
        },
        {"value": "biotop", "title": "Biotop"},
        {"value": "strobst", "title": "Streuobst/-wiese/-bestand"},
        {"value": "stein", "title": "Steinmauer, Lesesteinhaufen"},
        {"value": "biotop_bes", "title": "Trockenrasen, Heide etc."},
        {
          "value": "le_undef",
          "title":
              "Strukturelemente nicht definiert (z. B. \"naturnahe Strukturelemente\" oder mehrere, unterschiedliche Elemente inbegriffen)\""
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "sh_pflg_art",
      "title": "Pflegeart",
      "choices": [
        {
          "value": "verpfl_neuanl_begin",
          "title": "Neuanlage zu Beginn der Verpflichtung"
        },
        {"value": "verpfl_pflege", "title": "Pflege im Verpflichtungszeitraum"},
        {
          "value": "verpfl_neuanl_regelm",
          "title":
              "regelmäßige Neuanlage im Verpflichtungszeitraum (z.B. überjährige Blühstreifen)"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "sh_pflg_haeuf",
      "title": "Pflege-Häufigkeit",
      "choices": [
        {"value": "o", "title": "keine Pflege"},
        {
          "value": "pflege_einmal",
          "title": "einmalige Pflege bestehender Strukturen"
        },
        {
          "value": "pflege_ann",
          "title": "jährliche Pflege bestehender Strukturen"
        },
        {
          "value": "staffelg_t_ao",
          "title": "zeitlich und räumliche Staffelung"
        },
        {"value": "undef", "title": "Pflegerhytmus nicht definiert"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "bw_nutz_ausschl",
      "title": "Nutzungsausschluss",
      "choices": [
        {"value": "o", "title": "keine Angabe (kein Nutzungsausschluss)"},
        {
          "value": "o_abfuhr",
          "title": "Nutzung ist ausgeschlossen, keine Ernteabfuhr"
        },
        {
          "value": "abfuhr_f_biogs",
          "title": "Erntegutnutzung ausschließlich für Biogasanlagen"
        },
        {
          "value": "beweidg_af_erlaubt",
          "title":
              "ausschließlich Beweidung mit Schafen oder Ziegen auf nicht-Grünlandfläche erlaubt"
        },
        {
          "value": "schroepfen",
          "title": "ausschließlich Schröpfschnitt erlaubt"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "bw_kult",
      "title": "betroffene Frucht",
      "choices": [
        {"value": "o", "title": "keine"},
        {"value": "hfrucht", "title": "auf Hauptfrucht"},
        {"value": "nfrucht", "title": "nur auf Nebenfrucht"},
        {"value": "h_n_nfrucht", "title": "auf Haupt- und Nebenfrucht"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "bw_vieh_vg",
      "title": "Tierbestandsvorgabe",
      "choices": [
        {"value": "o", "title": "ohne"},
        {"value": "vieh_red", "title": "Reduktion des Viehbestandes"},
        {
          "value": "veraenderg_tierhaltg",
          "title":
              "Änderung der Haltungsbedingungen, z. B. Stallumbau, Einführung von Weidegang, Sommerweidehaltung, Haltung auf Stroh"
        },
        {
          "value": "bweidg_kurz",
          "title":
              "verzögerter Auftrieb/Weidebeginn oder vorgezogener Abtrieb/Weidegangende"
        },
        {
          "value": "bes_art_rasse",
          "title":
              "Gezielte Auswahl der Tierart/Rasse --> s. Spalte 'besondere Kultur- oder Tierart'"
        },
        {
          "value": "n_red_fuetterg",
          "title": "N/Stickstoff-reduzierte Fütterung von Tieren"
        },
        {
          "value": "verzicht",
          "title": "Verzicht Kupierung (Schnäbel, Hörner, Ringelschwänze etc.)"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "bbearb_vg",
      "title": "Bodenbearbeitung",
      "choices": [
        {"value": "o", "title": "keine Angabe/ohne Einschränkung"},
        {
          "value": "red_bbearb_m_technik",
          "title":
              "reduzierte Bodenbearbeitung MIT spezifischer/besonderer Bearbeitungstechnik"
        },
        {
          "value": "red_bbearb_o_technik",
          "title":
              "reduzierte Bodenbearbeitung OHNE spezifische/besondere Bearbeitungstechnik"
        },
        {"value": "o_bbearb", "title": "Verbot der Bodenbearbeitung"},
        {
          "value": "gl_erneu_flach",
          "title":
              "Grünlanderneuerung nur flachwendend / pfluglos / nicht wendend / durch vollflächiges Durchschneiden der Grasnarbe"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "dueng_vg",
      "title": "Düngung",
      "choices": [
        {"value": "o", "title": "keine Angabe / ohne Einschränkung"},
        {"value": "keine", "title": "keine Düngung"},
        {
          "value": "ausbring_techn",
          "title":
              "besondere Ausbringungstechnik (z.B. Schleppschlauch) mit weiteren Angaben in Technische Anforderungen"
        },
        {
          "value": "ausbring_t_kurz",
          "title": "verkürzte oder vorgegebene Ausbringungszeiten"
        },
        {"value": "dueng_red", "title": "reduzierte Düngungsmenge"},
        {
          "value": "dueng_spez_art",
          "title": "Beschränkung auf spezifische Düngemittel"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "dueng_art",
      "title": "Düngung Art",
      "choices": [
        {"value": "o", "title": "keine Angabe"},
        {
          "value": "dueng_org_tier_liqu",
          "title": "organisch, tierisch und flüssig: z.B. Gülle"
        },
        {
          "value": "dueng_org_tier_fest",
          "title": "organisch, tierisch, fest: Festmist"
        },
        {"value": "dueng_org_pflz", "title": "organisch, pflanzlich: Gärrest"},
        {
          "value": "dueng_org",
          "title": "Wirtschaftsdünger (organisch, nicht genauer differenziert)"
        },
        {"value": "dueng_miner", "title": "mineralisch"},
        {"value": "dueng_org_n_miner", "title": "organisch und mineralisch"},
        {
          "value": "dueng_stoff",
          "title":
              "Bestimmte Inhalts- oder Nährstoffe sind zulässig oder ausgeschlossen. Im Feld Sonstiges angeben, wie die Auflage lautet!"
        },
        {
          "value": "dueng_bu",
          "title": "Düngung auf Grundlage einer Bodenuntersuchung"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "pflz_sch",
      "title": "Pflanzenschutz",
      "choices": [
        {"value": "o", "title": "keine Angabe / ohne Einschränkung"},
        {"value": "pflz_sch_integr", "title": "integrierter Pflanzenschutz"},
        {
          "value": "pflz_sch_biol_ausbring",
          "title": "gezielte Ausbringung von Nützlingen oder Pheromonen"
        },
        {
          "value": "pflz_sch_chem_einzel",
          "title":
              "chem. Pflanzenschutz, auf Einzelpflanzenbehandlung beschränkt"
        },
        {"value": "pflz_sch_o", "title": "kein chem. Pflanzenschutz"},
        {"value": "pflz_sch_o_herbiz", "title": "Verzicht auf Herbizide"},
        {
          "value": "pflz_sch_o_wregelg",
          "title": "Verzicht auf Wachstumsregler"
        },
        {
          "value": "pflz_sch_einschraenk_option",
          "title": "optionale Einschränkung"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "tech",
      "title": "Technische Anforderungen",
      "choices": [
        {"value": "o", "title": "ohne"},
        {"value": "red_reifen_druck", "title": "Reduzierter Reifendruck"},
        {"value": "mulch_egge", "title": "Mulchen/Eggen"},
        {
          "value": "direkt_o_mulch_saat_o_pflanz",
          "title": "Direktsaat-/Mulchsaat-/Mulchpflanzverfahren"
        },
        {
          "value": "spez_maehtechn",
          "title": "Besondere Mähtechnik, z. B: Messerbalken"
        },
        {
          "value": "spez_weidetechn",
          "title": "Besondere Weidetechnik (Standweide )"
        },
        {
          "value": "vernaessg",
          "title":
              "Vernässung, zumindest temporär (Wasserstandsanhebung im Winter, Rückbau von Drainagen)"
        },
        {
          "value": "stabil_dueng",
          "title":
              "Einsatz stabilisierter Dünger (z.B. CULTAN-Verfahren, N-Depotdüngung)"
        },
        {
          "value": "flaech_spezif_dueng",
          "title":
              "standortangepasst/teilflächenspezifisch (z.B. bei Düngung oder Einsatz von Exaktstreuer)"
        },
        {
          "value": "dueng_plang",
          "title":
              "Analysen zur Düngungsplanung, z.B. Bodenuntersuchung/Frühjahres-Nmin-Analyse, Pflanzenanalysen, Wirtschaftsdünger- und Gärsubstratanalysen, Hoftorbilanzen, NIRS-Verfahren"
        },
        {
          "value": "remiss_red_ausbring_techn",
          "title":
              "Emissionsarme Ausbringungstechnik (Schleppschlauch/-Schuh etc.)"
        },
        {
          "value": "in_reihe",
          "title": "in Reihen (z.B. strip till oder Düngung in Reihen)"
        },
        {
          "value": "weite_reihe",
          "title":
              "Aussaat/Anpflazung in weiter Reihe / doppeltem Reihenabstand / mit reduzierter Saatstärke/-menge"
        },
        {"value": "enge_reihe", "title": "Aussaat/Anpflanzung mit enger Reihe"},
        {"value": "dekant", "title": "Dekanter"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "rv_kuliss_r_def",
      "title": "räumlich definierte Kulisse",
      "choices": [
        {"value": "o", "title": "ohne"},
        {
          "value": "natsch_kulissen",
          "title":
              "Naturschutzgebiete i. w. S. (NSG, SPA, FFH, Biosphärengebiete, Nationalparke, ...)"
        },
        {
          "value": "wassersch_kulissen",
          "title": "Wasserschutzgebiete (HQ20, rote Wasserkörper, …)"
        },
        {
          "value": "bsch_kulissen",
          "title":
              "Bodenschutzgebiete (Wassererosionsschutzgebiete, Winderosionsschutzgebiete, organische Böden, …)"
        },
        {"value": "ungunst", "title": "Almen / Berglagen / Ungunstlagen"},
        {
          "value": "organ_o_feucht",
          "title": "Moorstandorte / Feuchtgebiete / organische Böden"
        },
        {"value": "andere", "title": "andere räumliche Definition"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "rv_kuliss_i_def",
      "title": "inhaltlich definierte Kulisse",
      "choices": [
        {"value": "o", "title": "ohne"},
        {
          "value": "lage",
          "title": "Lage (z. B. an Gewässern, an Knicks, an Waldrändern)"
        },
        {
          "value": "kultur",
          "title":
              "Kulturen / Kulturgruppen (nach Mais, Reihenkulturen, vor Wintergetreide, ...)"
        },
        {
          "value": "habitat_o_art",
          "title":
              "Habitate / Zielarten (z.B. artenreiches Grünland, FFH-Lebensraumtypen, Ackerlebensräume, bei Vorkommen bestimmter Arten)"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "rv_kuliss_i_erl_zuw",
      "title":
          "Zuweisung für Erläuterung inhaltlich Flächendefinition \"thematische Kulisse\" ",
      "choices": [
        {"value": "ausschluss", "title": "nicht zu / nicht bei"},
        {"value": "vorab", "title": "vor"},
        {"value": "incl", "title": "zu / bei"},
        {"value": "danach", "title": "nach"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "rv_pflz_art",
      "title":
          "Pflanzenart oder der Anzahl von Arten, die angebaut/gesät werden müssen",
      "choices": [
        {"value": "o", "title": "keine/ohne"},
        {"value": "mischg_def", "title": "Blühmischung konkret vorgegeben"},
        {
          "value": "mischg_option",
          "title":
              "Blühmischung mit Optionen vorgegeben (z. B. Anzahl Arten, Artherkunft)"
        },
        {
          "value": "fruchtfolge_lt_n_is_4teil",
          "title": "<=4-gliedrige Fruchtfolge"
        },
        {
          "value": "fruchtfolge_gt_n_is_5teil",
          "title": ">=5-gliedrige Fruchtfolge"
        },
        {
          "value": "kulturen_zeitgl",
          "title":
              "vorgegebene Anzahl von Kulturen, die zeitgleich angebaut werden müssen"
        },
        {
          "value": "fruchtfolge_m_bache",
          "title": "Fruchtfolge mit Bracheanteil"
        },
        {"value": "fruchtfolge_andere", "title": "weitere/andere Fruchtfolgen"},
        {"value": "kultur_selten", "title": "seltene Kulturen"},
        {"value": "legum", "title": "Leguminosen"},
        {"value": "zf", "title": "Zwischenfrucht"},
        {"value": "us", "title": "Untersaat"},
        {"value": "gl_einsaat", "title": "Grünland/Feldgraseinsaat/-Anlage"},
        {"value": "kennart", "title": "Nachweis von Kennarten"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "rv_pflz_saat",
      "title": "Vorgaben an die Art/Mischung des Saatgutes",
      "choices": [
        {"value": "o", "title": "keine/ohne"},
        {"value": "reg_saat", "title": "Regiosaat"},
        {"value": "wild_pflz", "title": "Wildpflanzen"},
        {"value": "kult_art", "title": "Kulturarten"},
        {"value": "o_legum", "title": "ohne Leguminosen"},
        {"value": "legum_kkoern", "title": "kleinkörnige Leguminosen"},
        {
          "value": "wi_hart",
          "title":
              "winterhart (Zwischenfrucht mit Standzeit > 3 Monaten/mit spätem Umbruch/frostresistent)"
        },
        {
          "value": "wi_abfr",
          "title":
              "abfrierend (Zwischenfrucht mit Standzeit < 3 Monaten/mit frühem Umbruch/nicht-frostresistent)"
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "rv_tierart",
      "title": "Verwendung einer bestimmten Tierart",
      "choices": [
        {"value": "o", "title": "keine/ohne"},
        {"value": "schaf", "title": "Schafe"},
        {"value": "ziege", "title": "Ziegen"},
        {"value": "w_bueffel", "title": "Wasserbüffel"},
        {"value": "schw", "title": "Schweine"},
        {"value": "gefl", "title": "Geflügel"},
        {"value": "rind_o_miku", "title": "Rinder ohne Milchkühe"},
        {"value": "miku", "title": "Milchkühe"},
        {"value": "pferd", "title": "Pferde"},
        {"value": "biene", "title": "Bienen"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "rv_ausschl_basis",
      "title": "Ausschluss von:",
      "choices": [
        {"value": "o", "title": "keine/ohne"},
        {
          "value": "silage",
          "title": "Silage (Maßnahme z.B. Silageverzicht im gesamten Betrieb)"
        },
        {"value": "umbruch_herbst", "title": "Herbstumbruch"},
        {"value": "bereg", "title": "Beregnung"},
        {"value": "entwaess", "title": "Entwässerung, Drainage"},
        {
          "value": "meliorat",
          "title": "Melioration (jegliche Be- und Entwässerung der Fläche)"
        },
        {
          "value": "kultur",
          "title": "Kulturen/Kulturgruppen/Kulturmischungen",
          "subQuestions": [
            {
              "type": "MultipleChoiceQuestion",
              "id": "rv_ausschl_konkr",
              "title": "Ausschluss - Konkretisierung",
              "choices": [
                {"value": "o", "title": "keine/ohne"},
                {"value": "ausschluss", "title": "alle ausgeschlossen"},
                {"value": "raps", "title": "Raps"},
                {"value": "mais", "title": "Mais"},
                {"value": "kart", "title": "Kartoffeln"},
                {"value": "wwei", "title": "Winterweizen"},
                {
                  "value": "legum_allg",
                  "title": "Leguminosen (allgemein/alle)"
                },
                {"value": "legum_gkoern", "title": "großkörnige Leguminosen"},
                {"value": "skul", "title": "Sonderkulturen"},
                {"value": "gem", "title": "Gemüse"},
                {"value": "contact", "title": "bitte um Unterstützung"}
              ]
            }
          ]
        },
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "mch_ziel_neben",
      "title": "Zielsetzung Land",
      "choices": [
        {"value": "o", "title": "keine Angabe/Vorgabe"},
        {"value": "bsch", "title": "Bodenschutz"},
        {"value": "wsch", "title": "Gewässerschutz"},
        {"value": "asch", "title": "Spezieller Artenschutz"},
        {"value": "biodiv", "title": "Biodiversität"},
        {"value": "strutktviel", "title": "Erhöhung der Strukturvielfalt"},
        {
          "value": "genet_res",
          "title":
              "Erhaltung genetischer Ressourcen (Pflanzen, z. B. im Grünland, und Tiere, z. B. bedrohte Rassen)"
        },
        {
          "value": "tsch",
          "title": "Tierschutz/Maßnahmen zum Tierwohl im Betrieb"
        },
        {"value": "klima", "title": "Klima"},
        {"value": "contact", "title": "bitte um Unterstützung"}
      ]
    },
    {
      "type": "MultipleChoiceQuestion",
      "id": "vorgabe-art-mischung-saatgut",
      "title": "Vorgabe an die Art/Mischung des Saatgutes",
      "choices": [
        {
          "value": "keine-Vorgabe",
          "title": "keine Vorgabe",
          "subQuestions": []
        },
        {
          "value": "vorgeschr-anzahl-zeitgleich-kulturen",
          "title":
              "vorgeschriebene Anzahl von Arten/Kulturen, die zeitgleich angebaut werden sollen, Anzahl nachzuweisender Kennarten",
          "subQuestions": []
        },
        {
          "value": "vorg-kulturen",
          "title": "Vorgaben zu Kulturen (welche, wie viel wird konkretisiert)",
          "subQuestions": [
            {
              "type": "MultipleChoiceQuestion",
              "choices": [
                {"value": "getreide", "title": "Getreide", "subQuestions": []},
                {
                  "value": "legum",
                  "title": "Leguminosen (alle, auch in Gemengen)",
                  "subQuestions": []
                },
                {
                  "value": "kleinkörn-legum",
                  "title": "kleinkörnige Leguminosen (auch in Gemengen)",
                  "subQuestions": []
                },
                {
                  "value": "großkörn-legum",
                  "title": "großkörnige Leguminosen (auch in Gemengen)",
                  "subQuestions": []
                },
                {
                  "value": "blüh-arten",
                  "title": "blühende Arten",
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
                      "Auswahlliste möglicher Arten/Kulturen (Referenzliste)",
                  "subQuestions": []
                },
                {"value": "brache", "title": "Brache", "subQuestions": []},
                {
                  "value": "sommerkulturen",
                  "title": "Sommerkulturen",
                  "subQuestions": []
                },
                {
                  "value": "seltene-kulturen",
                  "title": "seltene Kulturen",
                  "subQuestions": []
                },
                {
                  "value": "grünland-feld-ackergras-gräser",
                  "title": "Grünland, Feld- oder Ackergras, Gräser",
                  "subQuestions": []
                },
                {
                  "value": "hackfrüchte",
                  "title": "Hackfrüchte",
                  "subQuestions": []
                },
                {"value": "gemüse", "title": "Gemüse", "subQuestions": []},
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
                  "title": "beliebige Kulturarten",
                  "subQuestions": []
                },
                {
                  "value": "mischung-ohne-legum",
                  "title": "Mischung ohne Leguminosen",
                  "subQuestions": []
                },
                {"value": "mais", "title": "Mais", "subQuestions": []},
                {"value": "sonstige", "title": "Sonstige", "subQuestions": []}
              ],
              "id": "vorg-sorten-kulturen",
              "title": "Welche Sorten/Kulturen sind vorgegeben?"
            }
          ]
        },
        {
          "value": "untersaat",
          "title": "Untersaat",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
          ]
        },
        {
          "value": "zwischenfrüchte",
          "title": "Zwischenfrüchte",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
          ]
        },
        {
          "value": "blühmischung",
          "title": "Blühmischung",
          "subQuestions": [
            {"type": "ReuseSurveyEntry", "reuseId": "vorg-sorten-kulturen"}
          ]
        }
      ]
    }
  ]
};
