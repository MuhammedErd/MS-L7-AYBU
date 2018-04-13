		AREA mycode, CODE, READONLY
		ENTRY
		EXPORT __main
__main


		 ;///////////initial  values ///////////////////
		MOV R0, #2
		MOV R1, #1
		MOV R2, #3
		MOV R3, #1
		MOV R4, #0  ; counter

		;//////////calculation calues ///////////////
		MOV R10, #0	    ;VALUE 
		MOV R11, #0	    ;SIGN
		MOV R12, #0     ;RESULT

        ;//////////reserve values ////////////////////
		MOV R8, R0		  ; reserve the first value of R0
		MOV R9, R1        ; reserve the first value of R1
LOOP
		CMP R4, #5 
		BEQ HLT
		 
		             ; for R0
		CMP R9, R2  	 ; 
		MOVLO R10, R9
        MOVHS R10, R2
		MUL R11, R9, R2
		CMP R11, #0
		MOVLO R11, #-1
		MOVHI R11, #1
		MUL R12, R10, R11
		ADD R0, R0, R12
		
		CMP R9, R3  
		MOVLO R10, R9
        MOVHS R10, R3
		MUL R11, R9, R3
		CMP R11, #0
		MOVLO R11, #-1
		MOVHI R11, #1
		MUL R12, R10, R11
		ADD R0, R0, R12
					 ; for R1 
		CMP R8, R2  
		MOVLO R10, R8
        MOVHS R10, R2
		MUL R11, R8, R2
		CMP R11, #0
		MOVLO R11, #-1
		MOVHI R11, #1
		MUL R12, R10, R11
		ADD R1, R1, R12

		CMP R8, R3  
		MOVLO R10, R8
        MOVHS R10, R3
		MUL R11, R8, R3
		CMP R11, #0
		MOVLO R11, #-1
		MOVHI R11, #1
		MUL R12, R10, R11
		ADD R1, R1, R12

	    ADD R4, R4, #1
		BAL LOOP 
		


HLT
		BAL HLT
		END