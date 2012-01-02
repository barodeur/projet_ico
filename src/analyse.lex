%{
#define YYSTYPE char
#include "analyse.tab.h"
#include <stdlib.h>
%}

%%

"{%" return HEADER_START;
"%}" return HEADER_STOP;
"%%" return RULES_TOGGLE;
"{" return ACTION_START
"}" return ACTION_STOP

