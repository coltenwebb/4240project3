#!/bin/sh
antlr -Dlanguage=Python3 Tiger.g4
python3 main.py $1
