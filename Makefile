# Definindo compilador e flags para compilação
CC := gcc
CFLAGS := -c -Wall

all: compilador clean

compilador: bison.tab.o lex.yy.o main.o
	$(CC) bison.tab.o lex.yy.o main.o

bison.tab.o: bison/bison.y
	bison -d bison/bison.y 
	$(CC) -c bison.tab.c

lex.yy.o: flex/flex.l
	flex flex/flex.l
	$(CC) -c lex.yy.c

clean:
	rm -f bison.tab.o lex.yy.o main.o

.PHONY: clean