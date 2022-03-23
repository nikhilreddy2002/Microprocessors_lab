fib 	RN 0
fir 	RN 1
sec 	RN 2
numloc 	RN 3
num 	RN 4
is_fibo RN 5
temp    RN 6
		AREA fibonacci, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start 	
		MOV fir, #0
		MOV sec, #1
		LDR numloc,adrs
		LDR num,[numloc]
		
loop	;calculating fibonacci sequence
        ADD fib,fir,sec;
		MOV fir,sec;
		MOV sec,fib;
		CMP fib,num;
		MOVEQ is_fibo,#1;
		BLT loop
        CMP is_fibo,#1;if number is a fibonacci
        MOVEQ temp,#1;load 1
        MOVNE temp,#0xFF;else load 2
		STR temp,[numloc,#4];storing result 
Stop 	B 	Stop ; Stop program
adrs 		DCW  0x00004000
		END 