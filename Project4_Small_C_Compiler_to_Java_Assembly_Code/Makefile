all:
	java  -cp ./antlr-3.5.2-complete.jar org.antlr.Tool myCompiler.g
	javac -Xlint:deprecation -cp ./antlr-3.5.2-complete.jar:. myCompiler_test.java
test1.j: test1.c
	java -cp antlr-3.5.2-complete.jar:. myCompiler_test test1.c > test1.j
test2.j: test2.c
	java -cp antlr-3.5.2-complete.jar:. myCompiler_test test2.c > test2.j
test3.j: test3.c
	java -cp antlr-3.5.2-complete.jar:. myCompiler_test test3.c > test3.j
result1: test1.j
	java -jar jasmin.jar test1.j
result2: test2.j
	java -jar jasmin.jar test2.j
result3: test3.j
	java -jar jasmin.jar test3.j
run: myResult.class
	java myResult
clean:
	rm *.class *.tokens myCompiler[^_]*.java *.j
