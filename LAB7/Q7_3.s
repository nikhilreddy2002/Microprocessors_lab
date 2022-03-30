bcdn    RN 1
hexn    RN 2
qou     RN 3
ffreg   RN 4
temp 	RN 5
coun    RN 6
bcdloc  RN 7
hexloc  RN 8
upp		RN 9
tenr	RN 10

		AREA bcdtohex, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start   LDR bcdloc,bcdnum
        LDR hexloc,hexnum
		LDR bcdn,[bcdloc];
		MOV ffreg, #0xF
        MOV coun,#1
		LDR upp,=10000
		MOV tenr,#10
		
loop    AND temp,ffreg,bcdn;
        MLA hexn,coun,temp,hexn;
        MUL temp,coun,tenr;
		MOV coun,temp;
		LSR bcdn,bcdn,#4
        CMP coun,upp
        BLT loop
		STR hexn,[hexloc]
Stop 	B 	Stop ; Stop program 
bcdnum  DCD 0x40000000
        ALIGN
hexnum  DCD 0x40000004        
        ALIGN
        END