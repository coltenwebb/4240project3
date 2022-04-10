import sys
from antlr4 import *
from TigerLexer import TigerLexer
from TigerParser import TigerParser
 
def main(argv):
    input_stream = FileStream(argv[1])
    lexer = TigerLexer(input_stream)
    stream = CommonTokenStream(lexer)
    parser = TigerParser(stream)
    tree = parser.tiger_program()
    #print(stream.getText())
    print(tree.toStringTree(recog=parser))
 
if __name__ == '__main__':
    main(sys.argv)

