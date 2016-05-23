MLTON=mlton

all: compile-tests run-tests

.PHONY: typecheck
typecheck:
	$(MLTON) -stop tc check-hashes.mlb

.PHONY: compile-tests
compile-tests:
	$(MLTON) check-hashes.mlb

.PHONY: run-tests
run-tests:
	./check-hashes

.PHONY: clean
clean:
	rm -f check-hashes
