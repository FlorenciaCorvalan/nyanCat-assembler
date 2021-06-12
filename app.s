
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main

main:
	// X0 contiene la direccion base del framebuffer
 	mov x23, x0	// Save framebuffer base address to x20
 	
 	bl paintBackground
 	 
 	 movz x7, 176
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
		
 	
 	mov x7, 302
 	movz x8, 209
 	//CONTORNO
		mov x0, x7
		mov x1, x8
		movz x2, 5
		movz x3, 20
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine //lateral izq
		
		add x0, x7, 5
		sub x1, x8, 6
		movz x2, 11
		movz x3, 6
		bl paintLine //sup
		
		add x0, x7, 16
		add x1, x8, 0
		movz x2, 5
		movz x3, 5
		bl paintLine //vertice 
		
		add x0, x7, 21
		add x1, x8, 5
		movz x2, 6
		movz x3, 6
		bl paintLine //vertice abajo izquierda
	
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
		
		mov x7, 176
		
		
		//tail1
		mov x0, 231
		movz x1, 213
		movz x2, 6
		movz x3, 16
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//tail2
		mov x0, 237
		movz x1, 213
		movz x2, 16
		movz x3, 6
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		//tail3
		mov x0, 247
		movz x1, 219
		movz x2, 11
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
//-----------------------------------------------------------------------------------------------------------------------------------------



	
		
		
		
	
		
		
		
		
		
	
	
	
		
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
		
//----------------------------------------------------------------------------------------------------------------------

//CABEZA DEL GATO

catHead:
	       sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		//CONTORNO
		mov x0, x7
		mov x1, x8
		movz x2, 5
		movz x3, 20
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine 
		
		add x0, x7, 0
		add x1, x8, 21
		movz x2, 75
		movz x3, 26
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 
		bl paintLine 
		
		add x0, x7, 10
		add x1, x8, 53
		movz x2, 54
		movz x3, 5
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 
		bl paintLine 
		
		add x0, x7, 16
		add x1, x8, 5
		movz x2, 15
		movz x3, 20
		movz x4, 0x99, lsl 16   //NO SE PINTA EL CUADRADO
	        movk x4, 0x989A
	        
	        add x0, x7, 16
		add x1, x8, 5
		movz x2, 7
		movz x3, 7
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A
		
		
		add x0, x7, 5
		add x1, x8, 11
		movz x2, 20
		movz x3, 7
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 
		bl paintLine
		
		add x0, x7, 53
		add x1, x8, 5
		movz x2, 20
		movz x3, 16
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 
		bl paintLine 
		
		add x0, x7, 59
		add x1, x8, 0
		movz x2, 12
		movz x3, 6
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 
		bl paintLine 
		
		add x0, x7, 5
		add x1, x8, 48
		movz x2, 65
		movz x3, 5
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 //negro
		bl paintLine 
		
		
		add x0, x7, 5
		sub x1, x8, 6
		movz x2, 10
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine //contorno arriba
		
		add x0, x7, 15
		sub x1, x8, 1
		movz x2, 5
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine //contorno arriba
		
		add x0, x7, 19
		add x1, x8, 5
		movz x2, 6
		movz x3, 6
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine //contorno arriba
		
		add x0, x7, 25
		add x1, x8, 10
		movz x2, 25
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine //contorno arriba
		
		add x0, x7, 53
		add x1, x8, 0
		movz x2, 6
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine //contorno arriba
		
		add x0, x7, 16
		add x1, x8, 27
		movz x2, 5
		movz x3, 5
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFFFF, lsl 00 //negro
		bl paintLine //contorno arriba
		
		add x0, x7, 53
		add x1, x8, 27
		movz x2, 5
		movz x3, 5
		movz x4, 0xFF, lsl 16
	        movk x4, 0xFFFF, lsl 00 
		bl paintLine 
		
		add x0, x7, 53
		add x1, x8, 32
		movz x2, 6
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		add x0, x7, 21
		add x1, x8, 27
		movz x2, 6
		movz x3, 10
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 58
		add x1, x8, 27
		movz x2, 6
		movz x3, 10
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		sub x0, x7, 6
		add x1, x8, 21
		movz x2, 6
		movz x3, 26
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 16
		add x1, x8, 32
		movz x2, 5
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 0
		add x1, x8, 48
		movz x2, 5
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 5
		add x1, x8, 53
		movz x2, 5
		movz x3, 6
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 21
		add x1, x8, 48
		movz x2, 38
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 43
		add x1, x8, 32
		movz x2, 5
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 5
		add x1, x8, 0
		movz x2, 11
		movz x3, 26
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 //negro
		bl paintLine //contorno arriba
		
		add x0, x7, 16
		add x1, x8, 16
		movz x2, 53
		movz x3, 11
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 27
		add x1, x8, 27
		movz x2, 16
		movz x3, 15
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 43
		add x1, x8, 27
		movz x2, 10
		movz x3, 5
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 48
		add x1, x8, 32
		movz x2, 6
		movz x3, 15
		movz x4, 0x99, lsl 16
	        movk x4, 0x989A, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 21
		add x1, x8, 43
		movz x2, 6
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 37
		add x1, x8, 43
		movz x2, 6
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine 
		
		add x0, x7, 53
		add x1, x8, 43
		movz x2, 6
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 59
		sub x1, x8, 6
		movz x2, 11
		movz x3, 6
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 70
		sub x1, x8, 0
		movz x2, 5
		movz x3, 20
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 75
		add x1, x8, 21
		movz x2, 5
		movz x3, 26
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 70
		add x1, x8, 48
		movz x2, 5
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 64
		add x1, x8, 53
		movz x2, 6
		movz x3, 6
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //negro
		bl paintLine
		
		add x0, x7, 42
		add x1, x8, 59
		movz x2, 23
		movz x3, 5
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 
		bl paintLine
		
		add x0, x7, 5
		add x1, x8, 38
		movz x2, 12
		movz x3, 11
		movz x4, 0xFF, lsl 16
	        movk x4, 0x989D, lsl 00 
		bl paintLine
		
		add x0, x7, 64
		add x1, x8, 37
		movz x2, 11
		movz x3, 11
		movz x4, 0xFF, lsl 16
	        movk x4, 0x989D, lsl 00 
		bl paintLine
		
		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack
		
		ret


		





















