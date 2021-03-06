fib 	RN 0; stores current fibonacci number
fir 	RN 1
sec 	RN 2
numloc 	RN 3
num 	RN 4
temp    RN 6
		AREA fibonacci, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start 	
		MOV fir, #0
		MOV sec, #1
		LDR numloc,adrs
		LDR num,[numloc]
		STR r11,[numloc,#4]!;storing 0 (the first element)
		
loop	;calculating fibonacci sequence
        ADD fib,fir,sec;
		MOV fir,sec;
		MOV sec,fib;
		CMP fib,num;
		STR fir,[numloc,#4]!;storing the number
		BLT loop
Stop 	B 	Stop ; Stop program
adrs 		DCW  0x00004000
		END 