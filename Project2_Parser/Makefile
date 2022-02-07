all: myparser.g testParser.java
	java -cp antlr-3.5.2-complete.jar org.antlr.Tool myparser.g
	javac -cp antlr-3.5.2-complete.jar:. testParser.java
clean:
	rm myparserLexer* myparserParser* myparser.tokens testParser.class
