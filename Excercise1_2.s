	AREA exercise1_2, CODE, READONLY
	EXPORT RESET_HANDLER1_2
RESET_HANDLER1_2

START	MOV R1, #0xffffff63
		MVN R2, #0xffffff63
		MOV R3, R1 
STOP 	B STOP 
		END