Mult8_SignedEntry:

;Get sign-extension bit patterns
LOD Mult8_Op1[0]
SIGNEX ACC
STR Mult8_Op1Ex[0]
LOD Mult8_Op2[0]
SIGNEX ACC
STR Mult8_Op2Ex[0]


;Initialise variables
Mult8_UnsignedEntry:

;appropriately extend Op1
LOD Mult8_Op1Ex[0]
STR Mult8_1full[0]
STR Mult8_1full[1]

;appropriately extend Op2
LOD Mult8_Op2Ex[0]
STR Mult8_2full[0]
STR Mult8_2full[1]

Mult8_16Entry:
LOD N_[0]
STR Mult8_Ans[0]
STR Mult8_Ans[1]
STR Mult8_Ans[2]
STR Mult8_Ans[3]
STR Mult8_loopCount[0]
LOD N_[1]
STR Mult8_mask[0]


;Outer loop
Mult8_outerLoopStart:
LOD Mult8_2full[3]
STR Mult8_o2nib

;Inner loop
Mult8_innerLoopStart:
LOD Mult8_o2nib
NND Mult8_mask
NND N_[F]

;Add, if necessary
JMP Mult8_doneAdd
ADD16 Mult8_1full Mult8_Ans INTO Mult8_Ans

;Mess with operands appropriately
Mult8_doneAdd:
LSHIFT16 Mult8_1full INTO Mult8_1full
LROT Mult8_mask INTO Mult8_mask

;Leave inner loop, if it is time to do so
LOD Mult8_mask
ADD N_[F]
JMP Mult8_doneInner
LOD N_[0]
JMP Mult8_innerLoopStart

;Done inner loop. Do outer loop stuff.
Mult8_doneInner:
LOD Mult8_2full[2]
STR Mult8_2full[3]
LOD Mult8_2full[1]
STR Mult8_2full[2]
LOD Mult8_2full[0]
STR Mult8_2full[1]
LOD Mult8_loopCount
ADD N_[1]
STR Mult8_loopCount
ADD N_[C]

;Return, if it is time
Mult8_RetAddr:
JMP 0000
LOD N_[0]
JMP Mult8_outerLoopStart




Mult8_Ans: 			.data 4
Mult8_1full:		.data 2
Mult8_Op1: 			.data 2
Mult8_2full:		.data 2
Mult8_Op2: 			.data 2
Mult8_loopCount:	.data 1
Mult8_mask:			.data 1
Mult8_o2nib:		.data 1
Mult8_Op1Ex:		.data 1
Mult8_Op2Ex:		.data 1
