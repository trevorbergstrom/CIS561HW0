#!/bin/bash

reflex hw0.l --flex --bison
g++ lex.yy.cpp -g -o hw0
