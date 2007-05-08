all: run

sleepless.so: sleepless.c
	gcc sleepless.c -o sleepless.so -ldl -shared

libtest.so: libtest.h libtest.c
	gcc libtest.c -I. -o libtest.so -shared

test: libtest.h test.c
	gcc test.c -I. ./libtest.so -o test

run: sleepless.so libtest.so test
	LD_LIBRARY_PATH=. time ./test
	LD_LIBRARY_PATH=. LD_PRELOAD=./sleepless.so time ./test
