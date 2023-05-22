dseg segment
       ten  db 10
       hund db 100
       mess db 'Please input next num:',13,10,'$'
       nums db 10 dup(?),13,10,'$'
dseg ends

cseg segment
                assume cs:cseg,ds:dseg
       init:    
                mov    ax,dseg
                mov    ds,ax
       start:   
                mov    cx,10
       in1:
              mov    di,10
              mov    ch,0
              sub    di,cx
              call   input
              mov    ch,0
              dec    cx
              cmp    cx,0
              jne    in1

              call sort

                mov    cx,10
       out1:    
                mov    di,10
                mov    ch,0
                sub    di,cx
                call   output
                dec    cx
                cmp    cx,0
                jne    out1




       exit:    
                mov    ah,4ch
                int    21h

;INPUT 子程序：
;功能：实现从键盘输入一个十进制数并存在nums中
;入口参数：di
;出口参数
input proc
                lea    dx,mess               ;读入数字
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
                mov    nums[di],dl
                ret
input endp
;OUTPUT 子程序：
;功能：输出nums中的数字
;入口参数：di
;出口参数
output proc
                mov    al,nums[di]
                mov    ax,0
                div    hund
                cmp    al,0
                mov    ch,ah
                je     p2
                mov    ah,2
                mov    dl,30h
                add    dl,al
                int    21h
       p2:      
                mov    al,ch
                mov    ah,0
                div    ten
                cmp    al,0
                mov    ch,ah
                je     p3
                mov    ah,2
                mov    dl,30h
                add    dl,al
                int    21h
       p3:      
                mov    dl,30h
                add    dl,ch
                int    21h

                ret
output endp
;子程序:冒泡排序
;功能：冒泡排序nums中的数字
;入口参数：nums
;出口参数
sort proc near                               
                mov    cl, 9 
                mov    ch,0
                mov    di,0
                mov    si,0
       loop1:                    ;第一层循环
                mov    al, [si]
                push   cx
                mov    di, si
       loop2:                   ;第二层循环
                inc    di
                mov    dl,[di]
                cmp    al,dl
                ja     continue  ;小于才交换
                xchg   ax,dx
                mov    [si],al
                mov    [di],dl
       continue:
                loop   loop2
                pop    cx
                inc    si
                loop   loop1
                ret
sort endp

cseg ends
end init