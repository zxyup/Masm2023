dseg segment
    mess db    'Please input str:',13,10,'$'
         strin label byte
    max  db    50
    act  db    ?
    str  db    50 dup(?)
dseg ends

stack segment
          dw  50 dup(?)
          top label word
stack ends


cseg segment
         assume cs:cseg,ds:dseg,ss:stack
    s1:  ;初始化并读入数据
         mov    ax,dseg
         mov    ds,ax
         lea    dx,mess
         mov    ah,09
         int    21h
         lea    dx,strin
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
            
         ;把实际输入数目扩展并传给cx    
         mov    al,act
         cbw
         mov    cx,ax
         add    cx,1

    next:;逆序打印字符串中的字符
         mov    si,cx
         add    si,1
         mov    dl,strin[si]
         mov    ah,2
         int    21h
         dec    cx
         jnz    next
         mov    dl,13
         mov    ah,02
         int    21h
         mov    dl, 10
         mov    ah,02
         int    21h
         jmp    s1

    exit:;退出
         mov    ah,4ch
         int    21h
cseg ends
end s1


