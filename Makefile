MLTON=mlton

all: tests examples

.PHONY: typecheck
typecheck:
	make -C src typecheck
	make -C tests typecheck
	make -C examples typecheck

.PHONY: tests
tests:
	make -C tests

.PHONY: examples
examples:
	make -C examples

.PHONY: clean
clean:
	make -C src clean
	make -C tests clean
	make -C examples clean
