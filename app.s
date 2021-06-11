.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main

main:
	// X0 contiene la direccion base del framebuffer
	mov x23, x0	// Save framebuffer base address to x23

	animation:
		//FRAME 1
		bl paintBackground

		mov x7, 0
		mov x8, 181
		bl paintRainbow1

		movz x7, 230
		movz x8, 390
		bl paintStar1

		movz x7, 70
		movz x8, 352
		bl paintStar2

		movz x7, 134
		movz x8, 154
		bl paintStar2

		movz x7, 586
		movz x8, 154
		bl paintStar2

		movz x7, 522
		movz x8, 353
		bl paintStar2

		movz x7, 506
		movz x8, 116
		bl paintStar4

		movz x7, 414
		movz x8, 68
		bl paintStar5

		movz x7, 188
		movz x8, 261
		bl paintStar6

		mov x7, 176
		bl paintPopTart

		bl paintLegsAndTail1
		
		//b animation
	InfLoop: 
		b InfLoop
	
//----------------------------------funciones----------------------------------	
	paintBackground:
		sub sp, sp, #8
		str x30, [sp]

		movz x0, 0
		movz x1, 0
		movz x2, SCREEN_WIDTH
		movz x3, SCREEN_HEIGH
		movz x4, 0x01, lsl 16
	        movk x4, 0x3368, lsl 00   // azul
		bl paintLine

		ldr x30, [sp]
		add sp, sp, #8

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
				str w4, [x5]
				add x5, x5, #4
				sub x6, x6, #1
				cbnz x6, paintLinecolumna
			add x1, x1, #1
			sub x3, x3, #1
			cbnz x3, paintLinefila
		
			ret

	paintPopTart:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

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

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintRainbow1:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		movz x7, 0
		movz x8, 181
		bl paintRainbowColumn
		add x7, x7, 42
		sub x8, x8, 5
		bl paintRainbowColumn
		add x7, x7, 42
		add x8, x8, 5
		bl paintRainbowColumn
		add x7, x7, 42
		sub x8, x8, 5
		bl paintRainbowColumn
		add x7, x7, 42
		add x8, x8, 5
		bl paintRainbowColumn
		add x7, x7, 42
		sub x8, x8, 5
		bl paintRainbowColumn
		add x7, x7, 42
		add x8, x8, 5
		bl paintRainbowColumn

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintRainbowColumn:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		//rojo
		mov x0, x7
		mov x1, x8
		movz x2, 42
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

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintStar1:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		mov x0, x7
		mov x1, x8
		movz x2, 6
		movz x3, 6
		movz x4, 0xFF, lsl 16
					movk x4, 0xFFFF, lsl 00
		bl paintLine

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintStar2:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		mov x0, x7
		mov x1, x8
		movz x2, 5
		movz x3, 5
		movz x4, 0xFF, lsl 16
					movk x4, 0xFFFF, lsl 00
		bl paintLine

		add x1, x8, 11
		movz x3, 5
		bl paintLine

		sub x0, x7, 6
		add x1, x8, 5
		movz x2, 6
		movz x3, 6
		bl paintLine

		add x0, x7, 5
		add x1, x8, 5
		movz x3, 6
		bl paintLine

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintStar3:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		mov x0, x7
		mov x1, x8
		movz x2, 6
		movz x3, 10
		movz x4, 0xFF, lsl 16
					movk x4, 0xFFFF, lsl 00
		bl paintLine

		add x1, x8, 16
		movz x3, 10
		bl paintLine

		sub x0, x7, 10
		add x1, x8, 10
		movz x2, 10
		movz x3, 6
		bl paintLine
		
		add x0, x7, 6
		add x1, x8, 10
		movz x3, 6
		bl paintLine

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintStar4:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		mov x0, x7
		mov x1, x8
		movz x2, 6
		movz x3, 11
		movz x4, 0xFF, lsl 16
					movk x4, 0xFFFF, lsl 00
		bl paintLine
		
		add x1, x8, 16
		movz x3, 6
		bl paintLine
		
		add x1, x8, 27
		movz x3, 11
		bl paintLine
		
		sub x0, x7, 16
		add x1, x8, 16
		movz x2, 11
		movz x3, 6
		bl paintLine

		add x0, x7, 11
		add x1, x8, 16
		movz x3, 6
		bl paintLine

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintStar5:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		mov x0, x7
		mov x1, x8
		movz x2, 5
		movz x3, 6
		movz x4, 0xFF, lsl 16
					movk x4, 0xFFFF, lsl 00
		bl paintLine
		
		add x1, x8, 33
		movz x3, 5
		bl paintLine
		
		add x0, x7, 11
		add x1, x8, 6
		movz x3, 5
		bl paintLine
		
		add x0, x7, 11
		add x1, x8, 27
		movz x3, 6
		bl paintLine
		
		add x0, x7, 16
		add x1, x8, 16
		movz x2, 6
		movz x3, 6
		bl paintLine
		
		sub x0, x7, 11
		add x1, x8, 6
		movz x2, 6
		movz x3, 5
		bl paintLine
		
		sub x0, x7, 11
		add x1, x8, 27
		movz x2, 6
		movz x3, 6
		bl paintLine
		
		sub x0, x7, 16
		add x1, x8, 16
		movz x2, 5
		movz x3, 6
		bl paintLine

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

	paintStar6:
		sub sp, sp, #8 //
		str x30, [sp]		// Push x30 to stack

		mov x0, x7
		mov x1, x8
		movz x2, 5
		movz x3, 6
		movz x4, 0xFF, lsl 16
					movk x4, 0xFFFF, lsl 00
		bl paintLine

		add x1, x8, 33
		movz x3, 5
		bl paintLine
		
		sub x0, x7, 16
		add x1, x8, 16
		movz x3, 6
		bl paintLine

		add x0, x7, 16
		add x1, x8, 16
		movz x3, 6
		bl paintLine

		ldr x30, [sp] //
		add sp, sp, #8 // Get original x30 from stack

		ret

		paintLegsAndTail1:
			sub sp, sp, #8 //
			str x30, [sp]		// Push x30 to stack
			//CONTORNO
			//Cola
			movz x0, 231
			movz x1, 213
			movz x2, 22
			movz x3, 6
			movz x4, 0x00, lsl 16
					movk x4, 0x0000, lsl 00
			bl paintLine

			movz x1, 219
			movz x2, 6
			movz x3, 10
			bl paintLine

			movz x0, 237
			movz x1, 224
			movz x2, 5
			movz x3, 11
			bl paintLine

			movz x0, 242
			movz x1, 229
			movz x3, 11
			bl paintLine

			movz x0, 247
			movz x1, 235
			movz x2, 6
			movz x3, 10
			bl paintLine

			movz x0, 253
			movz x1, 240
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 258
			movz x1, 240
			movz x2, 6
			movz x3, 11
			bl paintLine

			movz x0, 247
			movz x1, 219
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 253
			movz x1, 224
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 258
			movz x1, 229
			movz x2, 6
			movz x3, 6
			bl paintLine

			//Pata 1
			movz x1, 261
			movz x2, 16
			movz x3, 6
			bl paintLine

			movz x0, 253
			movz x1, 267
			movz x2, 6
			movz x3, 16
			bl paintLine

			movz x1, 278
			movz x2, 21
			movz x3, 6
			bl paintLine

			movz x0, 269
			movz x1, 272
			movz x2, 11
			movz x3, 6
			bl paintLine

			//Pata 2
			movz x0, 285
			movz x1, 272
			movz x2, 5
			movz x3, 11
			bl paintLine

			movz x1, 278
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 301
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			//Pata 3
			movz x0, 333
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			movz x0, 339
			movz x1, 278
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 350
			movz x1, 272
			movz x2, 5
			movz x3, 6
			bl paintLine

			//Pata 4
			movz x0, 360
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			movz x0, 366
			movz x1, 278
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x0, 376
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			//RELLENO
			//Cola
			movz x0, 237
			movz x1, 219
			movz x2, 10
			movz x3, 5
			movz x4, 0x99, lsl 16
					movk x4, 0x989A, lsl 00
			bl paintLine

			movz x0, 242
			movz x1, 224
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 247
			movz x1, 229
			movz x2, 11
			movz x3, 6
			bl paintLine

			movz x0, 253
			movz x1, 235
			movz x2, 11
			movz x3, 5
			bl paintLine

			//Pata 1
			movz x0, 258
			movz x1, 267
			movz x2, 11
			movz x3, 11
			bl paintLine

			movz x0, 269
			movz x1, 267
			movz x2, 5
			movz x3, 5
			bl paintLine

			//Pata 2
			movz x0, 290
			movz x1, 272
			movz x2, 11
			movz x3, 6
			bl paintLine

			//Pata 3
			movz x0, 339
			movz x1, 272
			movz x2, 11
			movz x3, 6
			bl paintLine

			//Pata 4
			movz x0, 366
			movz x1, 272
			movz x2, 11
			movz x3, 6
			bl paintLine

			ldr x30, [sp] //
			add sp, sp, #8 // Get original x30 from stack

			ret

		paintLegsAndTail2:
			sub sp, sp, #8 //
			str x30, [sp]		// Push x30 to stack
			//CONTORNO
			//Cola
			movz x0, 237
			movz x1, 219
			movz x2, 10
			movz x3, 5
			movz x4, 0x00, lsl 16
					movk x4, 0x0000, lsl 00
			bl paintLine

			movz x1, 235
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 231
			movz x1, 224
			movz x2, 6
			movz x3, 11
			bl paintLine

			movz x0, 247
			movz x1, 224
			movz x2, 6
			movz x3, 11
			bl paintLine

			movz x0, 242
			movz x1, 240
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 253
			movz x1, 229
			movz x2, 11
			movz x3, 6
			bl paintLine

			movz x1, 245
			movz x3, 6
			bl paintLine

			//Pata 1
			movz x0, 264
			movz x1, 261
			movz x2, 10
			movz x3, 6
			bl paintLine

			movz x1, 278
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x0, 258
			movz x1, 267
			movz x2, 6
			movz x3, 16
			bl paintLine

			movz x0, 274
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			//Pata 2
			movz x0, 285
			movz x1, 272
			movz x2, 5
			movz x3, 6
			bl paintLine

			movz x0, 290
			movz x1, 278
			movz x2, 17
			movz x3, 5
			bl paintLine

			movz x0, 301
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			//Pata 3
			movz x0, 339
			movz x1, 272
			movz x2, 5
			movz x3, 6
			bl paintLine

			movz x0, 344
			movz x1, 278
			movz x2, 17
			movz x3, 5
			bl paintLine

			movz x0, 355
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			//Pata 4
			movz x0, 366
			movz x1, 272
			movz x2, 5
			movz x3, 6
			bl paintLine

			movz x0, 371
			movz x1, 278
			movz x2, 17
			movz x3, 5
			bl paintLine

			movz x0, 382
			movz x1, 272
			movz x2, 6
			movz x3, 6
			bl paintLine

			//RELLENO
			//Cola
			movz x0, 237
			movz x1, 224
			movz x2, 10
			movz x3, 11
			movz x4, 0x99, lsl 16
					movk x4, 0x989A, lsl 00
			bl paintLine

			movz x0, 242
			movz x1, 235
			movz x2, 22
			movz x3, 5
			bl paintLine

			movz x0, 253
			movz x1, 240
			movz x2, 11
			movz x3, 5
			bl paintLine

			//Pata 1
			movz x0, 264
			movz x1, 267
			movz x2, 10
			movz x3, 11
			bl paintLine

			//Pata 2
			movz x0, 290
			movz x1, 272
			movz x2, 11
			movz x3, 6
			bl paintLine

			//Pata 3
			movz x0, 344
			movz x1, 272
			movz x2, 11
			movz x3, 6
			bl paintLine

			//Pata 4
			movz x0, 371
			movz x1, 272
			movz x2, 11
			movz x3, 6
			bl paintLine

			ldr x30, [sp] //
			add sp, sp, #8 // Get original x30 from stack

			ret

		paintLegsAndTail3:
			sub sp, sp, #8 //
			str x30, [sp]		// Push x30 to stack
			//CONTORNO
			//Cola
			movz x0, 258
			movz x1, 235
			movz x2, 6
			movz x3, 10
			movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00
			bl paintLine

			movz x0, 242
			movz x1, 240
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 231
			movz x1, 245
			movz x2, 11
			movz x3, 6
			bl paintLine

			movz x1, 251
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 237
			movz x1, 256
			movz x2, 21
			movz x3, 5
			bl paintLine

			movz x0, 253
			movz x1, 251
			movz x2, 11
			movz x3, 5
			bl paintLine

			//Pata 1
			movz x0, 264
			movz x1, 267
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x0, 264
			movz x1, 272
			movz x2, 5
			movz x3, 11
			bl paintLine

			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 280
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			//Pata 2
			movz x0, 290
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 296
			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 307
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 344
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 350
			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 360
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 371
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 376
			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 387
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			//RELLENO
			//Cola
			movz x0, 242
			movz x1, 245
			movz x2, 22
			movz x3, 6
			movz x4, 0x99, lsl 16
					movk x4, 0x989A, lsl 00
			bl paintLine

			movz x0, 237
			movz x1, 251
			movz x2, 16
			movz x3, 5
			bl paintLine

			//Pata 1
			movz x0, 269
			movz x1, 272
			movz x2, 5
			movz x3, 11
			bl paintLine

			movz x0, 274
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 2
			movz x0, 296
			movz x1, 278
			movz x2, 11
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 350
			movz x1, 278
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 376
			movz x1, 278
			movz x3, 5
			bl paintLine
			
			ldr x30, [sp] //
			add sp, sp, #8 // Get original x30 from stack

			ret

		paintLegsAndTail4:
			sub sp, sp, #8 //
			str x30, [sp]		// Push x30 to stack
			//CONTORNO
			//Cola
			movz x0, 253
			movz x1, 235
			movz x2, 11
			movz x3, 5
			movz x4, 0x00, lsl 16
					movk x4, 0x0000, lsl 00
			bl paintLine

			movz x1, 251
			movz x3, 5
			bl paintLine

			movz x0, 242
			movz x1, 240
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 237
			movz x1, 245
			movz x2, 5
			movz x3, 6
			bl paintLine

			movz x1, 261
			movz x2, 10
			movz x3, 6
			bl paintLine

			movz x0, 231
			movz x1, 251
			movz x2, 6
			movz x3, 10
			bl paintLine

			movz x0, 247
			movz x1, 251
			movz x2, 6
			movz x3, 10
			bl paintLine

			//Pata 1
			movz x0, 264
			movz x1, 267
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x1, 283
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x0, 258
			movz x1, 272
			movz x2, 6
			movz x3, 16
			bl paintLine

			movz x0, 274
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 2
			movz x0, 285
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 290
			movz x1, 283
			movz x2, 17
			movz x3, 5
			bl paintLine

			movz x0, 301
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 339
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 344
			movz x1, 283
			movz x2, 17
			movz x3, 5
			bl paintLine

			movz x0, 355
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 366
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 371
			movz x1, 283
			movz x2, 17
			movz x3, 5
			bl paintLine

			movz x0, 382
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//RELLENO
			//Cola
			movz x0, 253
			movz x1, 240
			movz x2, 11
			movz x3, 5
			movz x4, 0x99, lsl 16
					movk x4, 0x989A, lsl 00
			bl paintLine

			movz x0, 242
			movz x1, 245
			movz x2, 22
			movz x3, 6
			bl paintLine

			movz x0, 237
			movz x1, 251
			movz x2, 10
			movz x3, 10
			bl paintLine

			//Pata 1
			movz x0, 264
			movz x1, 272
			movz x2, 10
			movz x3, 11
			bl paintLine

			//Pata 2
			movz x0, 290
			movz x1, 278
			movz x2, 11
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 344
			movz x1, 278
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 371
			movz x1, 278
			movz x3, 5
			bl paintLine

			ldr x30, [sp] //
			add sp, sp, #8 // Get original x30 from stack

			ret

		paintLegsAndTail5:
			sub sp, sp, #8 //
			str x30, [sp]		// Push x30 to stack
			//CONTORNO
			//Cola
			movz x0, 231
			movz x1, 224
			movz x2, 22
			movz x3, 5
			movz x4, 0x00, lsl 16
					movk x4, 0x0000, lsl 00
			bl paintLine

			movz x1, 235
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 226
			movz x1, 229
			movz x2, 5
			movz x3, 11
			bl paintLine

			movz x0, 247
			movz x1, 229
			movz x2, 17
			movz x3, 6
			bl paintLine

			movz x0, 237
			movz x1, 240
			movz x2, 21
			movz x3, 5
			bl paintLine

			movz x0, 253
			movz x1, 245
			movz x2, 11
			movz x3, 6
			bl paintLine

			movz x0, 258
			movz x1, 235
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 1
			movz x1, 261
			movz x2, 6
			movz x3, 6
			bl paintLine

			movz x0, 253
			movz x1, 267
			movz x2, 21
			movz x3, 5
			bl paintLine

			movz x1, 283
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 247
			movz x1, 272
			movz x2, 6
			movz x3, 16
			bl paintLine

			movz x0, 264
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			//Pata 2
			movz x0, 274
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 280
			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 290
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 328
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 333
			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 344
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 355
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 360
			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 371
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//RELLENO
			//Cola
			movz x0, 231
			movz x1, 229
			movz x2, 16
			movz x3, 6
			movz x4, 0x99, lsl 16
					movk x4, 0x989A, lsl 00
			bl paintLine

			movz x0, 237
			movz x1, 235
			movz x2, 21
			movz x3, 5
			bl paintLine

			movz x0, 258
			movz x1, 240
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 1
			movz x0, 253
			movz x1, 272
			movz x2, 16
			movz x3, 6
			bl paintLine

			movz x1, 278
			movz x2, 11
			movz x3, 5
			bl paintLine

			//Pata 2
			movz x0, 280
			movz x1, 278
			movz x2, 10
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 333
			movz x1, 278
			movz x2, 10
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 360
			movz x1, 278
			movz x2, 10
			movz x3, 5
			bl paintLine

			ldr x30, [sp] //
			add sp, sp, #8 // Get original x30 from stack

			ret

			paintLegsAndTail6:
			sub sp, sp, #8 //
			str x30, [sp]		// Push x30 to stack
			//CONTORNO
			//Cola
			movz x0, 237
			movz x1, 219
			movz x2, 10
			movz x3, 5
			movz x4, 0x00, lsl 16
					movk x4, 0x0000, lsl 00
			bl paintLine

			movz x1, 235
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 231
			movz x1, 224
			movz x2, 6
			movz x3, 11
			bl paintLine

			movz x0, 247
			movz x1, 224
			movz x2, 6
			movz x3, 11
			bl paintLine

			movz x0, 253
			movz x1, 229
			movz x2, 11
			movz x3, 6
			bl paintLine

			movz x0, 242
			movz x1, 240
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 253
			movz x1, 245
			movz x2, 11
			movz x3, 6
			bl paintLine

			//Pata 1
			movz x0, 258
			movz x1, 261
			movz x2, 6
			movz x3, 6
			bl paintLine

			movz x0, 253
			movz x1, 267
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x1, 283
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 247
			movz x1, 272
			movz x2, 6
			movz x3, 16
			bl paintLine

			movz x0, 264
			movz x1, 267
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 269
			movz x1, 272
			movz x2, 5
			movz x3, 6
			bl paintLine

			//Pata 2
			movz x0, 274
			movz x1, 278
			movz x2, 6
			movz x3, 10
			bl paintLine

			movz x0, 280
			movz x1, 283
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x0, 290
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 328
			movz x1, 278
			movz x2, 6
			movz x3, 10
			bl paintLine

			movz x0, 333
			movz x1, 283
			movz x2, 10
			movz x3, 5
			bl paintLine

			movz x0, 344
			movz x1, 278
			movz x2, 6
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 355
			movz x1, 278
			movz x2, 5
			movz x3, 5
			bl paintLine

			movz x0, 360
			movz x1, 283
			movz x2, 16
			movz x3, 5
			bl paintLine

			movz x0, 371
			movz x1, 272
			movz x2, 5
			movz x3, 11
			bl paintLine

			//RELLENO
			//Cola
			movz x0, 237
			movz x1, 224
			movz x2, 10
			movz x3, 11
			movz x4, 0x99, lsl 16
					movk x4, 0x989A, lsl 00
			bl paintLine

			movz x0, 242
			movz x1, 235
			movz x2, 22
			movz x3, 5
			bl paintLine

			movz x0, 253
			movz x1, 240
			movz x2, 11
			movz x3, 5
			bl paintLine

			//Pata 1
			movz x0, 258
			movz x1, 267
			movz x2, 6
			movz x3, 5
			bl paintLine

			movz x0, 264
			movz x1, 272
			movz x2, 5
			movz x3, 6
			bl paintLine

			movz x0, 253
			movz x1, 272
			movz x2, 11
			movz x3, 11
			bl paintLine

			//Pata 2
			movz x0, 280
			movz x1, 278
			movz x2, 10
			movz x3, 5
			bl paintLine

			//Pata 3
			movz x0, 333
			movz x1, 278
			movz x2, 10
			movz x3, 5
			bl paintLine

			//Pata 4
			movz x0, 360
			movz x1, 278
			movz x2, 11
			movz x3, 5
			bl paintLine

			movz x0, 366
			movz x1, 272
			movz x2, 5
			movz x3, 6
			bl paintLine

			ldr x30, [sp] //
			add sp, sp, #8 // Get original x30 from stack

			ret

