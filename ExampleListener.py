# Generated from Example.g4 by ANTLR 4.9.3
from antlr4 import *
if __name__ is not None and "." in __name__:
    from .ExampleParser import ExampleParser
else:
    from ExampleParser import ExampleParser

# This class defines a complete listener for a parse tree produced by ExampleParser.
class ExampleListener(ParseTreeListener):

    # Enter a parse tree produced by ExampleParser#tiger_program.
    def enterTiger_program(self, ctx:ExampleParser.Tiger_programContext):
        pass

    # Exit a parse tree produced by ExampleParser#tiger_program.
    def exitTiger_program(self, ctx:ExampleParser.Tiger_programContext):
        pass


    # Enter a parse tree produced by ExampleParser#declaration_segment.
    def enterDeclaration_segment(self, ctx:ExampleParser.Declaration_segmentContext):
        pass

    # Exit a parse tree produced by ExampleParser#declaration_segment.
    def exitDeclaration_segment(self, ctx:ExampleParser.Declaration_segmentContext):
        pass


    # Enter a parse tree produced by ExampleParser#var_declaration_list.
    def enterVar_declaration_list(self, ctx:ExampleParser.Var_declaration_listContext):
        pass

    # Exit a parse tree produced by ExampleParser#var_declaration_list.
    def exitVar_declaration_list(self, ctx:ExampleParser.Var_declaration_listContext):
        pass


    # Enter a parse tree produced by ExampleParser#var_declaration.
    def enterVar_declaration(self, ctx:ExampleParser.Var_declarationContext):
        pass

    # Exit a parse tree produced by ExampleParser#var_declaration.
    def exitVar_declaration(self, ctx:ExampleParser.Var_declarationContext):
        pass


    # Enter a parse tree produced by ExampleParser#funct_declaration_list.
    def enterFunct_declaration_list(self, ctx:ExampleParser.Funct_declaration_listContext):
        pass

    # Exit a parse tree produced by ExampleParser#funct_declaration_list.
    def exitFunct_declaration_list(self, ctx:ExampleParser.Funct_declaration_listContext):
        pass


    # Enter a parse tree produced by ExampleParser#funct_declaration.
    def enterFunct_declaration(self, ctx:ExampleParser.Funct_declarationContext):
        pass

    # Exit a parse tree produced by ExampleParser#funct_declaration.
    def exitFunct_declaration(self, ctx:ExampleParser.Funct_declarationContext):
        pass


    # Enter a parse tree produced by ExampleParser#type_.
    def enterType_(self, ctx:ExampleParser.Type_Context):
        pass

    # Exit a parse tree produced by ExampleParser#type_.
    def exitType_(self, ctx:ExampleParser.Type_Context):
        pass


    # Enter a parse tree produced by ExampleParser#type_id.
    def enterType_id(self, ctx:ExampleParser.Type_idContext):
        pass

    # Exit a parse tree produced by ExampleParser#type_id.
    def exitType_id(self, ctx:ExampleParser.Type_idContext):
        pass


    # Enter a parse tree produced by ExampleParser#id_list.
    def enterId_list(self, ctx:ExampleParser.Id_listContext):
        pass

    # Exit a parse tree produced by ExampleParser#id_list.
    def exitId_list(self, ctx:ExampleParser.Id_listContext):
        pass


    # Enter a parse tree produced by ExampleParser#optional_init.
    def enterOptional_init(self, ctx:ExampleParser.Optional_initContext):
        pass

    # Exit a parse tree produced by ExampleParser#optional_init.
    def exitOptional_init(self, ctx:ExampleParser.Optional_initContext):
        pass


    # Enter a parse tree produced by ExampleParser#param_list.
    def enterParam_list(self, ctx:ExampleParser.Param_listContext):
        pass

    # Exit a parse tree produced by ExampleParser#param_list.
    def exitParam_list(self, ctx:ExampleParser.Param_listContext):
        pass


    # Enter a parse tree produced by ExampleParser#param_list_tail.
    def enterParam_list_tail(self, ctx:ExampleParser.Param_list_tailContext):
        pass

    # Exit a parse tree produced by ExampleParser#param_list_tail.
    def exitParam_list_tail(self, ctx:ExampleParser.Param_list_tailContext):
        pass


    # Enter a parse tree produced by ExampleParser#ret_type.
    def enterRet_type(self, ctx:ExampleParser.Ret_typeContext):
        pass

    # Exit a parse tree produced by ExampleParser#ret_type.
    def exitRet_type(self, ctx:ExampleParser.Ret_typeContext):
        pass


    # Enter a parse tree produced by ExampleParser#param.
    def enterParam(self, ctx:ExampleParser.ParamContext):
        pass

    # Exit a parse tree produced by ExampleParser#param.
    def exitParam(self, ctx:ExampleParser.ParamContext):
        pass


    # Enter a parse tree produced by ExampleParser#stat_seq.
    def enterStat_seq(self, ctx:ExampleParser.Stat_seqContext):
        pass

    # Exit a parse tree produced by ExampleParser#stat_seq.
    def exitStat_seq(self, ctx:ExampleParser.Stat_seqContext):
        pass


    # Enter a parse tree produced by ExampleParser#stat.
    def enterStat(self, ctx:ExampleParser.StatContext):
        pass

    # Exit a parse tree produced by ExampleParser#stat.
    def exitStat(self, ctx:ExampleParser.StatContext):
        pass


    # Enter a parse tree produced by ExampleParser#opt_prefix.
    def enterOpt_prefix(self, ctx:ExampleParser.Opt_prefixContext):
        pass

    # Exit a parse tree produced by ExampleParser#opt_prefix.
    def exitOpt_prefix(self, ctx:ExampleParser.Opt_prefixContext):
        pass


    # Enter a parse tree produced by ExampleParser#expr.
    def enterExpr(self, ctx:ExampleParser.ExprContext):
        pass

    # Exit a parse tree produced by ExampleParser#expr.
    def exitExpr(self, ctx:ExampleParser.ExprContext):
        pass


    # Enter a parse tree produced by ExampleParser#const.
    def enterConst(self, ctx:ExampleParser.ConstContext):
        pass

    # Exit a parse tree produced by ExampleParser#const.
    def exitConst(self, ctx:ExampleParser.ConstContext):
        pass


    # Enter a parse tree produced by ExampleParser#binary_operator.
    def enterBinary_operator(self, ctx:ExampleParser.Binary_operatorContext):
        pass

    # Exit a parse tree produced by ExampleParser#binary_operator.
    def exitBinary_operator(self, ctx:ExampleParser.Binary_operatorContext):
        pass


    # Enter a parse tree produced by ExampleParser#expr_list.
    def enterExpr_list(self, ctx:ExampleParser.Expr_listContext):
        pass

    # Exit a parse tree produced by ExampleParser#expr_list.
    def exitExpr_list(self, ctx:ExampleParser.Expr_listContext):
        pass


    # Enter a parse tree produced by ExampleParser#expr_list_tail.
    def enterExpr_list_tail(self, ctx:ExampleParser.Expr_list_tailContext):
        pass

    # Exit a parse tree produced by ExampleParser#expr_list_tail.
    def exitExpr_list_tail(self, ctx:ExampleParser.Expr_list_tailContext):
        pass


    # Enter a parse tree produced by ExampleParser#lvalue.
    def enterLvalue(self, ctx:ExampleParser.LvalueContext):
        pass

    # Exit a parse tree produced by ExampleParser#lvalue.
    def exitLvalue(self, ctx:ExampleParser.LvalueContext):
        pass


    # Enter a parse tree produced by ExampleParser#lvalue_tail.
    def enterLvalue_tail(self, ctx:ExampleParser.Lvalue_tailContext):
        pass

    # Exit a parse tree produced by ExampleParser#lvalue_tail.
    def exitLvalue_tail(self, ctx:ExampleParser.Lvalue_tailContext):
        pass



del ExampleParser