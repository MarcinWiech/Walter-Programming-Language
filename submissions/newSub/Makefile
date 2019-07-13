DEPEND += Tokens.hs Grammar.hs Remap.hs TypeChecker.hs

# Build an executable for interactive mode
myinterpreter: $(DEPEND) Main.hs
	ghc -o myinterpreter Main.hs
	make clean

# Generate ML files from a parser definition file
Grammar.hs : Grammar.y
	@rm -f Grammar.hs
	happy Grammar.y
	@chmod -w Grammar.hs

# Generate ML files from a lexer definition file
Tokens.hs : Tokens.x
	@rm -f Tokens.hs
	alex Tokens.x
	@chmod -w Tokens.hs
	
# Clean up the directory
clean::
	rm -rf Tokens.hs Grammar.hs *.hi *.o *.info


