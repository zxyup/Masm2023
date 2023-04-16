dseg segment
    arr   db 18H,42H,36H,43H,42H,19H,50H,51H,8FH,
    42H,34H,5AH,0BCH,3AH,0BFH,0FFH,03H,3BH,42H,12H
    up    db 0
    down  db 0
    upp   db 'up  : $'
    downn db 13,10,'down: $'
dseg ends
cseg segment
         assume cs:cseg,ds:dseg
    s1:  
         mov    ax,dseg
         mov    ds,ax
         mov    bl,42h
         mov    cx,20

    aga: 
         mov    di,cx
         dec    di
         cmp    bl,arr[di]
         ja     sma
         cmp    bl,arr[di]
         jb     big
    lop: 
         dec    cx
         jnz    aga
         jmp    s2

    sma: 
         inc    down
         jmp    lop
    big: 
         inc    up
         jmp    lop
    s2:  
         mov    ah,09
         lea    dx,upp
         int    21h
         mov    ah,02
         mov    dl,up
         add    dl,30h
         int    21h

         mov    ah,09
         lea    dx,downn
         int    21h
         mov    ah,02
         mov    dl,down
         add    dl,30h
         int    21h
         mov    ah,4ch
         int    21h
cseg ends
end s1
