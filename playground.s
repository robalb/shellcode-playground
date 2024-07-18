#
# gcc -wl ,-N --static -nostdlib -o playground playground.s
#
.intel_syntax noprefix

.global _start
.text

_start:

  mov rax, 2
  mov rsi, 0
  mov rdx, 0
  syscall

  mov rdi, rax
  mov rsi, 1

  mov rax, 0x114
  mov rdx, 10
  mov r10, 0
  syscall

