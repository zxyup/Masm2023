cseg segment
assume cs:cseg
s1:
mov al,10h
mov bl,-2
mul bl

mov ah,4ch
int 21h
cseg ends
end s1