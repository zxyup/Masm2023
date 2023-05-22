dseg segment
    ten  db   10
    hund db   100
    date label byte
        rq   db   '2023/05/22-'
        hour db   "00:"
        min  db   '00:'
        sec  db   '00',13,10,'$'
dseg ends
cseg segment
    s1:  
         assume cs:cseg,ds:dseg
         mov    ax,dseg
         mov    ds,ax
         mov bh,61
         
    mloop:
        mov ah,2ch
        int 21h
        ;CH:CL=时:分
        ;DH:DL=秒:1/100秒
        cmp dh,bh
        je  mloop
        mov    bh,dh
        
        call update

         lea    dx,date
         mov    ah,9
         int    21h
         jmp   mloop

         mov    ah,4ch
         int    21h
;子程序:更新时间
;功能：更新时间
;入口参数：ch,cl,dh,dl
;出口参数  date
update proc
mov al,ch
        mov ah,0
        div ten
        add al,30h
        add ah,30h
        mov hour[0],al
        mov hour[1],ah

        mov al,cl
        mov ah,0
        div ten
        add al,30h
        add ah,30h
        mov min[0],al
        mov min[1],ah

        mov al,dh
        mov ah,0
        div ten
        add al,30h
        add ah,30h
        mov sec[0],al
        mov sec[1],ah
ret
update endp

cseg ends
end s1