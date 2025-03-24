#make Erlang Brandtools
DEFAULT_GOAL := all
COMP = erlc

SOURCE = src
BIN = build

all: modules tests
	rm -r $(BIN)
	mkdir $(BIN)
	mv $(wildcard *.beam) $(BIN)

modules tests:
	$(COMP) $(wildcard $(SOURCE)/$@/*.erl)


clean:
	rm -f $(wildcard $(BIN)/*.beam)

