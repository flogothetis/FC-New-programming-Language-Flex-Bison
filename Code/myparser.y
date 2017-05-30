%{
  #include <stdio.h>
  #include "cgen.h"
  
  extern int yylex(void);
  extern int lineNum;
%}

%union
{
	char* str;
  int num;
}

%define parse.trace
%debug


%token  KW_TRUE
   %token  KW_FALSE
  %token KW_STATIC
 %token KW_DO
%token KW_IF
%token KW_RETURN

 %token KW_BREAK


 %token KW_INTEGER
  %token  KW_STRING
 %token KW_CONT
 %token  KW_FOR


 %token  KW_CHAR
%token   KW_VOID
%token  KW_
%token   KW_REAL
%token  KW_WHILE
%token KW_END
%token  KW_BEGIN
 %token  KW_OR
 %token <str> KW_SEMICLN
 %token COMMA
 %token  OPEN_HK
 %token CLOSE_HK


%token <str> STRINGS
  %token <str>  CHARACTER
  %token <str> IDENTIFIERS
   %token <str> INTEGERS
   %token <str> FLOATS
 %token <str> RD_STR
%token <str> RD_INT
 %token <str> RD_REAL
 %token <str> WR_STR
%token <str> WR_INT
 %token <str> WR_REAL
%token  CLN
%token KW_MAIN
/* for expresion*/
%right KW_PLUS
%right	KW_SUB
%left	KW_MUL
%left KW_DIV
%left KW_MOD
%left KW_GREATEREQUAL
%left KW_LESSEQUAL
%left KW_GREATHAN
%left KW_LESSTHAN
%left KW_INEQ
%left KW_AND
%left KW_AMPERSANT
%left KW_OR
%left KW_OROR
%right KW_NOT
%right	KW_NOTNOT
%left EQUAL
 %left KW_BOOLEAN



%start header_jobs

  %type <str> instr
%type <str> header
%type <str> header_jobs
%type <str> expr
%type <str> erotimatiko
%type <str> type
%type <str> declarations 
%type <str> list_var
%type <str> give_value
%type <str>  type_of_values
%type <str> Declare_Arrays
%type <str> functions_declaration
%type <str> function_parameters
%type  <str> external_declaration
%type <str> code
%type <str> cmd
%type <str> if_stmt
%type <str> simple_instructions
%type <str> assign_cmd
%type <str> programm
%type <str> complex_instractions
%type <str>for_stmt
%type <str> while_stmt
%type <str> ci
%type <str> do_stmt
%type <str> call_function_parameters 
%type <str> call_function 
%type <str> Declare_Arrays_expr
 

 %token  OPEN_PAR
 %token CLOSE_PAR
 %token KW_ELSE

%precedence "then"
%precedence KW_ELSE


%right UMINUS
%right UPLUS
%left  MINUS
%left  PLUS
//%right CAST
%right NOT
%left  FACTOR
%left  RELATION
//%left  LOGIC_AND
//%left  LOGIC_OR
//%left  PAR_L
%right PAR_R

%%

programm: 
 external_declaration			{ $$ = template("%s\n", $1);}
| programm external_declaration { $$ = template("%s %s\n",$1,$2);}
;




 
header : {
{ 
$$ = template("/*Flogothetis Programms*/ \n #include <stdio.h>\n#include <stdlib.h>\n#include<string.h>\nvoid writeString(char *str) { printf( \" \\n%%s \" ,str); }\n void readString(char* x){ gets(x);}\n int readInteger(){int x; scanf(\"%%d\",&x);return x;}\n float readReal(){float x;scanf(\"%%f\",&x);return x;} \n void writeInteger(int i){printf(\" \\n%%d  \",i);}\n void writeReal(float r){printf(\"\\n%%f\",r);} \n\n");}
}
;

external_declaration:
	functions_declaration	{ $$ = template("%s", $1);}
	| declarations			{ $$ = template("%s", $1);}

	;

header_jobs :  
header programm KW_MAIN OPEN_PAR CLOSE_PAR KW_BEGIN code KW_END {printf("%s %s\n int main()\n{%s\n}",$1,$2,$7);}
|header KW_MAIN OPEN_PAR CLOSE_PAR KW_BEGIN code KW_END {printf("%s\nint main()\n{%s\n}",$1,$6);}
;
/* 
main:
{
 $$ = template("\nint main()\n");}
}
;
main OPEN_PAR main_code CLOSE_PAR
{printf("%s %s {%s\n}",$1,$2,$5);}
main_code:
code { $$ = template("%s\n", $1);}
*/

functions_declaration: 
type   IDENTIFIERS OPEN_PAR function_parameters CLOSE_PAR KW_BEGIN code KW_END {$$ = template("%s %s(%s)\n{\n%s}",$1,$2,$4,$7);}
|type IDENTIFIERS OPEN_PAR CLOSE_PAR KW_BEGIN code KW_END  {$$ = template("%s %s()\n{\n%s}",$1,$2,$6);}

