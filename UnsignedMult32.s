
;Initialise variables
UMult32_Entry:
LOD N_[0]
STR UMult32_Ans[0]
STR UMult32_Ans[1]
STR UMult32_Ans[2]
STR UMult32_Ans[3]
STR UMult32_Ans[4]
STR UMult32_Ans[5]
STR UMult32_Ans[6]
STR UMult32_Ans[7]
STR UMult32_Ans[8]
STR UMult32_Ans[9]
STR UMult32_Ans[A]
STR UMult32_Ans[B]
STR UMult32_Ans[C]
STR UMult32_Ans[D]
STR UMult32_Ans[E]
STR UMult32_Ans[F]
STR UMult32_1full[0]
STR UMult32_1full[1]
STR UMult32_1full[2]
STR UMult32_1full[3]
STR UMult32_1full[4]
STR UMult32_1full[5]
STR UMult32_1full[6]
STR UMult32_1full[7]
STR UMult32_loopCount[0]
LOD N_[1]
STR UMult32_mask[0]

;Outer loop
UMult32_outerLoopStart:
LOD UMult32_Op2[7]
STR UMult32_o2nib

;Inner loop
UMult32_innerLoopStart:
LOD UMult32_o2nib
NND UMult32_mask
NND N_[F]

;Add, if necessary
JMP UMult32_doneAdd
ADD64 UMult32_1full UMult32_Ans INTO UMult32_Ans

;Mess with operands appropriately
UMult32_doneAdd:
LShift64 UMult32_1full INTO UMult32_1full
LROT UMult32_mask

;Leave inner loop, if it is time to do so
LOD UMult32_mask
ADD N_[F]
JMP UMult32_doneInner
LOD N_[0]
JMP UMult32_innerLoopStart

;Done inner loop. Do outer loop stuff.
UMult32_doneInner:
LOD UMult32_Op2[6]
STR UMult32_Op2[7]
LOD UMult32_Op2[5]
STR UMult32_Op2[6]
LOD UMult32_Op2[4]
STR UMult32_Op2[5]
LOD UMult32_Op2[3]
STR UMult32_Op2[4]
LOD UMult32_Op2[2]
STR UMult32_Op2[3]
LOD UMult32_Op2[1]
STR UMult32_Op2[2]
LOD UMult32_Op2[0]
STR UMult32_Op2[1]
LOD UMult32_loopCount
ADD N_[1]
STR UMult32_loopCount
ADD N_[8]

;Return, if it is time
UMult32_RetAddr:
JMP 0000
LOD N_[0]
JMP UMult32_outerLoopStart




UMult32_Ans: 		.data 16
UMult32_1full:		.data 8
UMult32_Op1: 		.data 8
UMult32_Op2: 		.data 8
UMult32_loopCount:	.data 1
UMult32_mask:		.data 1
UMult32_o2nib:		.data 1
