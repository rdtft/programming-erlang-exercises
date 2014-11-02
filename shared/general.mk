all: compile

compile:
	erlc $(EXERCISE).erl

test:
	@echo "run $(EXERCISE)"
	erl -noshell -s $(EXERCISE) test -s init stop

clean:
	rm -vf *.beam
	rm -vf *.dump

.PHONY: compile test clean