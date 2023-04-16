dataseg segment
    four    db     4
    hund    db     100
    fhud    dw     400
    noo     db     'No',13,10,'$'
    yess    db     'Yes',13,10,'$'
    mess    db     'Please input year:',13,10,'$'
    yearin label byte
        max     db     5
        act     db     ?
        year    db     5 dup(?)
dataseg ends

codeseg segment
            assume cs:codeseg, ds:dataseg
    start:  
            mov    ax , dataseg;初始化
            mov    ds , ax

            lea    dx,mess  ;读入年份
            mov    ah,09
            int    21h
            lea    dx,yearin
            mov    ah,0ah
            int    21h
            mov    dl,13
            mov    ah,02
            int    21h
            mov    dl, 10
            mov    ah,02
            int    21h
            cmp    act,0
            je     exit
    
            mov    cl,year+1  
            mov    ch,year ;将年份转化为无符号数
            mov    bl,year+3
            mov    bh,year+2
    
            mov    dl,10;将年份转化为无符号数
            xor    cx,3030h
            mov    al,ch
            mul    dl
            sub    ch,ch
            add    cx,ax
    
            xor    bx,3030h
            mov    al,bh;将年份转化为无符号数
            mul    dl
            sub    bh,bh
            add    bx,ax

            mov    al,cl;将年份转化为无符号数
            mul    hund
            add    ax,bx
            mov    bx,ax
    
            and    ax,3h;判断年份能不能整除4
            jnz    no;不能，跳转输出no

            mov    ax,bx;判断年份能不能整除100
            div    hund
            cmp    ah,0
            jne    yes;不能，跳转输出yes
   
            mov    ax,bx;判断年份能不能整除400
            cwd
            div    fhud
            cmp    dx,0
            je     yes;能，跳转输出yes
            jmp    no;跳转输出no

    no:     ;跳转输出no
            mov    ah,09h
            lea    dx,noo
            int    21h
            jmp    start

    yes:    ;跳转输出yes
            mov    ah,09h
            lea    dx,yess
            int    21h
            jmp    start

    exit:   ;退出
            mov    ah,4ch
            int    21h

codeseg ends
    end start 
