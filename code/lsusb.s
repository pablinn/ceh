 /*inicio*/
.section .text

.global main
main:
    /*write()*/
    mov  r2,#6      
    mov  r1,pc
    add  r1,#24
    mov  r0,$0x1 
    mov  r7,$0x4  
    svc  0            /*software interrupt o swi */
    
    /*exit()*/
    sub r0,r0,r0      /*0=1-1*/ 
    mov r7,$0x1
    svc 0
     
.ascii "lsusb\n"

/*fin*/ 
