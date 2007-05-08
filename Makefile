CFLAGS=-Wall

all: run

sleepless.so: sleepless.c
	gcc ${CFLAGS} sleepless.c -o sleepless.so -ldl -shared

libtest.so: libtest.h libtest.c
	gcc ${CFLAGS} libtest.c -I. -o libtest.so -shared

test: libtest.h test.c
	gcc ${CFLAGS} test.c -I. ./libtest.so -o test

run: sleepless.so libtest.so test
	LD_LIBRARY_PATH=. ./test
	LD_LIBRARY_PATH=. LD_PRELOAD=./sleepless.so ./test
