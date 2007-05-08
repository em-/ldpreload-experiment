CFLAGS=-Wall

all: run

libsleepless.so: libsleepless.c
	gcc ${CFLAGS} libsleepless.c -o libsleepless.so -ldl -shared

libtest.so: libtest.h libtest.c
	gcc ${CFLAGS} libtest.c -I. -o libtest.so -shared

test: libtest.h test.c
	gcc ${CFLAGS} test.c -I. ./libtest.so -o test

run: libsleepless.so libtest.so test
	LD_LIBRARY_PATH=. ./test
	LD_LIBRARY_PATH=. LD_PRELOAD=./libsleepless.so ./test
