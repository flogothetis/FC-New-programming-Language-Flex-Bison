%{
  #include <stdio.h>
  #include <string.h>  

  #include "cgen.h"
  #include  "myparser-1.tab.h"
  
  int lineNum = 1;
%}


ID      [a-zA-Z][0-9a-zA-Z_]*
DIGIT   [0-9]
NUMBER  {DIGIT}{DIGIT}*
DECIMAL ("."{NUMBER})|({NUMBER}("."{NUMBER}?)?)
REAL    {DECIMAL}([eE][+-]?{NUMBER})?
STRING  \"[^\\'\n\"]*\"

%%

if          return KW_IF;
then        return KW_THEN;
else		    return KW_ELSE;

true				return KW_TRUE;
false				return KW_FALSE;

{ID}        { yylval.str = strdup(yytext); 
              return IDENTIFIER; }
            
{NUMBER}    { yylval.intNum = atoi(yytext); 
              return POSINT; }
{REAL}      { yylval.doubleNum = atof(yytext); 
              return REAL; }
{STRING}    { yylval.str = strdup(yytext); 
              return STRING; }

"+"         return '+';
"-"         return '-';
"*"         return '*';
"/"         return '/';
"("					return '(';
")"					return ')';

";"					return ';';

":="        { return ASSIGN ;}

"//"[^\n]*  /* eat line comments */

[ \r\t]+		/* eat whitespace */
\n 					 ++lineNum;
<<EOF>> 		return EOF;

.           { yyerror("lexical error: unrecognized literal '%s'\n", yytext); }


