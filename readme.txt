Trevor Bergstrom 10/1/2018

Cannot get the run shellfile or makefile to compile

try:

reflex hw0.l --flex --bison

c++ -Ireflex/include -o hw0 lex.yy.cpp reflex/lib/libreflex.a

Run with file:

./hw0 <filename>
