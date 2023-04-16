code segment
         assume cs:code
    s1:  
         mov    ax,0f3h
         sub    ax,0f3h

         mov    ah,4ch
         int    21h
code ends
end s1