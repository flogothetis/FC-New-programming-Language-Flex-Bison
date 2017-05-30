/* definitions */
%{
  #include <stdio.h>

  int lineNum = 1;
%}

/* definitions */


Identifiers [A-Za-z][A-Za-z0-9_]*
Integers [1-9][0-9]*
Digit [0-9]
Floats {Integers}("."{Digit}+)([eE][+-]?{Integers})?
Non_print [^"\\"^"\'"^"\""^"\n"]
Escape_Sequence  ("\\n"|"\\t"|"\\r"|"\\\\"|"\\\'"|"\\\"")
Constant_Character ("\'")(({Escape_Sequence}|{Non_print}))("\'")
Constant_strings("\"")(({Escape_Sequence}|{Non_print})*)("\"")
Arithmetic_Operators    ("+"|"-"|"*"|"/"|"mod")
Relational_Operators    ("="|">="|"<=")
Logical_operators 		(">"|"<"|"!=")
Logical_conjuction		("and"|"&&")
Logical_divorcement     ("or"|"||")
Logical_negative 		["not"|"!"]


/* rules */

%%
"//"[^\n]*  /* eat line comments */


true    {yylval.str = strdup(yytext); return KW_TRUE;}
false   {yylval.str = strdup(yytext); return KW_FALSE;}
static	{ yylval.str = strdup(yytext); return KW_STATIC;}
do		{ yylval.str = strdup(yytext); return KW_DO;}
if		{ yylval.str = strdup(yytext); return KW_IF;}
not		{ yylval.str = strdup(yytext); return KW_NOT;}
boolean	{ yylval.str = strdup(yytext); return KW_BOOLEAN;}
break	{ yylval.str = strdup(yytext); return KW_BREAK;}
else	{ yylval.str = strdup(yytext); return KW_ELSE;}
and		{ yylval.str = strdup(yytext); return KW_AND;}
integer	{ yylval.str = strdup(yytext); return KW_INTEGER;}
string	{ yylval.str = strdup(yytext); return KW_STRING;}
continue { yylval.str = strdup(yytext); return KW_CONT;}
for		{ yylval.str = strdup(yytext); return KW_FOR;}
mod		{ yylval.str = strdup(yytext); return KW_MOD;}
char	{ yylval.str = strdup(yytext); return KW_CHAR;}
void	{ yylval.str = strdup(yytext); return KW_VOID;}
return	{ yylval.str = strdup(yytext); return KW_RETURN;}
end		{ yylval.str = strdup(yytext); return KW_END;}
real	{ yylval.str = strdup(yytext); return KW_REAL;}
while	{ yylval.str = strdup(yytext); return KW_WHILE;}
begin	{ yylval.str = strdup(yytext); return KW_BEGIN;}
or		{ yylval.str = strdup(yytext); return KW_OR;}
";"		{ yylval.str = strdup(yytext); return KW_SEMICLN;}
"("		{ yylval.str = strdup(yytext); return OPEN_PAR;}
")"		{ yylval.str = strdup(yytext); return CLOSE_PAR;}
","       { yylval.str = strdup(yytext); return COMMA;}
"["       { yylval.str = strdup(yytext); return OPEN_HK;}
"]"       { yylval.str = strdup(yytext); return CLOSE HK;}
{Arithmetic_Operators} 	{ yylval.str = strdup(yytext); return AR_OP;}
{Relational_Operators}  { yylval.str = strdup(yytext); return REL_OP;}
{Logical_operators} 	{ yylval.str = strdup(yytext); return LOG_OP;}
{Logical_conjuction}	{ yylval.str = strdup(yytext); return LOG_CON;}
{Logical_divorcement}   { yylval.str = strdup(yytext); return LOG_DIV;}
{Logical_negative} 	  	{ yylval.str = strdup(yytext); return LOG_NEG;}
{Constant_strings} 		{ yylval.str = strdup(yytext); return STRINGS;}
{Constant_Character} 	{ yylval.str = strdup(yytext); return CHARACTER;}
{Identifiers} 			{ yylval.str = strdup(yytext); return IDENTIFIERS;}
{Integers}    			{ yylval.str = strdup(yytext); return INTEGERS;}
{Floats}      			{ yylval.str = strdup(yytext); return FLAOTS;}
"readString"       		{ yylval.str = strdup(yytext); return RD_STR;}
"readInteger"       	{ yylval.str = strdup(yytext); return RD_INT;}
"readReal"          	{ yylval.str = strdup(yytext); return RD_REAL;}
"writeString"       	{ yylval.str = strdup(yytext); return WR_STR;}
"writeInteger"     		{ yylval.str = strdup(yytext); return WR_INT;}
"writeReal"         	{ yylval.str = strdup(yytext); return WR_REAL;}
":"	               		{ yylval.str = strdup(yytext);return CLN;}
"="	                	{ yylval.str = strdup(yytext);return EQUAL;}
[ \r\t]+			/* skip whitespace */
\n 					 lineNum++;
.           { printf("Line %d Lexical Error: Unrecognized literal %s\n", lineNum, yytext); }



%%


int main ()
{
   int token;
   
   while ( (token = yylex()) != 0 )
      printf("Line %d Token %d: %s\n", lineNum, token, yytext);
	
	  
}
