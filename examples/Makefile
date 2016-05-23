MLTON=mlton

all: sha1-file sha1-string

.PHONY: typecheck
typecheck:
	$(MLTON) -stop tc sha1-file.mlb
	$(MLTON) -stop tc sha1-string.mlb

.PHONY: sha1-file
sha1-file:
	$(MLTON) sha1-file.mlb

.PHONY: sha1-string
sha1-string:
	$(MLTON) sha1-string.mlb

.PHONY: clean
clean:
	rm -f sha1-file
	rm -f sha1-string
