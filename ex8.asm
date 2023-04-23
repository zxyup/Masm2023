dseg segment
	mess   db    'Please input str:',13,10,'$'
	       strin label byte
	max    db    50
	act    db    0
	str    db    50 dup(?)
	result db    13,10,50 dup(?),13,10,'$'
dseg ends
cseg segment
	      assume cs:cseg,ds:dseg,es:dseg
	s1:   
	      mov    ax,dseg
	      mov    ds,ax
	      mov    es,ax
	      cld
	      lea    si,str
	      lea    di,result[2]

	      lea    dx,mess
	      mov    ah,09h
	      int    21h
	      lea    dx,strin
	      mov    ah,0ah
	      int    21h
	      mov    al,act
	      cbw
	      mov    cx,ax


	next: 
	      lodsb
	      cmp    al,'A'
	      jb     non
	      cmp    al,'Z'
	      jbe    upper
	      cmp    al,'a'
	      je    non
	      cmp    al,'z'
	      jbe    lower
	      jmp    non

	lower:
	      sub    al,20h
	      jmp    non


	upper:
	      add    al,20h
	      jmp    non


	non:  
	      stosb
	      dec    cx
	      jnz    next

	      mov    al,act
	      cbw
	      mov    si,ax
	      mov    result[si],13
	      mov    result[si+1],10
	      mov    result[si+2],'$'


	      lea    dx,result
	      mov    ah,09h
	      int    21h
	      mov    ah,4ch
	      int    21h
cseg ends
end s1
