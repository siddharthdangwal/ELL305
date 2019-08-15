.mergesort:
		@.print r2
		@.print r4
		@.print ra
		cmp r2, r4
                bgt .exit
                beq .exit
                
                div r2, r2, 4 	@procedure for finding the middle element
                div r4, r4, 4
                add r5, r2, r4
                mul r2, r2, 4
                mul r4, r4, 4
                div r5, r5, 2   @r5 stores the address of the middle element
                mul r5, r5, 4
           		@.print r5
                add r6, r5, 4   @r6 stores the address of the mid+1 element
              	@.print r6

                @storing all the values that will be needed later
                
                sub sp, sp, 20
                st r4 ,0[sp]
                st r2, 4[sp]
                st r5, 8[sp]
                st r6, 12[sp]
                st ra, 16[sp]
                
                mov r4, r5  @calling mergesort on the left hand side of the array
                call .mergesort
                
                ld r4, 0[sp]
                ld r2, 4[sp]
                ld r5, 8[sp]
                ld r6, 12[sp]
                ld ra, 16[sp]
                
                add sp, sp, 20
                
                @storing all the values that will be needed later
                
                sub sp, sp, 20
                st r4 ,0[sp]
                st r2, 4[sp]
                st r5, 8[sp]
                st r6, 12[sp]
                st ra, 16[sp]
                
                mov r2, r6
                call .mergesort
                
                ld r4, 0[sp]
                ld r2, 4[sp]
                ld r5, 8[sp]
                ld r6, 12[sp]
                ld ra, 16[sp]
                
                add sp, sp, 20
                
                sub sp, sp, 4
                st ra, [sp]

                call .merge

                ld ra, [sp]
                add sp, sp, 4

                .exit:
                	mov r1, 10
                	@.print r1
                	@.print ra
                    ret

                
                
                
                
                

	
.merge: 
		
		
		mov r13, r2
		cmp r2, r4
		beq .exit4

		@allocating stack memory for local storage
		sub r7, r4, r2
		add r7, r7, 4
		sub sp, sp, r7

		@allocating temporary pointers
		mov r8, r2
		mov r9, r6
		@mov r10, sp

		.loop:

			@checking if the ends of the two smaller arrays have been reached or not
			cmp r8, r5
			bgt .loop1
			cmp r9, r4
			bgt .loop2

			ld r11, [r8]
			@.print r11
			ld r12, [r9]
			@.print r12
			cmp r11, r12
			bgt .branch1
			st r11, [sp]
			add sp, sp, 4
			add r8, r8, 4
			b .loop

			.branch1:
				st r12, [sp]
				add sp, sp, 4
				add r9, r9, 4
				b .loop

			.loop1:
				cmp r9, r4
				bgt .exit2
				ld r11, [r9]
				st r11, [sp]
				add sp, sp, 4
				add r9, r9, 4
				b .loop1

			.loop2:
				cmp r8, r5
				bgt .exit2
				ld r11, [r8]
				st r11, [sp]
				add sp, sp, 4
				add r8, r8, 4
				b .loop2

			.exit2:
				sub sp, sp, r7
				mov r10, r2
				.label:
				cmp r10, r4
				bgt .exit3
				ld r1, [sp]
				st r1, [r10]
				add r10, r10, 4
				add sp, sp, 4
				b .label

			.exit3:
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
	mov r1, -32
	st r1, 24[r0]
	mov r1, 119
	st r1, 28[r0]
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0          @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 7	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3
	
	
	@ ADD YOUR CODE HERE 
	
	call .mergesort

	@ ADD YOUR CODE HERE 

	@ Print statements for the result
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
