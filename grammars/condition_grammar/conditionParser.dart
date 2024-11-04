// Generated from .\condition.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'conditionListener.dart';
import 'conditionBaseListener.dart';
const int RULE_prog = 0, RULE_expr = 1;
class conditionParser extends Parser {
  static final checkVersion = () => RuntimeMetaData.checkVersion('4.11.1', RuntimeMetaData.VERSION);
  static const int TOKEN_EOF = IntStream.EOF;

  static final List<DFA> _decisionToDFA = List.generate(
      _ATN.numberOfDecisions, (i) => DFA(_ATN.getDecisionState(i), i));
  static final PredictionContextCache _sharedContextCache = PredictionContextCache();
  static const int TOKEN_T__0 = 1, TOKEN_T__1 = 2, TOKEN_T__2 = 3, TOKEN_T__3 = 4, 
                   TOKEN_T__4 = 5, TOKEN_T__5 = 6, TOKEN_NEWLINE = 7, TOKEN_INT = 8;

  @override
  final List<String> ruleNames = [
    'prog', 'expr'
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

  @override
  String get grammarFileName => 'condition.g4';

  @override
  List<int> get serializedATN => _serializedATN;

  @override
  ATN getATN() {
   return _ATN;
  }

  conditionParser(TokenStream input) : super(input) {
    interpreter = ParserATNSimulator(this, _ATN, _decisionToDFA, _sharedContextCache);
  }

  ProgContext prog() {
    dynamic localctx = ProgContext(context, state);
    enterRule(localctx, 0, RULE_prog);
    try {
      enterOuterAlt(localctx, 1);
      state = 4;
      expr(0);
      state = 5;
      match(TOKEN_EOF);
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      exitRule();
    }
    return localctx;
  }

  ExprContext expr([int p = 0]) {
    final parentctx = context;
    final parentState = state;
    dynamic localctx = ExprContext(context, parentState);
    var prevctx = localctx;
    var startState = 2;
    enterRecursionRule(localctx, 2, RULE_expr, p);
    int la;
    try {
      int alt;
      enterOuterAlt(localctx, 1);
      state = 13;
      errorHandler.sync(this);
      switch (tokenStream.LA(1)!) {
      case TOKEN_INT:
        state = 8;
        match(TOKEN_INT);
        break;
      case TOKEN_T__4:
        state = 9;
        match(TOKEN_T__4);
        state = 10;
        expr(0);
        state = 11;
        match(TOKEN_T__5);
        break;
      default:
        throw NoViableAltException(this);
      }
      context!.stop = tokenStream.LT(-1);
      state = 23;
      errorHandler.sync(this);
      alt = interpreter!.adaptivePredict(tokenStream, 2, context);
      while (alt != 2 && alt != ATN.INVALID_ALT_NUMBER) {
        if (alt == 1) {
          if (parseListeners != null) triggerExitRuleEvent();
          prevctx = localctx;
          state = 21;
          errorHandler.sync(this);
          switch (interpreter!.adaptivePredict(tokenStream, 1, context)) {
          case 1:
            localctx = ExprContext(parentctx, parentState);
            pushNewRecursionContext(localctx, startState, RULE_expr);
            state = 15;
            if (!(precpred(context, 4))) {
              throw FailedPredicateException(this, "precpred(context, 4)");
            }
            state = 16;
            la = tokenStream.LA(1)!;
            if (!(la == TOKEN_T__0 || la == TOKEN_T__1)) {
            errorHandler.recoverInline(this);
            } else {
              if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
              errorHandler.reportMatch(this);
              consume();
            }
            state = 17;
            expr(5);
            break;
          case 2:
            localctx = ExprContext(parentctx, parentState);
            pushNewRecursionContext(localctx, startState, RULE_expr);
            state = 18;
            if (!(precpred(context, 3))) {
              throw FailedPredicateException(this, "precpred(context, 3)");
            }
            state = 19;
            la = tokenStream.LA(1)!;
            if (!(la == TOKEN_T__2 || la == TOKEN_T__3)) {
            errorHandler.recoverInline(this);
            } else {
              if ( tokenStream.LA(1)! == IntStream.EOF ) matchedEOF = true;
              errorHandler.reportMatch(this);
              consume();
            }
            state = 20;
            expr(4);
            break;
          } 
        }
        state = 25;
        errorHandler.sync(this);
        alt = interpreter!.adaptivePredict(tokenStream, 2, context);
      }
    } on RecognitionException catch (re) {
      localctx.exception = re;
      errorHandler.reportError(this, re);
      errorHandler.recover(this, re);
    } finally {
      unrollRecursionContexts(parentctx);
    }
    return localctx;
  }

  @override
  bool sempred(RuleContext? localctx, int ruleIndex, int predIndex) {
    switch (ruleIndex) {
    case 1:
      return _expr_sempred(localctx as ExprContext?, predIndex);
    }
    return true;
  }
  bool _expr_sempred(dynamic localctx, int predIndex) {
    switch (predIndex) {
      case 0: return precpred(context, 4);
      case 1: return precpred(context, 3);
    }
    return true;
  }

  static const List<int> _serializedATN = [
      4,1,8,27,2,0,7,0,2,1,7,1,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,3,1,14,
      8,1,1,1,1,1,1,1,1,1,1,1,1,1,5,1,22,8,1,10,1,12,1,25,9,1,1,1,0,1,2,
      2,0,2,0,2,1,0,1,2,1,0,3,4,27,0,4,1,0,0,0,2,13,1,0,0,0,4,5,3,2,1,0,
      5,6,5,0,0,1,6,1,1,0,0,0,7,8,6,1,-1,0,8,14,5,8,0,0,9,10,5,5,0,0,10,
      11,3,2,1,0,11,12,5,6,0,0,12,14,1,0,0,0,13,7,1,0,0,0,13,9,1,0,0,0,14,
      23,1,0,0,0,15,16,10,4,0,0,16,17,7,0,0,0,17,22,3,2,1,5,18,19,10,3,0,
      0,19,20,7,1,0,0,20,22,3,2,1,4,21,15,1,0,0,0,21,18,1,0,0,0,22,25,1,
      0,0,0,23,21,1,0,0,0,23,24,1,0,0,0,24,3,1,0,0,0,25,23,1,0,0,0,3,13,
      21,23
  ];

  static final ATN _ATN =
      ATNDeserializer().deserialize(_serializedATN);
}
class ProgContext extends ParserRuleContext {
  ExprContext? expr() => getRuleContext<ExprContext>(0);
  TerminalNode? EOF() => getToken(conditionParser.TOKEN_EOF, 0);
  ProgContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_prog;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is conditionListener) listener.enterProg(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is conditionListener) listener.exitProg(this);
  }
}

class ExprContext extends ParserRuleContext {
  TerminalNode? INT() => getToken(conditionParser.TOKEN_INT, 0);
  List<ExprContext> exprs() => getRuleContexts<ExprContext>();
  ExprContext? expr(int i) => getRuleContext<ExprContext>(i);
  ExprContext([ParserRuleContext? parent, int? invokingState]) : super(parent, invokingState);
  @override
  int get ruleIndex => RULE_expr;
  @override
  void enterRule(ParseTreeListener listener) {
    if (listener is conditionListener) listener.enterExpr(this);
  }
  @override
  void exitRule(ParseTreeListener listener) {
    if (listener is conditionListener) listener.exitExpr(this);
  }
}

