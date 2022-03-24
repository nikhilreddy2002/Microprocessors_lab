num1r	RN 1
num1loc RN 2
num2r 	RN 3
num2loc RN 4
anstp 	RN 5
ansbt   RN 6
		AREA signedmul32, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start 	
		LDR num1loc,num1;
		LDR num2loc,num2;
        LDR num1r,[num1loc];
        LDR num2r,[num2loc];
		SMULL ansbt,anstp,num1r,num2r;signed multiplication 
        STR ansbt,[num2loc,#4]!;storing numbers in little endian format
        STR anstp,[num2loc,#4];
Stop 	B 	Stop ; Stop program
num1	DCD  0x00004000
        ALIGN
num2	DCD  0x00004004
        ALIGN
		END