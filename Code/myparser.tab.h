/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_MYPARSER_TAB_H_INCLUDED
# define YY_YY_MYPARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    KW_TRUE = 258,
    KW_FALSE = 259,
    KW_STATIC = 260,
    KW_DO = 261,
    KW_IF = 262,
    KW_RETURN = 263,
    KW_BREAK = 264,
    KW_INTEGER = 265,
    KW_STRING = 266,
    KW_CONT = 267,
    KW_FOR = 268,
    KW_CHAR = 269,
    KW_VOID = 270,
    KW_ = 271,
    KW_REAL = 272,
    KW_WHILE = 273,
    KW_END = 274,
    KW_BEGIN = 275,
    KW_OR = 276,
    KW_SEMICLN = 277,
    COMMA = 278,
    OPEN_HK = 279,
    CLOSE_HK = 280,
    STRINGS = 281,
    CHARACTER = 282,
    IDENTIFIERS = 283,
    INTEGERS = 284,
    FLOATS = 285,
    RD_STR = 286,
    RD_INT = 287,
    RD_REAL = 288,
    WR_STR = 289,
    WR_INT = 290,
    WR_REAL = 291,
    CLN = 292,
    KW_MAIN = 293,
    KW_PLUS = 294,
    KW_SUB = 295,
    KW_MUL = 296,
    KW_DIV = 297,
    KW_MOD = 298,
    KW_GREATEREQUAL = 299,
    KW_LESSEQUAL = 300,
    KW_GREATHAN = 301,
    KW_LESSTHAN = 302,
    KW_INEQ = 303,
    KW_AND = 304,
    KW_AMPERSANT = 305,
    KW_OROR = 306,
    KW_NOT = 307,
    KW_NOTNOT = 308,
    EQUAL = 309,
    KW_BOOLEAN = 310,
    OPEN_PAR = 311,
    CLOSE_PAR = 312,
    KW_ELSE = 313,
    UMINUS = 315,
    UPLUS = 316,
    MINUS = 317,
    PLUS = 318,
    NOT = 319,
    FACTOR = 320,
    RELATION = 321,
    PAR_R = 322
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 10 "myparser.y" /* yacc.c:1909  */

	char* str;
  int num;

#line 126 "myparser.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_MYPARSER_TAB_H_INCLUDED  */
