grammar mylexer;
options {
    backtrack=true;
    memoize=true;
    k=2;
}

declaration_specifiers
	: type_specifier
	;
type_specifier
	: 'void'
	| 'char'
	| 'int'
	| 'float'
	| 'double'
	;

declarator_suffix
  :   '[' ']'
  |   '(' identifier_list ')'
  |   '(' ')'
	;
pointer
	: '*' pointer
	| '*'
	;
identifier_list
	: IDENTIFIER (',' IDENTIFIER)*
	;
abstract_declarator_suffix
	:	'[' ']'
	|	'(' ')'
	;
// E x p r e s s i o n s


unary_expression
	: postfix_expression
	| '++' unary_expression
	| '--' unary_expression
	| 'sizeof' unary_expression
	;
postfix_expression
	:   primary_expression
        (   '(' ')'
        |   '.' IDENTIFIER
        |   '->' IDENTIFIER
        |   '++'
        |   '--'
        )*
	;
unary_operator
	: '&'
	| '*'
	| '+'
	| '-'
	| '~'
	| '!'
  | '/'
	;
primary_expression
	: IDENTIFIER
	| constant
	;
constant
    : DECIMAL_LITERAL
    ;
    
assignment_operator
	: '='
	| '*='
	| '/='
	| '%='
	| '+='
	| '-='
	| '<<='
	| '>>='
	| '&='
	| '^='
	| '|='
	;
  
// Statements
statement
  : selection_statement
	| iteration_statement
	| jump_statement
	;
selection_statement
	: 'if'
  | 'else'
	;
iteration_statement
	: 'while'
	| 'do'
	| 'for'
	;
jump_statement
	: 'continue' ';'
	| 'break' ';'
	| 'return' ';'
	;
  
IDENTIFIER
	:	LETTER (LETTER|'0'..'9')*
	;
	
fragment
LETTER
	:	'$'
	|	'A'..'Z'
	|	'a'..'z'
	|	'_'
	;

DECIMAL_LITERAL : ('0' | '1'..'9' '0'..'9'*) ;

WS  :  (' '|'\r'|'\t'|'\n') {$channel = HIDDEN;}
    ; 