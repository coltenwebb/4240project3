import sys
from antlr4 import *
from ExampleLexer import ExampleLexer
from ExampleParser import ExampleParser
 
def main(argv):
    input_stream = FileStream(argv[1])
    lexer = ExampleLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = ExampleParser(stream)
    tree = parser.tiger_program()
    #print(stream.getText())
    print(tree.toStringTree(recog=parser))
 
if __name__ == '__main__':
    main(sys.argv)

