import sys
from antlr4 import *
from TigerLexer import TigerLexer
from TigerParser import TigerParser


filename = ""
lexer_problems = False

class TigerLexerErrorListener:
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        print(f"lexer error: token recognition error at line {line}:{column}")
        with open(filename, "r") as f:
            pref = f.readlines()[line-1].rstrip()
        print(f"{line} | {pref}")
        print((" "*(len(f"{line} |")+column+1)) + "^")
        global lexer_problems
        lexer_problems= True


        

    def reportAmbiguity(self, recognizer, dfa, startIndex, stopIndex, exact, ambigAlts, configs):
        pass

    def reportAttemptingFullContext(self, recognizer, dfa, startIndex, stopIndex, conflictingAlts, configs):
        pass

    def reportContextSensitivity(self, recognizer, dfa, startIndex, stopIndex, prediction, configs):
        pass

class TigerParserErrorListener:
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        print(f"parse error at line {line}:{column}: {msg}")
        with open(filename, "r") as f:
            lines = f.readlines()
            if len(lines) <= line-1:
                return
            pref = lines[line-1].rstrip()
        print(f"{line} | {pref}")
        print((" "*(len(f"{line} |")+column+1)) + "^")



    def reportAmbiguity(self, recognizer, dfa, startIndex, stopIndex, exact, ambigAlts, configs):
        pass

    def reportAttemptingFullContext(self, recognizer, dfa, startIndex, stopIndex, conflictingAlts, configs):
        pass

    def reportContextSensitivity(self, recognizer, dfa, startIndex, stopIndex, prediction, configs):
        pass

 
def main(argv):
    global filename
    filename = argv[1]
    input_stream = FileStream(filename)
    lexer = TigerLexer(input_stream)
    lexer.removeErrorListeners()
    lexer.addErrorListener(TigerLexerErrorListener())
    stream = CommonTokenStream(lexer)
    stream.fill()
    #print([str(tok)for tok in stream.tokens])
    if lexer_problems:
        print("lexer failed, exiting")
        return

    parser = TigerParser(stream)
    parser.removeErrorListeners()
    parser.addErrorListener(TigerParserErrorListener())
    #parser.addErrorListener(DiagnosticErrorListener())
    tree = parser.tiger_program()

    if parser._syntaxErrors == 0:
        print("successful parse")
    else:
        print("parse failed, exiting")
    
    #print(stream.getText())
    #print(tree.toStringTree(recog=parser))
 
if __name__ == '__main__':
    main(sys.argv)

