	AREA exercise1_3, CODE, READONLY
	EXPORT RESET_HANDLER1_3
RESET_HANDLER1_3

START	MVN R1, #0xFFFFFFC
		MOV R2, #0x0000000A
		MOV R3, R2, LSL #1
		MOVS R4, R2, LSL #1
		MOVS R3, R1, LSR #1
		MOV R1, #10
		MOV R2, #-10
		MVNS R3, R1, ASR #1
		MOVS R4, R2, ASR #1
		MVNS R2,R2
		MOVS R5, R2, ROR #1
		MOVS R6, R2, RRX
STOP 	B STOP 
		END