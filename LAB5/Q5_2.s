numloc 	    RN 1
num 		RN 2
is_odd 		RN 3
temp		RN 4

		AREA oddoreven, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start 	
		LDR numloc,adrs;loading the address of the number
		LDR num,[numloc];loading the number
		AND is_odd,num,#1; is_odd = bitwise AND of the number with 1
		CMP is_odd,#1;if its odd we store 0xFF
		MOVEQ temp,#0xFF
		MOVNE temp,#1;for even we store 1
		STR temp,[numloc , 4];storing in the next word 
Stop 	B 	Stop ; Stop program
adrs 		DCW  0x00004000
		END       