all: myInterp.g myInterp_test.java
	java -cp antlr-3.5.2-complete.jar org.antlr.Tool myInterp.g
	javac -cp antlr-3.5.2-complete.jar:. myInterp_test.java
clean:
	rm myInterpLexer* myInterpParser* myInterp.tokens myInterp_test.class