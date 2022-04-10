module TigerGrammar (tigerGrammar) where

import Production

tiger_program          = Nt "tiger_program"
declaration_segment    = Nt "declaration_segment"
var_declaration_list   = Nt "var_declaration_list"
var_declaration        = Nt "var_declaration"
funct_declaration_list = Nt "funct_declaration_list"
funct_declaration      = Nt "funct_declaration"
type_                  = Nt "type_"
type_id                = Nt "type_id"
id_list                = Nt "id_list"
optional_init          = Nt "optional_init"
param_list             = Nt "param_list"
param_list_tail        = Nt "param_list_tail"
ret_type               = Nt "ret_type"
param                  = Nt "param"
stat_seq               = Nt "stat_seq"
stat                   = Nt "stat"
opt_prefix             = Nt "opt_prefix"
expr                   = Nt "expr"
const_nt               = Nt "const"
binary_operator        = Nt "binary_operator"
expr_list              = Nt "expr_list"
expr_list_tail         = Nt "expr_list_tail"
lvalue                 = Nt "lvalue"
lvalue_tail            = Nt "lvalue_tail"

main'                  = T "main"
let'                   = T "let"
in'                    = T "in"
begin'                 = T "begin"
end'                   = T "end"
var'                   = T "var"
int'                   = T "int"
float'                 = T "float"
id'                    = T "ID"
of'                    = T "of"
break'                 = T "break"
return'                = T "return"
intlit'                = T "INTLIT"
floatlit'              = T "FLOATLIT"
function'              = T "function"
array'                 = T "array"
enddo'                 = T "enddo"
do'                    = T "do"
to'                    = T "to"
for'                   = T "for"
while'                 = T "while"
endif'                 = T "endif"
else'                  = T "else"
then'                  = T "then"
if'                    = T "then"

tigerGrammar :: Grammar
tigerGrammar =
  [ tiger_program
      =: rule main' # let' # declaration_segment # declaration_segment
        # in' # begin' # stat_seq # end'
      ## end_production

  , declaration_segment
      =: rule var_declaration_list # funct_declaration_list
      ## end_production

  , var_declaration_list
      =: rule Epsilon
      |. rule var_declaration # var_declaration_list
      ## end_production

  , var_declaration
      =: rule var' # id_list # T ":" # type_ # optional_init # T ";"
      ## end_production
 
  , funct_declaration_list
      =: rule Epsilon
      |. rule funct_declaration # funct_declaration_list
      ## end_production

  , funct_declaration
      =: rule function' # id' # T "(" # param_list  # T ")" #
          ret_type # begin' # stat_seq # end'
      ## end_production

  , type_
      =: rule type_id
      |. rule array' # T "[" # intlit' # T "]" # of' # type_id
      ## end_production

  , type_id 
      =: rule int' 
      |. rule float'
      ## end_production

  , id_list 
      =: rule id'
      |. rule id' # T "," # id_list
      ## end_production

  , optional_init 
      =: rule (T ":=") # const_nt
      ## end_production

  , param_list 
      =: rule Epsilon
      |. rule param # param_list_tail
      ## end_production

  , param_list_tail 
      =: rule Epsilon
      |. rule (T ",") # param # param_list_tail
      ## end_production

  , ret_type 
      =: rule Epsilon
      |. rule (T ":") # type_
      ## end_production

  , param 
      =: rule id' # (T ":") # type_
      ## end_production

  , stat_seq 
      =: rule stat
      |. rule stat # stat_seq
      ## end_production

  , stat
      =: rule lvalue # T ":=" # expr # T ";"
      |. rule if' # expr # then' # stat_seq # endif' # T ";"
      |. rule if' # expr # then' # stat_seq # else' # stat_seq # endif' # T ";"
      |. rule while' # expr # do' # stat_seq # enddo' # T ";"
      |. rule for' # id' # T ":=" # expr # to' # expr # do' # stat_seq # enddo' # T ";"
      |. rule opt_prefix # id' # T "(" # expr_list # T ")" # T ";"
      |. rule break' # T ";"
      |. rule return' # expr # T ";"
      |. rule let' # declaration_segment # in' # stat_seq # end' 
      ## end_production

  , opt_prefix
      =: rule Epsilon
      |. rule lvalue # T ":="
      ## end_production

  , expr
      =: rule const_nt
      |. rule lvalue 
      |. rule expr # binary_operator # expr 
      |. rule (T "(") # expr # T ")"
      ## end_production

  , const_nt
      =: rule intlit'
      |. rule floatlit'
      ## end_production

  , binary_operator
      =: rule (T "+")
      |. rule (T "-")
      |. rule (T "*")
      |. rule (T "/")
      |. rule (T "=")
      |. rule (T "<>")
      |. rule (T "<")
      |. rule (T ">")
      |. rule (T "<=")
      |. rule (T ">=")
      |. rule (T "&")
      |. rule (T "|")
      ## end_production

  , expr_list
      =: rule Epsilon
      |. rule expr # expr_list_tail
      ## end_production

  , expr_list_tail
      =: rule Epsilon
      |. rule (T ",") # expr # expr_list_tail
      ## end_production

  , lvalue
      =: rule id' # lvalue_tail
      ## end_production

  , lvalue_tail
      =: rule Epsilon
      |. rule (T "[") # expr # T "]"
      ## end_production
  ]