;


code:
instr			{ $$ = template("%s\n", $1);}
|code instr		{ $$ = template("%s %s\n",$1,$2);}
;

instr:
assign_cmd  erotimatiko { $$ = template("\n%s;",$1); } 
|erotimatiko { $$ = template(";\n"); }
|declarations   { $$ = template("%s\n",$1); } 
|KW_RETURN expr erotimatiko { $$ = template("return %s;\n",$2); } 
|KW_CONT erotimatiko	{ $$ = template("continue ;\n"); } 
|KW_BREAK erotimatiko	{ $$ = template("break;\n"); } 
|KW_BEGIN ci KW_END{ $$ = template("{\n%s}",$2); } 
|call_function erotimatiko { $$ = template("%s;\n",$1); } 
|cmd

;


cmd:
if_stmt { $$ = template("%s",$1); } 
|for_stmt { $$ = template("%s",$1); } 
|while_stmt { $$ = template("%s",$1); }
|do_stmt  { $$ = template("%s",$1); }

;

do_stmt :
KW_DO  simple_instructions KW_WHILE OPEN_PAR expr CLOSE_PAR erotimatiko 
{ $$ = template("do\n%s\nwhile(%s);",$2,$5); } 




while_stmt :
KW_WHILE OPEN_PAR expr CLOSE_PAR simple_instructions 	
{ $$ = template("while (%s)\n%s",$3,$5); } 
;

for_stmt: 
KW_FOR OPEN_PAR assign_cmd erotimatiko expr erotimatiko assign_cmd CLOSE_PAR  simple_instructions {$$ = template("for(%s;%s;%s)\n%s ", $3, $5,$7,$9);}
;

if_stmt : KW_IF OPEN_PAR expr CLOSE_PAR simple_instructions %prec "then"  {$$ = template("if (%s) \n%s\n", $3, $5);}
| KW_IF OPEN_PAR expr CLOSE_PAR simple_instructions KW_ELSE simple_instructions {$$ = template("if (%s) \n%s\n else %s", $3,$5,$7);}

;


simple_instructions : 
 cmd  	   { $$ = template("%s",$1); } 
| assign_cmd  erotimatiko { $$ = template("\n%s;",$1); } 
|erotimatiko { $$ = template(";\n"); }
|declarations   { $$ = template("%s\n",$1); } 
|KW_RETURN expr erotimatiko { $$ = template("return %s;\n",$2); } 
|KW_CONT erotimatiko	{ $$ = template("continue ;\n"); } 
|KW_BREAK erotimatiko	{ $$ = template("break;\n"); } 
|KW_BEGIN ci KW_END{ $$ = template("{\n%s}",$2); } 
|call_function erotimatiko { $$ = template("%s;\n",$1); } 


;

ci:
complex_instractions { $$ = template("%s",$1); } 
|ci complex_instractions {$$ = template("%s%s",$1,$2); }

;



complex_instractions:
cmd { $$ = template("%s\n",$1); } 
| assign_cmd  erotimatiko  { $$ = template("%s;\n",$1); } 
|KW_RETURN expr erotimatiko { $$ = template("return %s;\n",$2); } 
|erotimatiko { $$ = template(";\n"); }
|declarations   { $$ = template("%s\n",$1); } 
|KW_CONT erotimatiko	{ $$ = template("continue ;\n"); } 
|KW_BREAK erotimatiko	{ $$ = template("break;\n"); } 
|KW_BEGIN complex_instractions KW_END { $$ = template("{\n%s\n}",$2); }
|call_function erotimatiko { $$ = template("%s;\n",$1); } 
;
/*
more_assign_cmd:
assign_cmd   { $$ = template("%s",$1); } 
|more_assign_cmd erotimatiko assign_cmd { $$ = template("%s;\n%s",$1,$3); } 
|type_of_values IDENTIFIERS CLN EQUAL expr   { $$ = template("%s %s=%s",$1,$2,$5); } 
*/
;
call_function :

IDENTIFIERS OPEN_PAR call_function_parameters CLOSE_PAR  {$$ = template("%s(%s)",$1,$3);}
|IDENTIFIERS OPEN_PAR CLOSE_PAR  {$$ = template("%s()",$1);}


assign_cmd : 
IDENTIFIERS CLN EQUAL expr   { $$ = template("%s=%s",$1,$4); } 
|type_of_values IDENTIFIERS CLN EQUAL expr   { $$ = template("%s %s=%s",$1,$2,$5); } 
|IDENTIFIERS Declare_Arrays CLN EQUAL expr { $$ = template("%s%s=%s", $1,$2,$5);}

;


function_parameters:
type IDENTIFIERS { $$ = template("%s %s", $1,$2);}
|function_parameters COMMA type IDENTIFIERS  { $$ = template("%s,%s %s  ", $1,$3,$4);}
;

call_function_parameters :
expr { $$ = template("%s", $1);}
|call_function_parameters COMMA  IDENTIFIERS  { $$ = template("%s,%s ", $1,$3);}
;

