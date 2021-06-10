.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main

main:
	// X0 contiene la direccion base del framebuffer
	mov x23, x0	// Save framebuffer base address to x23
        mov x19, #0
	
	animation:
		bl paintBackground

		mov x7, 176
		bl paintPopTart

		bl paintRainbow1
		
		//b animation
	InfLoop: 
		b InfLoop
	
//----------------------------------funciones----------------------------------	
	paintBackground:
		mov x0, x23
	
		movz x2, 0x01, lsl 16
	        movk x2, 0x3368, lsl 00   // azul
		movz x1, 0xB000
		movk x1, 0x4, lsl 16
	
	super_loop0:
		stur x2,[x0]	   // Set color of pixel N
	
		add x0,x0,4	   // Next pixel
		sub x1,x1,1	   // decrement X counter
		cbnz x1,super_loop0	   // If not end row jump
		ret
	 
	
	paintLine: // x0: X, x1: Y, x2: W, x3: H, x4: Color
	add x3, x3, #1
	
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

	paintPopTart:
		//CONTORNO
		movz x0, 274
		mov x1, x7
		movz x2, 92
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine //contorno arriba
		add x1, x7, 91
		movz x2, 92
		movz x3, 5
		bl paintLine //contorno abajo
		movz x0, 269
		add x1, x7, 5
		movz x2, 5
		movz x3, 5
		bl paintLine //vertice arriba izquierda
		add x1, x7, 85
		movz x3, 5
		bl paintLine //vertice abajo izquierda
		movz x0, 366
		add x1, x7, 5
		movz x3, 5
		bl paintLine //vertice arriba derecha
		movz x0, 264
		add x1, x7, 10
		movz x3, 75
		bl paintLine //contorno izquierda
		movz x0, 371
		add x1, x7, 10
		movz x3, 75
		bl paintLine //contorno derecha

		//MASA
		movz x0, 274
		add x1, x7, 5
		movz x2, 92
		movz x3, 5
		movz x4, 0xFF, lsl 16
	        movk x4, 0xCB9B, lsl 00 //color masa
		bl paintLine //linea de arriba
		add x1, x7, 85
		movz x3, 5
		bl paintLine //linea de abajo
		movz x0, 269
		add x1, x7, 10
		movz x2, 102
		movz x3, 75
		bl paintLine //cuerpo

		//CREMA
		movz x0, 285
		add x1, x7, 10
		movz x2, 70
		movz x3, 5
		movz x4, 0xFF, lsl 16
	        movk x4, 0x98FF, lsl 00 //color crema
		bl paintLine //linea de arriba 1
		add x1, x7, 80
		movz x3, 5
		bl paintLine //linea de abajo 1
		movz x0, 280
		add x1, x7, 15
		movz x2, 80
		movz x3, 5
		bl paintLine //linea de arriba 2
		add x1, x7, 75
		movz x3, 5
		bl paintLine //linea de abajo 2
		movz x0, 274
		add x1, x7, 20
		movz x2, 92
		movz x3, 60
		bl paintLine //cuerpo

		//CEREZAS
		movz x0, 285
		add x1, x7, 20
		movz x2, 5
		movz x3, 5
		movz x4, 0xFE, lsl 16
	        movk x4, 0x329E, lsl 00 //color cereza
		bl paintLine //cereza 1
		movz x0, 312
		add x1, x7, 16
		movz x3, 5
		bl paintLine //cereza 2
		movz x0, 328
		add x1, x7, 16
		movz x3, 5
		bl paintLine //cereza 3
		movz x0, 350
		add x1, x7, 26
		movz x3, 6
		bl paintLine //cereza 4
		movz x0, 307
		add x1, x7, 37
		movz x3, 6
		bl paintLine //cereza 5
		movz x0, 290
		add x1, x7, 48
		movz x2, 6
		movz x3, 5
		bl paintLine //cereza 6
		movz x0, 312
		add x1, x7, 53
		movz x2, 5
		movz x3, 6
		bl paintLine //cereza 7
		movz x0, 279
		add x1, x7, 59
		movz x3, 5
		bl paintLine //cereza 8
		movz x0, 301
		add x1, x7, 69
		movz x2, 6
		movz x3, 6
		bl paintLine //cereza 9
		movz x0, 285
		add x1, x7, 75
		movz x2, 5
		movz x3, 5
		bl paintLine //cereza 10

	paintRainbow1:
		movz x7, 0
		movz x8, 181
		bl paintRainbowColumn
		add x7, x7, 45
		sub x8, x8, 5
		bl paintRainbowColumn
		ret

	paintRainbowColumn:
		//rojo
		mov x0, x7
		mov x1, x8
		movz x2, 45
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//orange
		add x1, x8, 16
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0x9101, lsl 00 
		bl paintLine
		
		//yellow
		add x1, x8, 32
		movz x3, 16
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//green
		add x1, x8, 48
		movz x3, 16
		movz x4, 0x34, lsl 16
	        movk x4, 0xFF00, lsl 00 
		bl paintLine
		
		//celeste
		add x1, x8, 64
		movz x3, 16
		movz x4, 0x01, lsl 16
	        movk x4, 0x98FF, lsl 00 
		bl paintLine
		
		//violet
		add x1, x8, 80
		movz x3, 16
		movz x4, 0x68, lsl 16
	        movk x4, 0x32FF, lsl 00 
		bl paintLine

		ret
	





