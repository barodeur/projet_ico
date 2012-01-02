%{
  /* Header */
#include <stdio.h>
%}
%%
\^\-\\ { printf("SPECIAL\n"); }
int|let { printf("KEYWORD\n"); }
[0-9]+ { printf("INT\n"); }
[a-zA-Z][a-zA-Z_]* { printf("VAR\n"); }
%%
/* Trailer */
int main() {
  char chaine[17] = "integer38^-\\let\n";
  buffer buf = malloc(sizeof(struct buffer_b));
  buf->content = chaine;
  buf->pos = 0;
  while (buf->pos < 17)
    lexer(buf);
  return 0;
}
