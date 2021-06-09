
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main

main:
	// X0 contiene la direccion base del framebuffer
 	mov x23, x0	// Save framebuffer base address to x20
	
	//COLORES
	movz x10, 0x01, lsl 16
	movk x10, 0x3368, lsl 00  // Azul
	
	movz x11, 0x99, lsl 16
	movk x11, 0x989A, lsl 00  // Gris

	movz x12, 0xFF, lsl 16
	movk x12, 0xCB9B, lsl 00  // Tarta
	
	movz x13, 0xFF, lsl 16
	movk x13, 0x98FF, lsl 00  // Rosa

	movz x14, 0xFE, lsl 16
	movk x14, 0x329E, lsl 00  // Cereza
	
	movz x15, 0xFF, lsl 16
	movk x15, 0x0000, lsl 00  // Rojo

	movz x16, 0xFF, lsl 16
	movk x16, 0x9101, lsl 00  // Naranja
	
	movz x17, 0xFF, lsl 16
	movk x17, 0xFF00, lsl 00  // Amarillo
	
	movz x18, 0x34, lsl 16
	movk x18, 0xFF00, lsl 00  // Verde
	
	movz x19, 0x01, lsl 16
	movk x19, 0x98FF, lsl 00  // Celeste
	
	movz x20, 0x68, lsl 16
	movk x20, 0x32FF, lsl 00  // Violeta
	
	movz x21, 0x00, lsl 16
	movk x21, 0x0000, lsl 00  // Negro
	
	movz x22, 0xFF, lsl 16
	movk x22, 0xFFFF, lsl 00  // Blanco

//PINTAR FONDO DE AZUL
	mov x2, SCREEN_HEIGH         // Y Size 
getFullX:
	mov x1, SCREEN_WIDTH         // X Size
paintBackground:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,paintBackground	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,getFullX	   // if not last row, jump

//CREMA DE LA GALLETA
//Línea 1
lineHeightCream1:
	mov x2,7 // Line height in pixels
setInitialPositionCream1:
	movz x24, 0x07, lsl 16
	movk x24, 0x358C, lsl 00 // 4 * (285 + (185 * 640)) - 4 * (640 - 70)
	add x0,x23,x24
newLineCream1:
	mov x1,70 // Line width in pixels
	add x0,x0,2280 // (640 - 70) * 4
paintLineCream1:
	stur w13,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,paintLineCream1	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,newLineCream1	   // if not last row, jump
//Línea 2
lineHeightCream2:
	mov x2,5 // Line height in pixels
setInitialPositionCream2:
	movz x24, 0x07, lsl 16
	movk x24, 0x7BA0, lsl 00 // 4 * (280 + (192 * 640)) - 4 * (640 - 80)
	add x0,x23,x24
newLineCream2:
	mov x1,80 // Line width in pixels
	add x0,x0,2240 // 4 * (640 - 80)
paintLineCream2:
	stur w13,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,paintLineCream2	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,newLineCream2	   // if not last row, jump
//Línea 3
lineHeightCream3:
	mov x2,54 // Line height in pixels
setInitialPositionCream3:
	movz x24, 0x07, lsl 16
	movk x24, 0xADB8, lsl 00 // 4 * (274 + (197 * 640)) - 4 * (640 - 92)
	add x0,x23,x24
newLineCream3:
	mov x1,92 // Line width in pixels
	add x0,x0,2192 // 4 * (640 - 92)
paintLineCream3:
	stur w13,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,paintLineCream3	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,newLineCream3	   // if not last row, jump
//Linea 4
lineHeightCream4:
	mov x2,5 // Line height in pixels
setInitialPositionCream4:
	movz x24, 0x09, lsl 16
	movk x24, 0xC9A0, lsl 00 // 4 * (280 + (251 * 640)) - 4 * (640 - 80)
	add x0,x23,x24
newLineCream4:
	mov x1,80 // Line width in pixels
	add x0,x0,2240 // 4 * (640 - 80)
paintLineCream4:
	stur w13,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,paintLineCream4	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,newLineCream4	   // if not last row, jump
//Línea 5
lineHeightCream5:
	mov x2,7 // Line height in pixels
setInitialPositionCream5:
	movz x24, 0x09, lsl 16
	movk x24, 0xFB8C, lsl 00 // 4 * (285 + (256 * 640)) - 4 * (640 - 70)
	add x0,x23,x24
newLineCream5:
	mov x1,70 // Line width in pixels
	add x0,x0,2280 // (640 - 70) * 4
paintLineCream5:
	stur w13,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,paintLineCream5	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,newLineCream5	   // if not last row, jump
	
	
//------------------------------- ACA COPIO Y PEGO-------------------------------------------------------------------


animation:
		bl paintBackground
	
		
		
		
		//linea superior negra lomo
		movz x0, 273
		movz x1, 180   //aca las coordenadas
		movz x2, 92
		movz x3, 5   //aca el ancho y largo
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //lila
		bl paintLine
		
		//otra linea negra de la cara 
		movz x0, 322
		movz x1, 235   //aca las coordenadas
		movz x2, 5
		movz x3, 26   //aca el ancho y largo
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //lila
		bl paintLine
		
		
		//otra linea negra de la cara mas arriba
		movz x0, 327
		movz x1, 212   //aca las coordenadas
		movz x2, 5
		movz x3, 24   //aca el ancho y largo
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //lila
		bl paintLine
		
		
		//linea negra grande lateral
		movz x0, 263
		movz x1, 192   //aca las coordenadas
		movz x2, 5
		movz x3, 80   //aca el ancho y largo
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //lila
		bl paintLine
		
		
		
		
	
	 //PUNTO NEGRO
		movz x0, 268
		movz x1, 186   //aca las coordenadas
		movz x2, 5
		movz x3, 6  //aca el ancho y largo
		movz x4, 0x00, lsl 16
	        movk x4, 0x0000, lsl 00 //lila
		bl paintLine
		
		//rosa
		movz x0, 268
		movz x1, 192   //aca las coordenadas
		movz x2, 5
		movz x3, 80  //aca el ancho y largo
		movz x4, 0xFF, lsl 16
	        movk x4, 0xCB9B, lsl 00 //lila
		bl paintLine
		
		//CREMA
		mov x0, 271
		movz x1, 202
		movz x2, 92
		movz x3, 54
		movz x4, 0xFF, lsl 16
	        movk x4, 0x98FF, lsl 00 //rosa que representa a nyan cat aunque no es lo que hace en el gif pero es de prueba
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





