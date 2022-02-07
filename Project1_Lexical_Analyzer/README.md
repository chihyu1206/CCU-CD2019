## OS: Ubuntu 18.04.2
## Files:
1. Description MS-word file: Project1 Report.pdf   
2. mylexer.g
3. antlr-3.5.2-complete.jar
4. README.txt  
5. Test C files: test1.c test2.c test3.c
6. Makefile                    
7. testLexer.java

## Simple Guide:
1. After typing in "make" command, antlr will produce some files
related to java=> "mylexerLexer.java", "mylexerParser.java"
and other files like "mylexer.tokens" which is the record of the
tokens and its related index.Besides, the makefile also compiles
the testLexer java file.
2. Use "java testLexer test1.c" to analyze the code of the 3 C program test file, relatively.
 


