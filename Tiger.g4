grammar Tiger;

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
  : ID id_list_tail
  ;
id_list_tail
  : 
  | ',' ID id_list_tail
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
  : stat stat_seq_tail
  ;
stat_seq_tail
  : 
  | stat stat_seq_tail
  ;

stat 
  : ID stat_id
  | 'if' expr 'then' stat_seq stat_if
  | 'while' expr 'do' stat_seq 'enddo' ';' 
  | 'for' ID ':=' expr 'to' expr 'do' stat_seq 'enddo' ';'
  | 'break' ';' 
  | 'return' expr ';' 
  | 'let' declaration_segment 'in' stat_seq 'end' 
  ;

stat_if
  : 'endif' ';' 
  | 'else' stat_seq 'endif' ';' 
  ;

stat_id
  : ':=' stat_id_coloneq
  | '[' expr ']' ':=' stat_id_coloneq
  | '(' expr_list ')' ';' 
  ;

stat_id_coloneq
  : const expr_prime ';'
  | ID stat_id_coloneq_id
  | '(' expr ')' expr_prime ';'
  ;

stat_id_coloneq_id
  : expr_id ';'
  | '(' expr_list ')' ';' 
  ;

expr
  : const expr_prime
  | ID expr_id
  | '(' expr ')' expr_prime
  ;

expr_id
  : expr_prime
  | '[' expr ']' expr_prime
  ;

expr_prime
  : 
  | binary_operator expr // expr_prime
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

