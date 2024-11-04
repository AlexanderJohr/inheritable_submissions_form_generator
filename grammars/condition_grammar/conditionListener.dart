// Generated from .\condition.g4 by ANTLR 4.11.1
// ignore_for_file: unused_import, unused_local_variable, prefer_single_quotes
import 'package:antlr4/antlr4.dart';

import 'conditionParser.dart';

/// This abstract class defines a complete listener for a parse tree produced by
/// [conditionParser].
abstract class conditionListener extends ParseTreeListener {
  /// Enter a parse tree produced by [conditionParser.prog].
  /// [ctx] the parse tree
  void enterProg(ProgContext ctx);
  /// Exit a parse tree produced by [conditionParser.prog].
  /// [ctx] the parse tree
  void exitProg(ProgContext ctx);

  /// Enter a parse tree produced by [conditionParser.expr].
  /// [ctx] the parse tree
  void enterExpr(ExprContext ctx);
  /// Exit a parse tree produced by [conditionParser.expr].
  /// [ctx] the parse tree
  void exitExpr(ExprContext ctx);
}