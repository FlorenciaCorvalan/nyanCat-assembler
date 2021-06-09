
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main

main:
	// X0 contiene la direccion base del framebuffer
	mov x23, x0	// Save framebuffer base address to x23
        mov x19, #0
	
	//COLORES
//	movz x10, 0x01, lsl 16
//	movk x10, 0x3368, lsl 00  // Azul
//	
//	movz x11, 0x99, lsl 16
//	movk x11, 0x989A, lsl 00  // Gris
//
//	movz x12, 0xFF, lsl 16
//	movk x12, 0xCB9B, lsl 00  // Tarta
//	
//	movz x13, 0xFF, lsl 16
//	movk x13, 0x98FF, lsl 00  // Rosa
//
//	movz x14, 0xFE, lsl 16
//	movk x14, 0x329E, lsl 00  // Cereza
//	
//	movz x15, 0xFF, lsl 16
//	movk x15, 0x0000, lsl 00  // Rojo
//
//	movz x16, 0xFF, lsl 16
//	movk x16, 0x9101, lsl 00  // Naranja
//	
//	movz x17, 0xFF, lsl 16
//	movk x17, 0xFF00, lsl 00  // Amarillo
//	
//	movz x18, 0x34, lsl 16
//	movk x18, 0xFF00, lsl 00  // Verde
//	
//	movz x19, 0x01, lsl 16
//	movk x19, 0x98FF, lsl 00  // Celeste
//	
//	movz x20, 0x68, lsl 16
//	movk x20, 0x32FF, lsl 00  // Violeta
//	
//	movz x21, 0x00, lsl 16
//	movk x21, 0x0000, lsl 00  // Negro
//	
//	movz x22, 0xFF, lsl 16
//	movk x22, 0xFFFF, lsl 00  // Blanco

//PINTAR FONDO DE AZUL
//	mov x2, SCREEN_HEIGH         // Y Size 
//getFullX:
//	mov x1, SCREEN_WIDTH         // X Size
//paintBackground:
//	stur w10,[x0]	   // Set color of pixel N
//	add x0,x0,4	   // Next pixel
//	sub x1,x1,1	   // decrement X counter
//	cbnz x1,paintBackground	   // If not end row jump
//	sub x2,x2,1	   // Decrement Y counter
//	cbnz x2,getFullX	   // if not last row, jump

//CREMA DE LA GALLETA
//Línea 1
//mov x1,70 // Line width in pixels
//mov x2,7 // Line height in pixels
//mov x3,2280 // 4 * (640 - line width)
//mov x4, x1 // Auxiliar variable
//movz x24, 0x07, lsl 16
//movk x24, 0x358C, lsl 00 // 4 * (285 + (185 * 640)) - x3
//add x0,x23,x24 // Set initial position to x0
//add w4,w13,wzr // Set color
//newLine:
//	mov x1,x4
//	add x0,x0,x3
//paintLine:
//	stur w4,[x0]	   // Set color of pixel N
//	add x0,x0,4	   // Next pixel
//	sub x1,x1,1	   // decrement X counter
//	cbnz x1,paintLine	   // If not end row jump
//	sub x2,x2,1	   // Decrement Y counter
//	cbnz x2,newLine	   // if not last row, jump

//--------------------------------------------------------------------------------------probando hacer funciones----
//esta parte sigue siendo main
animation:
		bl paintBackground

		mov x7, 176
		bl paintPopTart
		//-------------	--------------------------------------------------
		// Loop infinito
		add x19, x19, #1
		mov x0, 0xFFFFF
		//bl delay a definir porque algo anda mal
		//b animation
	InfLoop: 
		b InfLoop
	
//------------------------------------------------------------------funciones----------------------------------	
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

		ret
	





