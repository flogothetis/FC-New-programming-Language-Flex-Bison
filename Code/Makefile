helloworld:
	bison -d -v -r all myparser.y
	flex mylexer.l
	gcc -o mycomp lex.yy.c myparser.tab.c cgen.c -lfl
	./mycomp < HelloWorld.in > HelloWorld.c
	gcc HelloWorld.c -o main.out  
	./main.out

primenumbers:
	bison -d -v -r all myparser.y
	flex mylexer.l
	gcc -o mycomp lex.yy.c myparser.tab.c cgen.c -lfl
	./mycomp < PrimeNumbers.in > PrimeNumbers.c
	gcc PrimeNumbers.c -o main.out  
	./main.out

cubes:
	bison -d -v -r all myparser.y
	flex mylexer.l
	gcc -o mycomp lex.yy.c myparser.tab.c cgen.c -lfl
	./mycomp < Cubes.in > Cubes.c
	gcc Cubes.c -o main.out  
	./main.out

fibonacci:
	bison -d -v -r all myparser.y
	flex mylexer.l
	gcc -o mycomp lex.yy.c myparser.tab.c cgen.c -lfl
	./mycomp < Fibonacci.input > Fibonacci.c
	gcc Fibonacci.c -o main.out  
	./main.out

array:
	bison -d -v -r all myparser.y
	flex mylexer.l
	gcc -o mycomp lex.yy.c myparser.tab.c cgen.c -lfl
	./mycomp < Αrrays.in > Αrrays.c
	gcc Αrrays.c -o main.out  
	./main.out

mistake1: 	
	bison -d -v -r all myparser.y
	flex mylexer.l
	gcc -o mycomp lex.yy.c myparser.tab.c cgen.c -lfl
	./mycomp < PrimeNumbersMistake.in > PrimeNumbersMistake.c
	gcc PrimeNumbersMistake.c -o main.out  
	./main.out
mistake2:
	bison -d -v -r all myparser.y
	flex mylexer.l
	gcc -o mycomp lex.yy.c myparser.tab.c cgen.c -lfl
	./mycomp < ArraysMistake.in > ArraysMistake.c
	gcc ArraysMistake.c -o main.out  
	./main.out	
