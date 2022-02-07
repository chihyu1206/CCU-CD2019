grammar myInterp;

options {
   language = Java;
}

@header {
    // import packages here.
}

@members {
    boolean TRACEON = true;
}

prog: type MAIN '(' ')' '{' declarations statements'}'
        { if (TRACEON) System.out.println("type MAIN () {declarations statements}");}
    ;

declarations: type Identifier SEMICOLON declarations
              { if (TRACEON) System.out.println("declarations: type Identifier : declarations"); }
            | type Identifier arith_expression SEMICOLON declarations
            | 
			        { if (TRACEON) System.out.println("declarations: ");}
            ;

type: INT { if (TRACEON) System.out.println("type: INT"); }
    | CHAR
    | FLOAT {if (TRACEON) System.out.println("type: FLOAT"); }
	  ;

statements:statement statements
          |
          ;

statement: assign_stmt ';'
         | if_stmt
         | printf_stmt
         | scanf_stmt
         | func_no_return_stmt ';'
         ;
		 
if_stmt: if_then_stmt if_else_stmt
           {if (TRACEON) System.out.println("if_stmt");}       
       ;

	   
if_then_stmt
            : IF '(' cond_expression ')' block_stmt
            ;


if_else_stmt
            : ELSE block_stmt
            |
            ;

				  
block_stmt: '{' statements '}'
	  ;


assign_stmt: Identifier '=' arith_expression
             { if (TRACEON) System.out.println("assign_stmt: Identifier '=' arith_expression"); }
           ;
printf_stmt: PRINT '(' STRING_LITERAL (',')* argument ')' SEMICOLON
               { if (TRACEON) System.out.println("printf_stmt: PRINT '(' STRING_LITERAL (',')* argument ')' SEMICOLON");}
           ;
scanf_stmt: SCAN '(' STRING_LITERAL (',')* argument ')' SEMICOLON
             {if (TRACEON) System.out.println("scanf_stmt: SCAN '(' STRING_LITERAL (',')* argument ')' SEMICOLON"); }
          ;


data_spec: IntType
         | FloatType
         ;
func_no_return_stmt: Identifier '(' argument ')'
                     { if (TRACEON) System.out.println("func_no_return_stmt: Identifier '(' argument ')'"); }
                   ;


argument: arg (',' arg)*
          { if (TRACEON) System.out.println("argument: arg (',' arg)* "); }
        ;

arg: arith_expression
   | STRING_LITERAL
   ;
		   
cond_expression
returns [int result]
               : a=arith_expression { $result = $a.result; }
                 (RelationOP b=arith_expression { $result=$b.result; } )*
                 {System.out.println("result = " + result);}
               ;

			   
arith_expression
returns [int result]
                : a=multExpr { $result=$a.result; }
                ( '+' b=multExpr
                  {$result = $result + $b.result;}
                | '-' c=multExpr
                  {$result = $result - $c.result;}
                )*
                ;
multExpr
returns [int result]
          : a=signExpr { $result=$a.result; }
          ( '*' b=signExpr
            {$result = $result * $b.result;}
          | '/' c=signExpr
            {$result = $result / $c.result;}
          )*
          ;

signExpr
returns [int result]
        : a=primaryExpr { $result=$a.result; } 
        | '-' primaryExpr {$result = -$a.result; }
        ;
		  
primaryExpr
returns [int result] 
           : Integer_constant { $result=Integer.parseInt($Integer_constant.text); }
           | Floating_point_constant {$result = (int)Float.parseFloat($Floating_point_constant.text); }
           | Identifier { $result = 100; }
           | '&' Identifier {$result = 100; }
           | '(' arith_expression ')'
           ;

		   
/* description of the tokens */
FLOAT:'float';
INT:'int';
CHAR: 'char';

MAIN: 'main';
VOID: 'void';
IF: 'if';
ELSE: 'else';
FOR: 'for';
PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
SEMICOLON: ';';
ASSIGN: '=';
PRINT: 'printf';
SCAN: 'scanf';
IntType: '%d';
FloatType: '%f';

RelationOP: '>' |'>=' | '<' | '<=' | '==' | '!=' ;

Identifier:('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')*;
Integer_constant:'0'..'9'+;
Floating_point_constant:'0'..'9'+ '.' '0'..'9'+;

STRING_LITERAL
    :  '"' ( EscapeSequence | ~('\\'|'"') )* '"'
    ;

WS:( ' ' | '\t' | '\r' | '\n' ) {$channel=HIDDEN;};
COMMENT:'/*' .* '*/' {$channel=HIDDEN;};


fragment
EscapeSequence
    :   '\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\')
    ;