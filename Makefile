all: run

sleepless.so:
	gcc sleepless.c -o sleepless.so -ldl -shared

test:
	gcc test.c -o test

run: sleepless.so test
	time ./test
	LD_PRELOAD=./sleepless.so time ./test
