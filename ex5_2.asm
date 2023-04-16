code segment
         assume cs:code
    s1:  
         mov    al,00fh
         mov    bl,013h
         cmp    al,bl

         mov    ah,4ch
         int    21h
code ends
end s1