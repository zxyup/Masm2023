cseg segment
          assume cs:cseg
    s1:   
          mov    ax,01h
          mov    cx,00h
          mov    dx,00h

    again:
          add    dx,ax
          inc    cx
          cmp    cx,21
          jb     again

          mov    ah,4ch
          int    21h

cseg ends
end s1