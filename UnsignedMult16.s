
;Initialise variables
UMult16_Entry:
LOD N_[0]
STR UMult16_Ans[0]
STR UMult16_Ans[1]
STR UMult16_Ans[2]
STR UMult16_Ans[3]
STR UMult16_Ans[4]
STR UMult16_Ans[5]
STR UMult16_Ans[6]
STR UMult16_Ans[7]
STR UMult16_1full[0]
STR UMult16_1full[1]
STR UMult16_1full[2]
STR UMult16_1full[3]
STR UMult16_loopCount[0]
LOD N_[1]
STR UMult16_mask[0]

;Outer loop
UMult16_outerLoopStart:
LOD UMult16_Op2[3]
STR UMult16_o2nib

;Inner loop
UMult16_innerLoopStart:
LOD UMult16_o2nib
NND UMult16_mask
NND N_[F]

;Add, if necessary
JMP UMult16_doneAdd
ADD32 UMult16_1full UMult16_Ans INTO UMult16_Ans

;Mess with operands appropriately
UMult16_doneAdd:
LShift32 UMult16_1full INTO UMult16_1full
LROT UMult16_mask

;Leave inner loop, if it is time to do so
LOD UMult16_mask
ADD N_[F]
JMP UMult16_doneInner
LOD N_[0]
JMP UMult16_innerLoopStart

;Done inner loop. Do outer loop stuff.
UMult16_doneInner:
LOD UMult16_Op2[2]
STR UMult16_Op2[3]
LOD UMult16_Op2[1]
STR UMult16_Op2[2]
LOD UMult16_Op2[0]
STR UMult16_Op2[1]
LOD UMult16_loopCount
ADD N_[1]
STR UMult16_loopCount
ADD N_[C]

;Return, if it is time
UMult16_RetAddr:
JMP 0000
LOD N_[0]
JMP UMult16_outerLoopStart




UMult16_Ans: 		.data 8
UMult16_1full:		.data 4
UMult16_Op1: 		.data 4
UMult16_Op2: 		.data 4
UMult16_loopCount:	.data 1
UMult16_mask:		.data 1
UMult16_o2nib:		.data 1
