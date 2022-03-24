num1r	RN 1
num1loc RN 2
num2r 	RN 3
num2loc RN 4
ans0	RN 5
ans1	RN 6
temp1	RN 7
temp2	RN 8
negbool	RN 9

		AREA signedmul64usingumull, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start	LDR num1loc,num1;
		LDR num2loc,num2;
        LDR num1r,[num1loc];loding the numbers
		LDR num2r,[num2loc];loding the numbers
		
		AND temp1,num1r,#0x80000000
		AND temp2,num2r,#0x80000000
		
		CMP temp1,#0x80000000;first number is negative
		BEQ fne
check2	CMP temp2,#0x80000000;second number is negative
		BEQ sne
		BNE multi
		
fne		SUB num1r,num1r,#1;
		MVN num1r,num1r;
		EOR negbool,negbool,#1;
		B check2
		
sne		SUB num2r,num2r,#1
		MVN num2r,num2r
		EOR negbool,negbool,#1;
		
multi	UMULL ans0,ans1,num1r,num2r;
		CMP negbool,#1;
		MVNEQ ans1,ans1;
		MVNEQ ans0,ans0;
		STR ans0,[num2loc,#4]!
		STR ans1,[num2loc,#4]!
Stop 	B 	Stop ; Stop program
num1	DCD  0x00004000
        ALIGN
num2	DCD  0x00004004
        ALIGN
		END