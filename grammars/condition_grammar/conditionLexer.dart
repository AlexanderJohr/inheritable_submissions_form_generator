// Generated from .\condition.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';


class conditionLexer extends Lexer {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.11.1', RuntimeMetaData.VERSION);

  static final List<DFA> _decisionToDFA = List.generate(
        _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int
    TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, TOKEN_T__4 = 5, 
    TOKEN_T__5 = 6, TOKEN_NEWLINE = 7, TOKEN_INT = 8;
  @override
  final List<String> channelNames = [
    'DEFAULT_TOKEN_CHANNEL', 'HIDDEN'
  ];

  @override
  final List<String> modeNames = [
    'DEFAULT_MODE'
  ];

  @override
  final List<String> ruleNames = [
    'T__0', 'T__1', 'T__2', 'T__3', 'T__4', 'T__5', 'NEWLINE', 'INT'
  ];

  static final List<String?> _LITERAL_NAMES = [
      null, "'*'", "'/'", "'+'", "'-'", "'('", "')'"
  ];
  static final List<String?> _SYMBOLIC_NAMES = [
      null, null, null, null, null, null, null, "NEWLINE", "INT"
  ];
  static final Vocabulary VOCABULARY = VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

  @override
  Vocabulary get vocabulary {
    return VOCABULARY;
  }


  conditionLexer(CharStream input) : super(input) {
    interpreter = LexerATNSimulator(_ATN, _decisionToDFA, _sharedContextCache, recog: this);
  }

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  String get grammarFileName => 'condition.g4';

  @override
  ATN getATN() { return _ATN; }

  static const List<int> _serializedATN = [
      4,0,8,41,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,
      7,6,2,7,7,7,1,0,1,0,1,1,1,1,1,2,1,2,1,3,1,3,1,4,1,4,1,5,1,5,1,6,4,
      6,31,8,6,11,6,12,6,32,1,6,1,6,1,7,4,7,38,8,7,11,7,12,7,39,0,0,8,1,
      1,3,2,5,3,7,4,9,5,11,6,13,7,15,8,1,0,2,2,0,10,10,13,13,1,0,48,57,42,
      0,1,1,0,0,0,0,3,1,0,0,0,0,5,1,0,0,0,0,7,1,0,0,0,0,9,1,0,0,0,0,11,1,
      0,0,0,0,13,1,0,0,0,0,15,1,0,0,0,1,17,1,0,0,0,3,19,1,0,0,0,5,21,1,0,
      0,0,7,23,1,0,0,0,9,25,1,0,0,0,11,27,1,0,0,0,13,30,1,0,0,0,15,37,1,
      0,0,0,17,18,5,42,0,0,18,2,1,0,0,0,19,20,5,47,0,0,20,4,1,0,0,0,21,22,
      5,43,0,0,22,6,1,0,0,0,23,24,5,45,0,0,24,8,1,0,0,0,25,26,5,40,0,0,26,
      10,1,0,0,0,27,28,5,41,0,0,28,12,1,0,0,0,29,31,7,0,0,0,30,29,1,0,0,
      0,31,32,1,0,0,0,32,30,1,0,0,0,32,33,1,0,0,0,33,34,1,0,0,0,34,35,6,
      6,0,0,35,14,1,0,0,0,36,38,7,1,0,0,37,36,1,0,0,0,38,39,1,0,0,0,39,37,
      1,0,0,0,39,40,1,0,0,0,40,16,1,0,0,0,3,0,32,39,1,6,0,0
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}