
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
.equ MITAD_wid,                    320
.equ MITAD_hei,         220

.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x22, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	
	movz x10, 0x01, lsl 16
	movk x10, 0x3368, lsl 00  //Azul
	
	movz x11, 0x99, lsl 16
	movk x11, 0x989A, lsl 00  //Gris

	movz x12, 0xFF, lsl 16
	movk x12, 0xCB9B, lsl 00  //Tarta
	
	movz x13, 0xFF, lsl 16
	movk x13, 0x98FF, lsl 00  //Rosa

	movz x14, 0xFE, lsl 16
	movk x14, 0x329E, lsl 00  //Cereza
	
	movz x15, 0xFF, lsl 16
	movk x15, 0x0000, lsl 00  //Rojo

	movz x16, 0xFF, lsl 16
	movk x16, 0x9101, lsl 00  //Naranja
	
	movz x17, 0xFF, lsl 16
	movk x17, 0xFF00, lsl 00  //Amarillo
	
	movz x18, 0x34, lsl 16
	movk x18, 0xFF00, lsl 00  //Verde
	
	movz x19, 0x01, lsl 16
	movk x19, 0x98FF, lsl 00  //Celeste
	
	movz x20, 0x68, lsl 16
	movk x20, 0x32FF, lsl 00  //Violeta
	
	movz x21, 0x00, lsl 16
	movk x21, 0x0000, lsl 00  //Negro
	
	movz x21, 0xFF, lsl 16
	movk x21, 0xFFFF, lsl 00  //Blanco

	mov x2, SCREEN_HEIGH         // Y Size 
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,loop0	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump

//--------------------------------------------------------------------------------------------------------esto hice yo	
//loop4:  
  //     mov x3, MITAD_wid
       
//loop5: 
  //     mov x4, MITAD_hei	
       
       
//loop3: 
//        stur w18,[x0]	   // Set color of pixel N
//	add x0,x0,4	   // Next pixel
//	sub x1,x1,1	   // decrement X counter
//	cbnz x1,loop0	   // If not end row jump
//	sub x2,x2,1	   // Decrement Y counter
//	cbnz x2,loop1	   // if not last row, jump
	//---------------------------------------------------------------
	// Infinite Loop 

InfLoop: 
	b InfLoop
