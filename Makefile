CFLAGS = -g

all: main clean

main: main.o analyse.tab.o analyse.lex.o
	gcc -o bin/projet_ico main.o ${CFLAGS}

main.o: src/main.c
	gcc -o main.o -c src/main.c ${CFLAGS}

src/analyse.tab.c: src/analyse.y
	bison -o src/analyse.tab.c -d src/analyse.y

src/alalyse.lex.c: src/analyse.lex
	flex -o src/analyse.lex.c src/analyse.lex

analyse.tab.o: src/analyse.tab.c
	gcc -o analyse.tab.o -c src/analyse.tab.c

analyse.lex.o: src/analyse.lex.c
	gcc -o analyse.lex.o -c src/analyse.lex.c

clean:
	rm -rf *.o
