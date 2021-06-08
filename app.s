
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32

.globl main

main:
	// X0 contiene la direccion base del framebuffer
 	mov x23, x0	// Save framebuffer base address to x23
	
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
mov x1,70 // Line width in pixels
mov x2,7 // Line height in pixels
mov x3,2280 // 4 * (640 - line width)
mov x4, x1 // Auxiliar variable
movz x24, 0x07, lsl 16
movk x24, 0x358C, lsl 00 // 4 * (285 + (185 * 640)) - x3
add x0,x23,x24 // Set initial position to x0
add w4,w13,wzr // Set color
newLine:
	mov x1,x4
	add x0,x0,x3
paintLine:
	stur w4,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,paintLine	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,newLine	   // if not last row, jump

InfLoop: 
	b InfLoop
