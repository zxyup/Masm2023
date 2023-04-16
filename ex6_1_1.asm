data segment ;定义数据段
x dw  0238h
y dw 7238h
z dw 356ah
v dw 1234h
ans dw 2 dup(?)
data ends
;-------------------
code segment ;定义代码段
	 assume cs:code,ds:data
start:  
        mov ax,data
		mov ds,ax
	    mov ax,x
	    imul y
		mov cx,ax
		mov bx,dx
		mov ax,z
		cwd
		add cx,ax
		adc bx,dx
		sub cx,540
		sbb bx,0
		mov ax,v
		cwd
		sub ax,cx
		sbb dx,bx
		idiv x
		mov ans,ax
		mov ans+2,dx
		mov ah,4cH
		int 21H
code ends
end start
