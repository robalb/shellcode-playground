/* 
gcc -o target target -fno-stack-protector -z execstack
*/

#include <stdint.h>
#include <unistd.h>
#include <stdio.h>

void *shellcode_mem;
size_t shellcode_size;

int main()
{
    uint8_t shellcode[0x1000];
    shellcode_mem = (void *)&shellcode;
    shellcode_size = read(0, shellcode_mem, 19);
    puts("Executing shellcode!\n");
    ((void(*)())shellcode_mem)();
}
