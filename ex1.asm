code segment
    assume cs:code

    s1:
    mov ah,2
    mov dl,0
    add dl,41h
    int 21h

    s2:
    mov ah,2
    mov dl,1
    add dl,41h
    int 21h

    s3:
    mov ah,2
    mov dl,2
    add dl,41h
    int 21h

    mov ah,4ch
    int 21h

code ends
end s1