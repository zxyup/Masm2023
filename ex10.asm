dataseg segment
    flag    db 0
    ten     db 10
    mess    db 'Please input num:',13,10,'$'
    yess    db 'It is prime',13,10,'$'
    noo      db 'It is not prime',13,10,'$'
dataseg ends

codeseg segment
            assume cs:codeseg, ds:dataseg
    init:  
            mov    ax , dataseg              ;初始化
            mov    ds , ax
    start:        
            call   input
            cmp    dx,0
            je     exit
            call jd
    print:  
            cmp    flag,1
            je     yesss
            lea dx,noo
            mov ah,9
            int 21h
            jmp start
    yesss:
            lea dx,yess
            mov ah,9
            int 21h
            jmp start
    exit:                                    ;退出
            mov    ah,4ch
            int    21h

;INPUT 子程序：
;功能：实现从键盘输入一个十进制数，并存储在AX/BX/某内存单元….
;入口参数：无
;出口参数：dx    
input proc
            lea    dx,mess                   ;读入数字
            mov    ah,09
            int    21h
            mov    dx,0
    inn:    
            mov    ah,1
            int    21h
            cmp    al,0dh
            je     re
            mov    ch,al
            mov    ax,dx
            cwd
            mul    ten
            sub    ch,30h
            add    al,ch
            mov    dx,ax
            jmp    inn
    re:
            ret   
input endp

;ISPrime 子程序：
;功能判断***寄存器或内存地址***中存储的数据是否为素数，并将FLAG所指向地址置0 或者1
;入口参数：dx
;出口参数：FLAG
jd proc
            mov    bx,dx
            mov    cx,dx
            sub    cx,1

    jdd:    
            mov    ax,bx
            mov    dx,0
            div    cx
            cmp    dx,0
            je     no
            dec    cx
            cmp    cx,1
            jne    jdd
    yes:    
            mov    flag,1
            jmp    res

    no:     
            mov    flag,0
            jmp    res

    res:    
                ret
jd endp

codeseg ends
    end init 
