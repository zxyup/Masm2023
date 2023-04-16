dseg segment
     mess db 'Hello Word!', 0dh,0ah,'My name is Derek, and my num is 35320212200544', 0dh,0ah,24h
dseg ends
sseg segment PARA STACK
          dw 256 dup(?)
sseg ends

cseg segment
          assume cs:cseg,ds:dseg
     beg: mov    ax,dseg
          mov    ds,ax
          mov    dx,offset mess
          mov    ah,9
          int    21h
          mov    ah,4ch
          int    21h
cseg ends
end beg