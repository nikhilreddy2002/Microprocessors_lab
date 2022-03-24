num1tp	RN 1
num1bt	RN 2
num1loc RN 3
num2tp 	RN 4
num2bt	RN 5
num2loc RN 6
ans0 	RN 7
ans1   	RN 8
ans2 	RN 9
ans3   	RN 10
temp1	RN 11
temp2	RN 12
temp3	RN	0
temp4	RN	3;repurposing register
		AREA unsignedmul64, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start 	;the numbers are stored in little endian format
		LDR num1loc,num1;
		LDR num2loc,num2;
        LDR num1tp,[num1loc];loding the numbers 32bits at a time
		LDR num1bt,[num1loc,#4];
		LDR num2tp,[num2loc];
        LDR num2bt,[num2loc,#4];
		UMULL ans0,ans1,num1bt,num2bt;
		UMLALS ans1,ans2,num1tp,num2bt;
		ADC ans3,ans3,#0;
		UMLALS ans1,ans2,num1bt,num2tp;
		ADC ans3,ans3,#0;
		UMLALS ans2,ans3,num1tp,num2tp;
		STR ans0,[num2loc,#8]!
		STR ans1,[num2loc,#4]!
        STR ans2,[num2loc,#4]!
		STR ans3,[num2loc,#4]!
Stop 	B 	Stop ; Stop program
num1	DCD  0x00004000
        ALIGN
num2	DCD  0x00004008
        ALIGN
		END