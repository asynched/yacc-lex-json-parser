#include <stdio.h>
#include <stdlib.h>
#include "json.h"

extern FILE* yyin;
extern int   yylineno;
extern char* yytext;

int yywrap(void)
{
	return 1;
}

void yyerror(const char* err)
{
	fprintf(stderr, "Error: %s on line %d\n", err, yylineno);
}

int main(int argc, char* argv[])
{
	yyin = fopen(argv[1], "r");

	if (yyin == NULL)
	{
		printf("Error opening file: '%s'\n", argv[1]);
		printf("Does the file exist?\n");
		return 1;
	}

	return yyparse();
}
