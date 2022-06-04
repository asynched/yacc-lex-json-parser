%{
#include <stdio.h>
#include "json.h"
extern void yyerror(const char* err);
#define DISPLAY fwrite(yytext, yyleng, 1, yyout)
%}

%%
"{"				{ DISPLAY; return OPEN_BRACKET; }
"}"				{ DISPLAY; return CLOSE_BRACKET; }
"["				{ DISPLAY; return OPEN_SQ_BRACKET; }
"]"				{ DISPLAY; return CLOSE_SQ_BRACKET; }
","				{ DISPLAY; return COMMA; }
":"				{ DISPLAY; return COLON; }
"true"			{ DISPLAY; return TOKEN_TRUE; }
"false"			{ DISPLAY; return TOKEN_FALSE; }
"null"			{ DISPLAY; return TOKEN_NULL; }
[ \t\n\r]		{ DISPLAY; }
\"[^"]*\" 		{ yylval.string = strdup(yytext); DISPLAY; return STRING; }
[1-9]\.?[0-9]*	{ yylval.decimal = atof(yytext); DISPLAY; return DECIMAL; }
%%

