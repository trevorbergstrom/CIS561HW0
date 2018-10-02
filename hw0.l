%top{
	#include <cstdio>
	#include <iostream>
	#include <iomanip>
	#include <string>
	using namespace std;
%}

%class{
	std::string string1;
	public:
		void results() {
			cout << string1 << endl;
		}
%}

%o noyywrap

%x quote
%x squote

%%

["] {start(quote); string1.append("&ldquo ");}
<quote>[a-z] {string1.append(text());}
<quote>[ ] {string1.append(text());}
<quote>["] {start(INITIAL); string1.append(" &rdquo");}

['] { start(squote); string1.append("&lquo ");}
<squote>[a-z] {string1.append(text());}
<squote>[ ] {string1.append(text());}
<squote>['] {start(INITIAL); string1.append(" &rdquo");}

%%

int main(int argc, char **argv) {
	FILE *fd = stdin;
	if(argc > 1 && (fd = fopen(argv[1], "r")) == NULL) {
		exit(EXIT_FAILURE);
	}

	yyFlexLexer lexer(fd);
	
	lexer.yylex();
	
	lexer.results();

	if(fd != stdin) {
		fclose(fd);
	}
	return 0;
}
	
