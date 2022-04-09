grammar Example;

// Define a grammar called Hello
ID : [a-zA-Z]+[a-zA-Z0-9_]* ;
INTLIT : [0-9]+ ;
FLOATLIT : [0-9]'.'[0-9]* ;
WS : [ \t\r\n]+ -> skip ;
COMMENT : '/*' .*? '*/' -> skip ;

tiger_program 
  : 'main' 'let' declaration_segment 'in' 'begin' stat_seq 'end'
  ;
declaration_segment 
  : var_declaration_list funct_declaration_list
  ;
var_declaration_list 
  : /*empty*/ 
  | var_declaration var_declaration_list
  ;
var_declaration 
  : 'var' id_list ':' type_ optional_init ';'
  ;
funct_declaration_list 
  : /*empty*/ 
  | funct_declaration funct_declaration_list
  ;
funct_declaration 
  : 'function' ID '(' param_list ')' ret_type 'begin' stat_seq 'end'
  ;
type_ 
  : type_id 
  | 'array' '[' INTLIT ']' 'of' type_id
  ;
type_id 
  : 'int' 
  | 'float'
  ;
id_list 
  : ID 
  | ID ',' id_list
  ;
optional_init 
  : /*empty*/ 
  | ':=' const
  ;
param_list 
  : /*empty*/ 
  | param param_list_tail
  ;
param_list_tail 
  : /*empty*/ 
  | ',' param param_list_tail
  ;
ret_type 
  : /*empty*/ 
  | ':' type_
  ;
param 
  : ID ':' type_
  ;
stat_seq 
  : stat 
  | stat stat_seq
  ;

stat 
  : lvalue ':=' expr ';' 
  | 'if' expr 'then' stat_seq 'endif' ';' 
  | 'if' expr 'then' stat_seq 'else' stat_seq 'endif' ';' 
  | 'while' expr 'do' stat_seq 'enddo' ';' 
  | 'for' ID ':=' expr 'to' expr 'do' stat_seq 'enddo' ';'
  | opt_prefix ID '(' expr_list ')' ';' 
  | 'break' ';' 
  | 'return' expr ';' 
  | 'let' declaration_segment 'in' stat_seq 'end' 
  ;

opt_prefix
  : /*empty*/ 
  | lvalue ':='
  ;
expr
  : const 
  | lvalue 
  | expr binary_operator expr 
  | '(' expr ')'
  ;
const
  : INTLIT 
  | FLOATLIT
  ;
binary_operator
  : '+'
  | '-'
  | '*'
  | '/'
  | '='
  | '<>'
  | '<'
  | '>'
  | '<='
  | '>='
  | '&'
  | '|'
  ;
expr_list
  : /*empty*/ 
  | expr expr_list_tail
  ;
expr_list_tail
  : /*empty*/ 
  | ',' expr expr_list_tail
  ;
lvalue
  : ID lvalue_tail
  ;
lvalue_tail
  : /*empty*/ 
  | '[' expr ']'
  ;

