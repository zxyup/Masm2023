dseg segment
	mess   db    'Please input str:',13,10,'$'
	       strin label byte
	max    db    50
	act    db    0
	str    db    50 dup(?)
	result db    50 dup(?),13,10,'$'
dseg ends
cseg segment
	      assume cs:cseg,ds:dseg,es:dseg
	s1:   
	      mov    ax,dseg
	      mov    ds,ax
	      mov    es,ax
	      cld
	      lea    si,str
	      lea    di,result

	      lea    dx,mess
	      mov    ah,09h
	      int    21h;输出提示信息
	      lea    dx,strin
	      mov    ah,0ah
	      int    21h;输入字符串
		  mov    dl,13
	      mov    ah,02
	      int    21h
	      mov    dl, 10
	      mov    ah,02
	      int    21h;换行
	      mov    al,act
	      cbw
	      mov    cx,ax


	next: 
	      lodsb;提取字符
	      cmp    al,'A'
	      jb     non
	      cmp    al,'Z'
	      jbe    upper
	      cmp    al,'a'
	      jb     non
	      cmp    al,'z'
	      jbe    lower
	      jmp    non

	lower:;小写字母
	      sub    al,20h
	      jmp    non


	upper:;大写字母
	      add    al,20h
	      jmp    non


	non:  ;处理后和不用处理的字符
	      stosb;存入缓冲区
	      dec    cx
	      jnz    next

	      mov    al,act
	      cbw
	      mov    si,ax
	      mov    result[si],13
	      mov    result[si+1],10
	      mov    result[si+2],'$'


	      lea    dx,result;输出
	      mov    ah,09h
	      int    21h
	      mov    ah,4ch
	      int    21h
cseg ends
end s1
