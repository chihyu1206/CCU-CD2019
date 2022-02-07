grammar myparser;

options {
  language = Java;
  backtrack = true;
}
@header {
  //import header
}
@members {
  boolean TRACEON = true;
}
function: type MAIN '('')' '{'declarations statements'}' 
            {if (TRACEON) System.out.println("function: type main ( ) {declarations statements}");}
        ;
declarations: type ID SEMICOLON declarations 
                {if (TRACEON) System.out.println("declarations: type ID ; declarations");}
            | {if (TRACEON) System.out.println("declarations: ");}
            ;
type: INT {if (TRACEON) System.out.println("type: int");}
    | VOID {if (TRACEON) System.out.println("type: void");}
		| FLOAT {if (TRACEON) System.out.println("type: float");}
		| DOUBLE {if (TRACEON) System.out.println("type: double");}
		;
statements: statement statements
              {if (TRACEON) System.out.println("statements: statement statements");}
          | PRINT'(''"' statement '"' ',' statement ')'SEMICOLON
              {if (TRACEON) System.out.println("statements: printf(const char*, var1)");}
          ;
addition_expression: multi_expression 
                     (ADD multi_expression
                     |MINUS multi_expression
                     )*
                   ;
multi_expression: sign_expression 
                  ( MULTI sign_expression 
                  | DIV sign_expression
                  )*
                ;
sign_expression: basic_expression 
               | MINUS basic_expression
               ;
basic_expression: Float
                | Int
                | ID
                | '(' addition_expression ')'
                |format_expression
                ;
format_expression: IntFormat
                 | FloatFormat
                 | CharFormat
                 ;
conditional_expression: basic_expression logical_operation basic_expression
                      | ID
                      ;
logical_operation: '>'
                 | '<'
                 | '>='
                 | '<='
                 | '||'
                 | '&&'
                 | '=='
                 | '|'
                 | '&'
                 ;
statement: ID ASSIGN addition_expression SEMICOLON
         | selection_statement
         | iteration_statement
         | conditional_expression
         ;
selection_statement: IF '(' conditional_expression ')' statement (ELSE statement)? 
                      {if (TRACEON) System.out.println("selection_statement: if then else");}
                   ;
iteration_statement: WHILE '(' conditional_expression ')' statements
                       {if (TRACEON) System.out.println("iteration_statement: while loop");}                 
                   ;

// TOKENS
MAIN: 'main';
INT: 'int';
VOID: 'void';
FLOAT: 'float';
DOUBLE: 'double';
CHAR: 'char';
IntFormat: '%d';
CharFormat: '%c';
FloatFormat: '%f';
WHILE: 'while';
IF: 'if';
ELSE: 'else';
ASSIGN: '=';
ADD: '+';
MINUS: '-';
MULTI: '*';
DIV: '/';
SEMICOLON: ';';
PRINT: 'printf';
ID:('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*;
Int: '0'..'9'+;
Float: INT'.'INT;
WS: (' '|'\t'|'\r'|'\n') {$channel = HIDDEN;};  
