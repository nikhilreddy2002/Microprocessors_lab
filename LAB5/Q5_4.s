revnum 	RN 1
numloc 	RN 2
num 	RN 3
rem10	RN 4
temp	RN 5
qt		RN 6
tenr 	RN 7

		AREA rev_num, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start 	
		LDR numloc,adrs;loading the address of the number
		LDR num,[numloc];loading the number
		MOV tenr,#10
		
loop	MOV qt,#0;
		    
loopdiv	;division to find quotient and remainder
        SUBS num,num,tenr;
		ADD qt,qt,#1
		BPL loopdiv
		ADD rem10,num,tenr;
		SUB qt,qt,#1;
		;revnum *= 10
		LSL temp,revnum,#3;
		ADD temp,temp,revnum, LSL #1;
		;revnum += mod10
		ADD temp,temp,rem10;
		MOV revnum,temp;
		;num /= 10
		MOV num,qt;
		CMP num,#0
		BNE loop;
        STR acount,[numloc,#4];storing the reversed number
Stop 	B 	Stop ; Stop program
adrs	DCW  0x00004000
		END