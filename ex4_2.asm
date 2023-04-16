data segment
    mess db "hello",0dh,0ah,24h
    valuex db 24h
    valuey db 25h
data ends

cseg segment
    assume cs:cseg,ds:data
    beg:
        mov ax,data
        mov ds,ax
        mov dl,valuex
        mov dh,valuey
        mov valuex,dh
        mov valuey,dl
        mov ah,4ch
        int 21h
 cseg ends
 end beg