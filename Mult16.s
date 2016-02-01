Mult16_SignedEntry:

;Get sign-extension bit patterns
LOD Mult16_Op1[0]
SIGNEX ACC
STR Mult16_Op1Ex[0]
LOD Mult16_Op2[0]
SIGNEX ACC
STR Mult16_Op2Ex[0]


;Initialise variables
Mult16_UnsignedEntry:

;appropriately extend Op1
LOD Mult16_Op1Ex[0]
STR Mult16_1full[0]
STR Mult16_1full[1]
STR Mult16_1full[2]
STR Mult16_1full[3]

;appropriately extend Op2
LOD Mult16_Op2Ex[0]
STR Mult16_2full[0]
STR Mult16_2full[1]
STR Mult16_2full[2]
STR Mult16_2full[3]

Mult16_32Entry:

LOD N_[0]
STR Mult16_Ans[0]
STR Mult16_Ans[1]
STR Mult16_Ans[2]
STR Mult16_Ans[3]
STR Mult16_Ans[4]
STR Mult16_Ans[5]
STR Mult16_Ans[6]
STR Mult16_Ans[7]
STR Mult16_loopCount[0]
LOD N_[1]
STR Mult16_mask[0]

;Outer loop
Mult16_outerLoopStart:
LOD Mult16_2full[7]
STR Mult16_o2nib

;Inner loop
Mult16_innerLoopStart:
LOD Mult16_o2nib
NND Mult16_mask
NND N_[F]

;Add, if necessary
JMP Mult16_doneAdd
ADD32 Mult16_1full Mult16_Ans INTO Mult16_Ans

;Mess with operands appropriately
Mult16_doneAdd:
LSHIFT32 Mult16_1full INTO Mult16_1full
LROT Mult16_mask INTO Mult16_mask

;Leave inner loop, if it is time to do so
UCLC ACC
LOD Mult16_mask
ADD N_[F]
JMP Mult16_doneInner
LOD N_[0]
JMP Mult16_innerLoopStart

;Done inner loop. Do outer loop stuff.
Mult16_doneInner:
LOD Mult16_2full[6]
STR Mult16_2full[7]
LOD Mult16_2full[5]
STR Mult16_2full[6]
LOD Mult16_2full[4]
STR Mult16_2full[5]
LOD Mult16_2full[3]
STR Mult16_2full[4]
LOD Mult16_2full[2]
STR Mult16_2full[3]
LOD Mult16_2full[1]
STR Mult16_2full[2]
LOD Mult16_2full[0]
STR Mult16_2full[1]
UCLC ACC
LOD Mult16_loopCount
ADD N_[1]
STR Mult16_loopCount
ADD N_[8]

;Return, if it is time
Mult16_RetAddr:
JMP 0000
LOD N_[0]
JMP Mult16_outerLoopStart




Mult16_Ans: 		.data 8
Mult16_1full:		.data 4
Mult16_Op1: 		.data 4
Mult16_2full:		.data 4
Mult16_Op2: 		.data 4
Mult16_loopCount:	.data 1
Mult16_mask:		.data 1
Mult16_o2nib:		.data 1
Mult16_Op1Ex:		.data 1
Mult16_Op2Ex:		.data 1
