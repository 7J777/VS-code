section .data
    output_file db "data.json", 0
    format_string db "{ ""id"": %d, ""value"": %d }", 10, 0
    buffer times 256 db 0

section .bss
    fd resb 4

section .text
    global _start

_start:
    ; Open the file
    mov eax, 5          ; sys_open
    lea ebx, [output_file]
    mov ecx, 577        ; O_WRONLY | O_CREAT | O_TRUNC
    mov edx, 0644       ; mode
    int 0x80
    mov [fd], eax

    ; Seed the random number generator
    mov eax, 1          ; sys_time
    xor ebx, ebx        ; NULL
    int 0x80
    mov esi, eax

    ; Generate data and write to file
    mov ecx, 0          ; counter
generate_loop:
    cmp ecx, 10
    jge end_loop

    ; Generate random value
    call rand
    xor edx, edx
    mov ebx, 100
    div ebx

    ; Format the string
    lea ebx, [buffer]
    push eax
    push ecx
    push eax
    push ecx
    lea esi, [format_string]
    call sprintf
    add esp, 16

    ; Write to file
    mov eax, 4          ; sys_write
    mov ebx, [fd]
    lea ecx, [buffer]
    mov edx, 256
    int 0x80

    inc ecx
    jmp generate_loop

end_loop:
    ; Close the file
    mov eax, 6          ; sys_close
    mov ebx, [fd]
    int 0x80

    ; Exit the program
    mov eax, 1          ; sys_exit
    xor ebx, ebx
    int 0x80

rand:
    mov eax, esi
    imul eax, eax, 1103515245
    add eax, 12345
    mov esi, eax
    ret

sprintf:
    ; Call the C library function sprintf
    ; This is a placeholder and won't work in a real assembly program
    ; You would need to link with the C standard library
    ret