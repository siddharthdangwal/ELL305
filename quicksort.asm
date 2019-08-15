.quicksort:
		
		cmp r2, r4
		bgt .exit2
		mov r5, r2	@r5 points to the pivot
		mov r6, r2	@r6 is the left subarray pointer
		mov r7, r4	@r7 is the right subarray pointer

		.loop:
			cmp r6, r7
			beq .exit
			bgt .exit

			.loop1:
				ld r8, [r6]
				cmp r5, r4	@checking position of left subarray pointer w.r.t r4(the end of array position)
				beq .quitloop1
				ld r9, [r5]
				cmp r8, r9	@comparing element pointed by left subarray pointer and pivot
				bgt .quitloop1
				add r6, r6, 4	@shift left subarray pointer to the right by one number
			.quitloop1:

			.loop2:
				ld r8, [r7]
				ld r9, [r5]
				cmp r9, r8	@comparing element pointed by right subarray pointer and pivot
				bgt .quitloop2
				beq .quitloop2
				sub r7, r7, 4	@shift right subarray pointer to the left by one number
			.quitloop2:

			cmp r6, r7	@compare left subarray pointer position and right subarray pointer position
			beq .loop
			bgt .loop
			ld r8, [r6]
			ld r9, [r7]
			mov r10, r8	@swapping
			mov r8, r9
			mov r9, r10
			st r8, [r6]
			st r9, [r7]
			b .loop 	@storing the swapped numbers in their correct locations

			.exit:
				@swapping right subarray pointer and pivot and recursive calls
				ld r8, [r5]
				ld r9, [r7]
				mov r10, r8
				mov r8, r9
				mov r9, r10
				st r8, [r5]
				st r9, [r7]

				@making recursive calls
				sub sp, sp, 12
				st r2, [sp]
				st r4, 4[sp]
				st ra, 8[sp]

				sub r4, r7, 4
				call .quicksort

				ld r2, [sp]
				ld r4, 4[sp]
				ld ra, 8[sp]
				add sp, sp, 12

				sub sp, sp, 12
				st r2, [sp]
				st r4, 4[sp]
				st ra, 8[sp]

				add r2, r7, 4
				call .quicksort

				ld r2, [sp]
				ld r4, 4[sp]
				ld ra, 8[sp]
				add sp, sp, 12

			.exit2:
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
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

	mov r2, 0          @ Starting address of the array
	
	@ Retreive the end address of the array
	mov r3, 3	@ REPLACE 5 WITH N-1, where, N is the number of numbers being sorted
	mul r3, r3, 4		
	add r4, r2, r3
	
	
 	@ ADD YOUR CODE HERE 

	call .quicksort

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
	@ EXTEND ON SIMILAR LINES FOR MORE NUMBERS

