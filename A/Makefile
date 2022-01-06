all:
		bison -d -o stackInverse.tab.c stackInverse.y
		gcc -c -g -I.. stackInverse.tab.c 
		flex -o lex.yy.c stackInverse.l
		gcc -c -g -I.. lex.yy.c
		gcc -o stackInverse stackInverse.tab.o lex.yy.o -ll
clean:
		rm -rf *o stackInverse