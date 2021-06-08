
.equ SCREEN_WIDTH, 		640
.equ SCREEN_HEIGH, 		480
.equ BITS_PER_PIXEL,  	32
.equ MITAD_wid,                    320
.equ MITAD_hei,         220

.globl main
main:
	// X0 contiene la direccion base del framebuffer
 	mov x20, x0	// Save framebuffer base address to x20	
	//---------------- CODE HERE ------------------------------------
	
	movz x10, 0x00, lsl 16
	movk x10, 0x228A, lsl 00  //azul
	
	movz x11, 0x80, lsl 16
	movk x11, 0x838E, lsl 00  //gris
	
	movz x12, 0xFE, lsl 16
	movk x12, 0xA4FF, lsl 00  //rosa del cuerpo
	
	movz x13, 0xFF, lsl 16
	movk x13, 0x140D, lsl 00  //Rojo
	
	movz x14, 0xFF, lsl 16
	movk x14, 0xDA0D, lsl 00  //Amarrillo
	
	movz x15, 0xFF, lsl 16
	movk x15, 0x910D, lsl 00  //Naranja
	
	movz x16, 0x14, lsl 16
	movk x16, 0xDE00, lsl 00  //verde
	
	movz x17, 0x00, lsl 16
	movk x17, 0x83DE, lsl 00  //Celeste
	
	movz x18, 0x69, lsl 16
	movk x18, 0x34F8, lsl 00  //Violeta
	
	movz x19, 0x00, lsl 16
	movk x19, 0x0000, lsl 00  //negro
	
	movz x21, 0xFF, lsl 16
	movk x21, 0xFFFF, lsl 00  //blanco

	mov x2, SCREEN_HEIGH         // Y Size 
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w18,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,loop0	   // If not end row jump
	

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
