.bubblesort:
		mov r4, r2 @moving the lowermost index into r4 
		.loop1:
			cmp r4, r3       @comparing with the number of elements in the array
			sub r10, r3, 1       @store a number 1 less than number of elements for comparision in the inner loop
                         mul r10, r10, 4        @multiplying by the memory needed to implement 1 instruction
                         mov r5, 0        @moving the lowermost index into r5
                         beq .exit
                         add r4, r4, 1
                         .loop2:
                            cmp r5, r10
                            beq .loop1
                            add r11, r0, r5
                            ld r7, 0[r11]
                            ld r8, 4[r11]
                            cmp r7,r8
                            bgt .swap
                            
                            .resumeloop2:
                                add r5, r5, 4
                                b .loop2
                        
                        .swap:
                            mov r9, r7
                            mov r7, r8
                            mov r8, r9
                            add r11, r0, r5
                            st r7, 0[r11]
                            st r8, 4[r11]
                            b .resumeloop2
                        
                        .exit:
                            ret  
		


.main:

	@ Loading the values as an array into the registers
	mov r0, 0    
	mov r1, 12	@ replace 12 with the number to be sorted
	st r1, 0[r0]
	mov r1, 7	@ replace 7 with the number to be sorted
	st r1, 4[r0]
	mov r1, 11  @ replace 11 with the number to be sorted
	st r1, 8[r0]
	mov r1, 9   @ replace 9 with the number to be sorted
	st r1, 12[r0]
	mov r1, 3   @ replace 3 with the number to be sorted
	st r1, 16[r0]
	mov r1, 15  @ replace 15 with the number to be sorted
	st r1, 20[r0]
	mov r1, -31	@additional number
	st r1, 24[r0] 
	mov r1, 422	@additional number
	st r1, 28[r0]

	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0       @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 8	@ REPLACE 6 WITH N, where, N is the number of numbers being sorted
	
	@ ADD YOUR CODE HERE

	call .bubblesort
	
	@ ADD YOUR CODE HERE

	@ Print statements
	ld r1, 0[r0]
	.print r1
	ld r1, 4[r0]
	.print r1
	ld r1, 8[r0]
	.print r1
	ld r1, 12[r0]
	.print r1
	ld r1, 16[r0]
	.print r1
	ld r1, 20[r0]
	.print r1
	ld r1, 24[r0]
	.print r1
	ld r1, 28[r0]
	.print r1
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS
