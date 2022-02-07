all:mylexer testLexer
mylexer: mylexer.g
	java -cp "./antlr-3.5.2-complete.jar" org.antlr.Tool mylexer.g
testLexer: testLexer.java
	javac testLexer.java
clean:
	rm mylexer.tokens mylexerLexer.* mylexerParser.java testLexer.class
