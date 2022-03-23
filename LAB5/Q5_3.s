acount 	RN 1
numloc 	RN 2
num 	RN 3
digloc 	RN 4
dig 	RN 5
rem10	RN 6
qt		RN 7
tenr 	RN 8
;ASSUMING DECIMAL NUMBERS
		AREA rev_num, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start 	
		LDR numloc,adrsnum;loading the address of the number
		LDR num,[numloc];loading the number
        LDR digloc,adrsdig;loading the address of the number
		LDR dig,[digloc];loading the number
		MOV tenr,#10
		
loop	MOV qt,#0;
		
loopdiv	;division to find quotient and remainder
        SUBS num,num,tenr;
		ADD qt,qt,#1
		BPL loopdiv
		ADD rem10,num,tenr;
		SUB qt,qt,#1;
        ;if digit is present count+=1
        CMP rem10,dig;
        ADDEQ acount,acount,#1;    
        MOV num,qt;
        CMP num,#0
		BNE loop;
		STR acount,[digloc,#4];storing the count
Stop 	B 	Stop ; Stop program
adrsnum	DCD  0x00004000
		ALIGN
adrsdig DCD  0x00004004
		ALIGN
		END