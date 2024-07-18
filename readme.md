# shellcode playground

A simple setup for creating and testing shellcode,
written in a single Makefile

## requirements

Standard Unix tools:
- `gcc`, `gdb`, `cat`, `xxd`, `wc`, `objcopy`

Recommended optional tools:
- the `pwndbg` or `gef` plugins for gdb

## usage

Write your shellcode in the file `pplayground.s`

- `make debug` launches a gdb session with your compiled shellcode. Useful to inspect its behaviour

- `make dis` will print the shellcode bytes next to the
  assembly instructions.
  Example output:
  ```
  401000:       48 c7 c0 02 00 00 00    mov    rax,0x2
  401007:       48 c7 c6 00 00 00 00    mov    rsi,0x0
  40100e:       48 c7 c2 00 00 00 00    mov    rdx,0x0
  401015:       0f 05                   syscall
  401017:       48 89 c7                mov    rdi,rax
  40101a:       48 c7 c6 01 00 00 00    mov    rsi,0x1
  401021:       48 c7 c0 14 01 00 00    mov    rax,0x114
  401028:       48 c7 c2 0a 00 00 00    mov    rdx,0xa
  40102f:       49 c7 c2 00 00 00 00    mov    r10,0x0
  401036:       0f 05                   syscall
wc --bytes shellbytes
56 shellbytes
  ```

- `make hex` will print the compacted shellcode bytes and length
  example output:
  ```
00000000: 48 C7 C0 02 00 00 00 48  H......H
00000008: C7 C6 00 00 00 00 48 C7  ......H.
00000010: C2 00 00 00 00 0F 05 48  .......H
00000018: 89 C7 48 C7 C6 01 00 00  ..H.....
00000020: 00 48 C7 C0 14 01 00 00  .H......
00000028: 48 C7 C2 0A 00 00 00 49  H......I
00000030: C7 C2 00 00 00 00 0F 05  ........
wc --bytes shellbytes
56 shellbytes
  ```

- `make test` compiles the vulnerable example app target.c,
  and passes to its stdin the shellcode. This can be useful
  when you need custom constraints you want to test, that can
  be written in target.c

- `make test-debug`  same as make test, but a gdb session will be attached to the process


