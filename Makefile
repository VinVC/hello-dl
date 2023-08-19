CC = gcc
# CFLAGS = -arch arm64
LDFLAGS = -L. -lexample

all: libexample.dylib my_program

libexample.dylib: example.c
	$(CC) -shared -o libexample.dylib example.c $(CFLAGS)

my_program: main.c libexample.dylib
	$(CC) -o main main.c $(LDFLAGS) $(CFLAGS)

clean:
	rm -f libexample.dylib main

