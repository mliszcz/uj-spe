FLAGS=--number-sections --standalone

%.pdf: %.md
	pandoc $(FLAGS) -o $@ $<

all: $(patsubst %.md, %.pdf, $(wildcard *.md))

clean:
	rm -f *.pdf
