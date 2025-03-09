.section .data
output_file:
    .asciz "data.json"
format_string:
    .asciz "{ \"id\": %d, \"value\": %d }\n"

.section .bss
.lcomm buffer, 256

.section .text
.global _start

_start:
    # Open the file
    mov $5, %eax            # sys_open
    lea output_file, %ebx   # filename
    mov $577, %ecx          # flags (O_WRONLY | O_CREAT | O_TRUNC)
    mov $0644, %edx         # mode
    int $0x80

    mov %eax, %edi          # store file descriptor

    # Seed the random number generator
    mov $1, %eax            # sys_time
    xor %ebx, %ebx          # NULL
    int $0x80

    mov %eax, %esi          # seed value
    call srand

    # Generate data and write to file
    mov $0, %ecx            # counter
generate_loop:
    cmp $10, %ecx
    jge end_loop

    push %ecx               # save counter
    call rand
    xor %edx, %edx
    mov $100, %ebx
    div %ebx                # value = rand() % 100

    lea buffer, %ebx
    mov format_string, %esi
    pop %ecx                # restore counter
    push %ecx               # save counter again
    push %eax               # save value
    push %ecx               # save id
    call sprintf
    add $12, %esp           # clean up stack

    mov $4, %eax            # sys_write
    mov %edi, %ebx          # file descriptor
    lea buffer, %ecx        # buffer
    mov $256, %edx          # buffer size
    int $0x80

    pop %ecx                # restore counter
    inc %ecx
    jmp generate_loop

end_loop:
    # Close the file
    mov $6, %eax            # sys_close
    mov %edi, %ebx          # file descriptor
    int $0x80

    # Exit the program
    mov $1, %eax            # sys_exit
    xor %ebx, %ebx          # exit code
    int $0x80

srand:
    ret

rand:
    mov %esi, %eax
    imul $1103515245, %eax
    add $12345, %eax
    mov %eax, %esi
    ret