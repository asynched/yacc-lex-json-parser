%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define DEBUG 1

int  yylex(void);
void yyerror(const char* err);

int yydebug = DEBUG;
%}

%union { char* string; double decimal; }

%token 				OPEN_BRACKET CLOSE_BRACKET OPEN_SQ_BRACKET CLOSE_SQ_BRACKET COMMA COLON
%token 				TOKEN_TRUE TOKEN_FALSE TOKEN_NULL
%token <string> 	STRING
%token <decimal> 	DECIMAL

%start json

%%
json:
		| value
		;

value:	 	object
		|	STRING
		| 	DECIMAL
		|	array
		|	TOKEN_TRUE
		|	TOKEN_FALSE
		|	TOKEN_NULL
		;

object:		OPEN_BRACKET CLOSE_BRACKET
		|	OPEN_BRACKET members CLOSE_BRACKET
		;

members:	member
		|	members COMMA member
		;

member:		STRING COLON value
		;

array:		OPEN_SQ_BRACKET CLOSE_SQ_BRACKET
		| 	OPEN_SQ_BRACKET values CLOSE_SQ_BRACKET
		;

values:		value
		| values COMMA value
		;
%%
