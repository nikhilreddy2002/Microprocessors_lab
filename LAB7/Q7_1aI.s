dend    RN 1
dsor    RN 2
qou     RN 3
rem     RN 4
dendloc RN 5
dsorloc RN 6

	AREA repeated_subraction, CODE, READONLY
	EXPORT Reset_Handler
Reset_Handler
Start   LDR dendloc,divided;loading dividend
        LDR dsorloc,divisor;loading divisor
		LDR	dend,[dendloc];
		LDRH dsor,[dsorloc],#2;
		
loop    SUBS dend,dend,dsor;
        ADD qou,qou,#1;
        BPL loop;
        SUB qou,qou,#1
        ADD rem,dend,dsor
		STR qou,[dsorloc,#4]!;
		STRH rem,[dsorloc,#2];
Stop 	B 	Stop ; Stop program 
divided DCD 0x40000000
        ALIGN
divisor DCD 0x40000004        
        ALIGN
        ENDs