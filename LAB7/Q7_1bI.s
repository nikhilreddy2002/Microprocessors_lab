dendtp  RN 1
dendbt  RN 2
dsor    RN 3
qou     RN 4
rem     RN 5
dendloc RN 6
dsorloc RN 7
ffreg 	RN 8

		AREA repeated_subraction64, CODE, READONLY
		EXPORT Reset_Handler
Reset_Handler
Start   LDR dendloc,divided;loading dividend
        LDR dsorloc,divisor;loading divisor
		LDMIA dendloc!,{dendtp,dendbt}
		LDR dsor,[dsorloc],#4;
		LDR ffreg, =0xFFFFFFFF;
		
loop    SUBS dendbt,dendbt,dsor;
        SBC dendtp,dendtp,#0;
		CMP dendtp,#0
        ADD qou,qou,#1;
        BPL loop;
loopl   SUBS dendbt,dendbt,dsor;
        ADD qou,qou,#1;
		CMP dendbt,dsor;
		BGT loopl;
        SUB qou,qou,#2
		SUB dendbt,dendbt,#1
		EOR dendbt,dendbt,ffreg
        SUB rem,dsor,dendbt
		STR qou,[dsorloc],#4;
		STR rem,[dsorloc];
Stop 	B 	Stop ; Stop program 
divided DCD 0x40000000
        ALIGN
divisor DCD 0x40000008        
        ALIGN
        END