/*
declarations:
type list_var erotimatiko { $$ = template("%s %s  ;\n", $1,$2);}
|KW_STATIC type list_var erotimatiko  { $$ = template("static %s %s ;\n", $2,$3); }
 |declarations KW_STATIC type list_var  erotimatiko { $$ = template("%s static  %s %s ;\n",$1,$3,$4); }
|declarations type list_var erotimatiko { $$ = template("%s %s %s ;\n", $1,$2 ,$3);};

*/

declarations:
type list_var erotimatiko { $$ = template("%s %s  ;", $1,$2);}
|KW_STATIC type list_var erotimatiko  { $$ = template("static %s %s ;", $2,$3); }

;
list_var:
IDENTIFIERS give_value  { $$ = template("%s%s", $1,$2);}
|IDENTIFIERS  { $$ = template("%s", $1);}
|list_var COMMA IDENTIFIERS give_value   { $$ = template("%s,%s%s  ", $1,$3,$4);}
|list_var COMMA IDENTIFIERS   { $$ = template("%s,%s  ", $1,$3);}
|list_var COMMA IDENTIFIERS Declare_Arrays  { $$ = template("%s,%s%s ", $1,$3,$4);}
|IDENTIFIERS Declare_Arrays { $$ = template("%s%s", $1,$2);}

;

Declare_Arrays:
OPEN_HK expr CLOSE_HK { $$ = template("[%s]", $2);}
|Declare_Arrays OPEN_HK expr CLOSE_HK { $$ = template("%s[%s]", $1,$3);}
;

Declare_Arrays_expr:
IDENTIFIERS Declare_Arrays { $$ = template("%s%s", $1,$2);}

give_value:
CLN EQUAL type_of_values { $$ = template("=%s",$3); }
;

type_of_values:
expr;

/*
INTEGERS { $$ = template("%s", $1); }
|FLOATS{ $$ = template("%s", $1); }
|STRINGS{ $$ = template("%s", $1); }
|CHARACTER{ $$ = template("%s", $1); }
|IDENTIFIERS{ $$ = template("%s", $1); }
|call_function { $$ = template("%s", $1); }
;

*/


type:
KW_INTEGER	{ $$ = template("int"); }
|KW_BOOLEAN 	{ $$ = template("int"); }
|KW_CHAR 	{ $$ = template("char"); }
|KW_REAL 	{ $$ = template("float"); }
|KW_STRING	{ $$ = template("string"); }
|KW_VOID	{ $$ = template("void"); }
;


erotimatiko:
KW_SEMICLN
;
/*
init:
expr { $$ = template("%s", $1); }
|init expr { $$ = template("%s\n%s", $1,$2); }
;
*/

expr:
INTEGERS 
|FLOATS
|STRINGS
|CHARACTER
|IDENTIFIERS
|KW_TRUE      { $$ = template("1"); }
|KW_FALSE		{ $$ = template("0"); }
|call_function
|Declare_Arrays_expr
| OPEN_PAR expr CLOSE_PAR 	%prec PAR_R	{ $$ = template("(%s)", $2); }
| expr KW_PLUS expr 	%prec PLUS				{ $$ = template("%s+%s",$1,$3); }

| KW_NOT expr           				{$$ = template("not(%s)", $2);}
| KW_NOTNOT expr   %prec UMINUS         {$$ = template("!(%s)", $2);}
| KW_SUB expr          {$$ = template("-(%s)", $2);}
| KW_PLUS expr  %prec UPLUS         {$$ = template("+(%s)", $2);}
| expr KW_SUB expr  %prec MINUS      {$$ = template("%s - %s", $1, $3);}
| expr KW_AND expr        {$$ = template("%s and %s", $1, $3);}
| expr KW_MUL expr      {$$ = template("%s * %s", $1, $3);}
| expr KW_MOD expr        {$$ = template("%s %% %s", $1, $3);}
| expr KW_DIV expr     {$$ = template("%s / %s", $1, $3);}

| expr EQUAL expr        {$$ = template("%s == %s", $1, $3);}

| expr KW_LESSTHAN expr     {$$ = template("%s < %s", $1, $3);}

| expr KW_GREATHAN expr     {$$ = template("%s > %s", $1, $3);}


| expr KW_LESSEQUAL expr   {$$ = template("%s <= %s", $1, $3);}

| expr KW_GREATEREQUAL expr   {$$ = template("%s >= %s", $1, $3);}
| expr KW_INEQ expr    {$$ = template("%s != %s", $1, $3);}
| expr KW_AMPERSANT expr     {$$ = template("%s && %s", $1, $3);}


/*
| expr_array                          {$$ = template("%s", $1);}
| read_str                            {$$ = template("%s", $1);}
| read_int                            {$$ = template("%s", $1);}

*/
;


%%
int main () {
  if ( yyparse() == 1 )
     printf("Rejected!\n");
 
}
