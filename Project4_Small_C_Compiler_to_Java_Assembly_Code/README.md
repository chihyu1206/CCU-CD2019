OS: Ubuntu 18.04

Original Files:
1. antlr-3.5.2-complete.jar
2. jasmin.jar
3. myCompiler.g myCompiler.java
4. test1.c test2.c test3.c
5. Makefile README.txt

Guides:
1. Use "make" command to compile myCompiler.g and myCompiler_test.java.
2. To produce the ".j" files and myResult.class, the following is an example to dealing with "test1.c".( To deal with other test files, just change the related number):
(1) $ make test1.j 
// make the test1.j by the written grammar

(2) $ make result1 
// make the myResult.class from test1.j by jasmin

(3) $ make run   ﻿
// run the program: myResult

3. To clean the files which are not orignal existed, use "make clean" to clean all of them.