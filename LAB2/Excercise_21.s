	AREA Excercise, CODE, READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER

START	LDR R1, =0x000004AF; R1,R2 together form one 64 bit number(MSB is in R1)
		LDR R2, =0x32ADBC14; note here numbers are represented using 2’s complement  
		LDR R3, =0xAFF123F0; R3,R4 together form another 64 bit number(MSB is in R3)
		LDR R4, =0xF1264923;
		RSBS R6, R4, R2; sub the least significant words
		RSC R5, R3, R1; sub the most significant words
STOP 	B STOP ; R6,R5 together form one 64 bit sum (MSB is in R6)
		END