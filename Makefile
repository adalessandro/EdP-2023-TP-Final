.PHONY: clean all

all: tp-enunciado.pdf

%.pdf: %.md
	pandoc -o $@ $^

clean:
	rm -f *.pdf
