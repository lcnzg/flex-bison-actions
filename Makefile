CC=cc
CFLAGS=-I.
NAME=example

all: build test

build: $(NAME).bin

test: $(NAME).bin
	./$(NAME).bin < test.$(NAME)

clean:
	rm -f *.tab.c
	rm -f *.tab.h
	rm -f *.yy.c
	rm -f *.bin

$(NAME).bin: y.tab.c lex.yy.c
	$(CC) $^ -o $@

y.tab.c: $(NAME).y
	bison -dy $<

lex.yy.c: $(NAME).l
	flex $<
