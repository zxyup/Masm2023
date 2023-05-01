cseg segment
          assume cs:cseg
    s1: ;主程序
          mov    ah,07
          int    21h
          cmp    al,13
          je     exit
          cmp    al,'1'
          jb     non
          cmp    al,'9'
          jbe    dig
          cmp    al,'A'
          jb     non
          cmp    al,'Z'
          jbe    dxzm
          cmp    al,'a'
          jb     non
          cmp    al,'z'
          jbe    xxzm


    dig: ; 判断为数字1-9
          mov    dl,al
          jmp    print

    non: ; 判断为其他字符
          mov    dl,'R'
          jmp    print

    dxzm:; 判断为大写字母
          mov    dl,'c'
          jmp    print

    xxzm: ;判断为小写字母
          mov    dl,'C'
          jmp    print

    print:;打印
          mov    ah,02h
          int    21h
          jmp    s1


    exit: ;退出
          mov    ah,4ch
          int    21h
cseg ends
end s1