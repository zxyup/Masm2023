dataseg segment
	mess    db 'hello world',0dh,0ah,24h
	blocks  dw 1234h,08h,0fe32h,1258h,5800h,1586h,5678h,9abch,0ffh
dataseg ends

cseg segment
	     assume cs:cseg,ds:dataseg
	beg: 
	     mov    ah,2
	     mov    cx,dataseg
	     mov    ds,cx
	    ;  mov    bx,offset blocks
        lea bx,blocks
        mov di,12
        mov dx,[bx][12]
	    ;  add    bx,12
	    ;  mov    dx,[bx]
        ; mov si,12
        ; mov dx,blocks[si]
	     mov    ah,4ch
	     int    21h
cseg ends
end beg