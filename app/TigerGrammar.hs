module TigerGrammar where

import Production

"tiger_program"
  := T "main" T "let" declaration_segment T "in" T "begin" stat_seq T "end"
  ;
"declaration_segment"
  := var_declaration_list funct_declaration_list
  ;
"var_declaration_list"
  := /*empty*/ 
  | var_declaration var_declaration_list
  ;
"var_declaration"
  := T "var" id_list T ":" type_ optional_init T ";"
  ;
"funct_declaration_list"
  := /*empty*/ 
  | funct_declaration funct_declaration_list
  ;
"funct_declaration"
  := T "function" ID T "(" param_list T ")" ret_type T "begin" stat_seq T "end"
  ;
"type_"
  := type_id 
  | T "array" T "[" INTLIT T "]" T "of" type_id
  ;
"type_id"
  := T "int" 
  | T "float"
  ;
"id_list"
  := ID 
  | ID T "," id_list
  ;
"optional_init"
  := /*empty*/ 
  | T ":=" const
  ;
"param_list"
  := /*empty*/ 
  | param param_list_tail
  ;
"param_list_tail"
  := /*empty*/ 
  | T "," param param_list_tail
  ;
"ret_type"
  := /*empty*/ 
  | T ":" type_
  ;
"param"
  := ID T ":" type_
  ;
"stat_seq"
  := stat 
  | stat stat_seq
  ;

"stat"
  := lvalue T ":=" expr T ";" 
  | T "if" expr T "then" stat_seq T "endif" T ";" 
  | T "if" expr T "then" stat_seq T "else" stat_seq T "endif" T ";" 
  | T "while" expr T "do" stat_seq T "enddo" T ";" 
  | T "for" ID T ":=" expr T "to" expr T "do" stat_seq T "enddo" T ";"
  | opt_prefix ID T "(" expr_list T ")" T ";" 
  | T "break" T ";" 
  | T "return" expr T ";" 
  | T "let" declaration_segment T "in" stat_seq T "end" 
  ;

"opt_prefix"
  := /*empty*/ 
  | lvalue T ":="
  ;
"expr"
  := const 
  | lvalue 
  | expr binary_operator expr 
  | T "(" expr T ")"
  ;
"const"
  := INTLIT 
  | FLOATLIT
  ;
"binary_operator"
  := T "+"
  | T "-"
  | T "*"
  | T "/"
  | T "="
  | T "<>"
  | T "<"
  | T ">"
  | T "<="
  | T ">="
  | T "&"
  | T "|"
  ;
"expr_list"
  := /*empty*/ 
  | expr expr_list_tail
  ;
"expr_list_tail"
  := /*empty*/ 
  | T "," expr expr_list_tail
  ;
"lvalue"
  := ID lvalue_tail
  ;
"lvalue_tail"
  := /*empty*/ 
  | T "[" expr T "]"
  ;

