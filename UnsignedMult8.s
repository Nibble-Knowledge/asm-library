;Initialise Variables
UMult8_Entry:
LOD N_[0]
STR UMult8_Ans[0]
STR UMult8_Ans[1]
STR UMult8_Ans[2]
STR UMult8_Ans[3]
STR UMult8_1full[0]
STR UMult8_1full[1]
STR UMult8_loopCount[0]
LOD N_[1]
STR UMult8_mask[0]

;Outer loop
UMult8_outerLoopStart:
LOD UMult8_Op2[1]
STR UMult8_o2nib

;Inner loop
UMult8_innerLoopStart:
LOD UMult8_o2nib
NND UMult8_mask
NND N_[F]

;Add, if necessary
JMP UMult8_doneAdd
ADD16 UMult8_1full UMult8_Ans INTO UMult8_Ans

;Mess with operands appropriately
UMult8_doneAdd:
LShift16 UMult8_1full INTO UMult8_1full
LROT UMult8_mask

;Leave inner loop, if it is time to do so
LOD Umult8_mask
ADD N_[F]
JMP UMult8_doneInner
LOD N_[0]
JMP UMult8_innerLoopStart

;Done inner loop. Do outer loop stuff.
UMult8_doneInner:
LOD UMult8_Op2[0]
STR UMult8_Op2[1]
LOD UMult8_loopCount
ADD N_[1]
STR UMult8_loopCount
ADD N_[E]

;Return, if it is time
UMult8_RetAddr:
JMP 0000
LOD N_[0]
JMP UMult8_outerLoopStart




UMult8_Ans: 		.data 4
UMult8_1full:		.data 2
UMult8_Op1: 		.data 2
UMult8_Op2: 		.data 2
UMult8_loopCount:	.data 1
UMult8_mask:		.data 1
UMult8_o2nib:		.data 1
