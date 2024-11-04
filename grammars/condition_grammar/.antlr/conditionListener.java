// Generated from c:/Users/johr/Documents/Ajohr Docs/Repos/json_to_survey/grammars/condition_grammar/condition.g4 by ANTLR 4.13.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link conditionParser}.
 */
public interface conditionListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link conditionParser#prog}.
	 * @param ctx the parse tree
	 */
	void enterProg(conditionParser.ProgContext ctx);
	/**
	 * Exit a parse tree produced by {@link conditionParser#prog}.
	 * @param ctx the parse tree
	 */
	void exitProg(conditionParser.ProgContext ctx);
	/**
	 * Enter a parse tree produced by {@link conditionParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(conditionParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link conditionParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(conditionParser.ExprContext ctx);
}