sources=$(wildcard */*.c)
executables=$(patsubst %.c,%.exe,$(sources))

all: $(executables)

%.exe: %.c
	$(CC) -o $@ $^
