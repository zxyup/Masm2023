data segment
    data1 dw 0f895h
    data2 dw 3e0ch
data ends

cseg segment
    assume cs:cseg,ds:data
    beg:
        mov ax,data
        mov ds,ax
        lea bx,data1
        mov ax,[bx]
        lea bx,data2
        mov dx,[bx]
        add dx,ax
        mov di,0020h
        mov [di],dx
        mov ah,4ch
        int 21h
 cseg ends
 end beg