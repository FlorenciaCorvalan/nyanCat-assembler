
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main

main:
	// X0 contiene la direccion base del framebuffer
 	mov x23, x0	// Save framebuffer base address to x20
 	
 	bl paintBackground
	
	//PRIMERA COLUMNA ARCOIRIS
		//rojo
		mov x0, 0
		movz x1, 181
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//orange
		mov x0, 0
		movz x1, 197
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x9101, lsl 00 
		bl paintLine
		
		//yellow
		mov x0, 0
		movz x1, 213
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//green
		mov x0, 0
		movz x1, 229
		movz x2, 45
		movz x3, 16
		movz x4, 0x34, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//celeste
		mov x0, 0
		movz x1, 245
		movz x2, 45
		movz x3, 16
		movz x4, 0x01, lsl 16
	        movk x4, 0x98FF, lsl 00 
		bl paintLine
		
		//violet
		mov x0, 0
		movz x1, 261
		movz x2, 45
		movz x3, 16
		movz x4, 0x68, lsl 16
	        movk x4, 0x32FF, lsl 00 
		bl paintLine
		
		
		// segunda columna arcoiris---------------------------------------------------
		//rojo
		mov x0, 43
		movz x1, 176
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//orange
		mov x0, 43
		movz x1, 192
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x9101, lsl 00 
		bl paintLine
		
		//yellow
		mov x0, 43
		movz x1, 208
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//green
		mov x0, 43
		movz x1, 224
		movz x2, 45
		movz x3, 16
		movz x4, 0x34, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//celeste
		mov x0, 43
		movz x1, 240
		movz x2, 45
		movz x3, 16
		movz x4, 0x01, lsl 16
	        movk x4, 0x98FF, lsl 00 
		bl paintLine
		
		//violet
		mov x0, 43
		movz x1, 256
		movz x2, 45
		movz x3, 16
		movz x4, 0x68, lsl 16
	        movk x4, 0x32FF, lsl 00 
		bl paintLine
		
		
		//TERCERA COLUMNA
		//rojo
		mov x0, 86
		movz x1, 181
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//orange
		mov x0, 86
		movz x1, 197
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x9101, lsl 00 
		bl paintLine
		
		//yellow
		mov x0, 86
		movz x1, 213
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//green
		mov x0, 86
		movz x1, 229
		movz x2, 45
		movz x3, 16
		movz x4, 0x34, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//celeste
		mov x0, 86
		movz x1, 245
		movz x2, 45
		movz x3, 16
		movz x4, 0x01, lsl 16
	        movk x4, 0x98FF, lsl 00 
		bl paintLine
		
		//violet
		mov x0, 86
		movz x1, 261
		movz x2, 45
		movz x3, 16
		movz x4, 0x68, lsl 16
	        movk x4, 0x32FF, lsl 00 
		bl paintLine
		
		//CUARTA COLUMNA
		//rojo
		mov x0, 172
		movz x1, 181
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//orange
		mov x0, 172
		movz x1, 197
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x9101, lsl 00 
		bl paintLine
		
		//yellow
		mov x0, 172
		movz x1, 213
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//green
		mov x0, 172
		movz x1, 229
		movz x2, 45
		movz x3, 16
		movz x4, 0x34, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//celeste
		mov x0, 172
		movz x1, 245
		movz x2, 45
		movz x3, 16
		movz x4, 0x01, lsl 16
	        movk x4, 0x98FF, lsl 00 
		bl paintLine
		
		//violet
		mov x0, 172
		movz x1, 261
		movz x2, 45
		movz x3, 16
		movz x4, 0x68, lsl 16
	        movk x4, 0x32FF, lsl 00 
		bl paintLine
		
		
		// QUINTA columna arcoiris---------------------------------------------------
		//rojo
		mov x0, 127
		movz x1, 176
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//orange
		mov x0, 127
		movz x1, 192
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x9101, lsl 00 
		bl paintLine
		
		//yellow
		mov x0, 127
		movz x1, 208
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//green
		mov x0, 127
		movz x1, 224
		movz x2, 45
		movz x3, 16
		movz x4, 0x34, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//celeste
		mov x0, 127
		movz x1, 240
		movz x2, 45
		movz x3, 16
		movz x4, 0x01, lsl 16
	        movk x4, 0x98FF, lsl 00 
		bl paintLine
		
		//violet
		mov x0, 127
		movz x1, 256
		movz x2, 45
		movz x3, 16
		movz x4, 0x68, lsl 16
	        movk x4, 0x32FF, lsl 00 
		bl paintLine
		
		//violet
		mov x0, 127
		movz x1, 256
		movz x2, 45
		movz x3, 16
		movz x4, 0x68, lsl 16
	        movk x4, 0x32FF, lsl 00 
		bl paintLine
		
		
		
	
		
		
		
		
		
	
	
	
		
		//-------------	--------------------------------------------------
		// Loop infinito
		//add x19, x19, #1
		//mov x0, 0xFFFFF
		//bl delay a definir porque algo anda mal
		
	InfLoop: 
		b InfLoop
	
//------------------------------------------------------------------funciones----------------------------------	
	paintBackground:
		mov x0, x23
	
		movz x2, 0x01, lsl 16
	        movk x2, 0x3368, lsl 00   // azul
		movz x1, 0xB000
		movk x1, 0x4, LSL #16
	
	super_loop0:
		stur x2,[x0]	   // Set color of pixel N
	
		add x0,x0,4	   // Next pixel
		sub x1,x1,1	   // decrement X counter
		cbnz x1,super_loop0	   // If not end row jump
		ret
	 
	
	paintLine: // x0: X, x1: Y, x2: W, x3: H, x4: Color
	
	paintLinefila: 
		mov	   x5, SCREEN_WIDTH
		mul    x5, x1, x5
		add    x5, x5, x0
		lsl	   x5, x5, #2
		add    x5, x5, x23
		mov    x6, x2
	paintLinecolumna:
			str x4, [x5]
			add x5, x5, #4
			sub x6, x6, #1
			cbnz x6, paintLinecolumna
		add x1, x1, #1
		sub x3, x3, #1
		cbnz x3, paintLinefila
	
		ret


//r


