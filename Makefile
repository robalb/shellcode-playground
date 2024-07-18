CC =gcc
#CFLAGS=-wl,-N --static -nostdlib
CFLAGS= --static -nostdlib


.PHONY: debug
debug: playground
	gdb ./playground

.PHONY: run
run: playground
	./playground

.PHONY: test-debug
test-debug: shellbytes target
	gdb  -ex "starti < shellbytes" ./target

.PHONY: test
test: shellbytes target
	cat shellbytes - | ./target

.PHONY: dis
dis: playground shellbytes
	objdump -M intel -d playground
	wc --bytes shellbytes

.PHONY: hex
hex: shellbytes
	# hd shellbytes
	xxd -g 1 -c 8 -u shellbytes
	wc --bytes shellbytes

shellbytes: playground
	objcopy --dump-section .text=shellbytes playground

playground: playground.s
	$(CC) $(CFLAGS) -o playground playground.s


target: target.c
	$(CC) -o target target.c -fno-stack-protector -z execstack
