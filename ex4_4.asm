cseg segment
         assume cs:cseg
    beg: 
        mov    ah,8
        int    21h
        mov    dl,al
        mov    ah,2
        int    21h
        mov    ah,4ch
        int    21h
cseg ends
end beg