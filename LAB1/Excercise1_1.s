	AREA MyFirst, CODE, READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER

START	MOV R1, #10
		MOV R2, #0x11 
		MOV R3, R1, LSL#1
		ADD R4, R1, R2
STOP 	B STOP 
		END