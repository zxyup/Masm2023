cseg segment
         assume cs:cseg
    s1:  
         mov    ah,01h
         int    21h
         cmp    al,'Z'
         jbe    out1
         jmp    out2
    out1: 
         or     al,20h
         mov    dl,al
         mov    ah,06h
         int    21h
         jmp over

    out2:
         mov    bl,20h
         not    bl
         and    al,bl
         mov    dl,al
         mov    ah,06h
         int    21h
         jmp over
    over:
         mov    ah,4ch
         int    21h
cseg ends
end s1