#!/bin/sh
antlr -Dlanguage=Python3 Example.g4
python3 main.py $1
