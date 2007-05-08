all: run

sleepless.so: sleepless.c
	gcc sleepless.c -o sleepless.so -ldl -shared

test: test.c
	gcc test.c -o test

run: sleepless.so test
	time ./test
	LD_PRELOAD=./sleepless.so time ./test
