dseg segment
    x    dw 0238h
    y    dw 7238h
    z    dw 356ah
    v    dw 1234h
    ans  dw 2 dup(?)
dseg ends

cseg segment
         assume cs:cseg,ds:dseg
    s1:  
         mov    ax,dseg
         mov    ds,ax

         mov    ax,x       ;x*y
         mov    bx,y
         imul   bx
         mov    bx,ax
         mov    cx,dx

         mov    ax,z       ;+z
         cwd
         add    bx,ax
         adc    cx,dx

         sub    bx,540     ;-540
         sbb    cx,0

         mov    ax,v       ;v-()
         cwd
         sub    ax,bx
         sbb    dx,cx

         idiv   x          ;/x

         mov    ans,ax
         mov    [ans+2],dx

         mov    ah,4ch
         int    21h

cseg ends
end s1
