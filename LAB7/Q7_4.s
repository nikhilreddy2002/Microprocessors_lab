bcd1    RN 1
bcd2    RN 2
sumn    RN 3
temp1 	RN 4
temp2 	RN 4
temp3   RN 5
coun    RN 5
bcd1loc RN 6
bcd2loc RN 7
sumloc  RN 8
upp		RN 9
tenr	RN 10
ffreg   RN 11

		AREA add2bcd, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start   LDR bcd1loc,bcd1num
        LDR bcd2loc,bcd2num
		LDR bcdn,[bcdloc];
        MOV coun,#1
		LDR upp,=100000000
		MOV tenr,#10
        MOV ffreg,#0xF
		
loop    AND temp1,ff,bcd1;
        AND temp2,ff,bcd2;
        ADD temp3,temp1,temp2;
        CMP temp3,#10;
        SUBGE temp3,temp3,#10;
		LSR bcd1,bcd1,#4
        LSR bcd2,bcd2,#4
        CMP coun,upp
        BLT loop
		STR hexn,[hexloc]
Stop 	B 	Stop ; Stop program 
bcdnum  DCD 0x40000000
        ALIGN
hexnum  DCD 0x40000004        
        ALIGN
sum     DCD 0x40000008       
        ALIGN  
        END