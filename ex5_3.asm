dseg segment
    data1 db 36h,22h,10h
    data2 db 13h,11h,10h
    ans   db 4 dup(?)
dseg ends

cseg segment
         assume ds:dseg,cs:cseg
    s1:
         mov ax,dseg
         mov ds,ax
         mov    al,data1
         adc    al,data2
         mov    ans,al

         mov    al,data1+1
         adc    al,data2+1
         mov    ans+1,al

         mov    al,data1+2
         adc    al,data2+2
         mov    ans+2,al

         mov    ah,4ch
         int    21h

cseg ends

end s1

