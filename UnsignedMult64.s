
;Initialise variables
UMult64_Entry:
LOD N_[0]
STR UMult64_Ans[0]
STR UMult64_Ans[1]
STR UMult64_Ans[2]
STR UMult64_Ans[3]
STR UMult64_Ans[4]
STR UMult64_Ans[5]
STR UMult64_Ans[6]
STR UMult64_Ans[7]
STR UMult64_Ans[8]
STR UMult64_Ans[9]
STR UMult64_Ans[A]
STR UMult64_Ans[B]
STR UMult64_Ans[C]
STR UMult64_Ans[D]
STR UMult64_Ans[E]
STR UMult64_Ans[F]
STR UMult64_loopCount[0]
LOD N_[1]
STR UMult64_mask[0]

;Outer loop
UMult64_outerLoopStart:
LOD UMult64_Op2[F]
STR UMult64_o2nib

;Inner loop
UMult64_innerLoopStart:
LOD UMult64_o2nib
NND UMult64_mask
NND N_[F]

;Add, if necessary
JMP UMult64_doneAdd
ADD64 UMult64_Op1 UMult64_Ans INTO UMult64_Ans

;Mess with operands appropriately
UMult64_doneAdd:
LShift64 UMult64_Op1 INTO UMult64_Op1
LROT UMult64_mask

;Leave inner loop, if it is time to do so
LOD UMult64_mask
ADD N_[F]
JMP UMult64_doneInner
LOD N_[0]
JMP UMult64_innerLoopStart

;Done inner loop. Do outer loop stuff.
UMult64_doneInner:
LOD UMult64_Op2[E]
STR UMult64_Op2[F]
LOD UMult64_Op2[D]
STR UMult64_Op2[E]
LOD UMult64_Op2[C]
STR UMult64_Op2[D]
LOD UMult64_Op2[B]
STR UMult64_Op2[C]
LOD UMult64_Op2[A]
STR UMult64_Op2[B]
LOD UMult64_Op2[9]
STR UMult64_Op2[A]
LOD UMult64_Op2[8]
STR UMult64_Op2[9]
LOD UMult64_Op2[7]
STR UMult64_Op2[8]
LOD UMult64_Op2[6]
STR UMult64_Op2[7]
LOD UMult64_Op2[5]
STR UMult64_Op2[6]
LOD UMult64_Op2[4]
STR UMult64_Op2[5]
LOD UMult64_Op2[3]
STR UMult64_Op2[4]
LOD UMult64_Op2[2]
STR UMult64_Op2[3]
LOD UMult64_Op2[1]
STR UMult64_Op2[2]
LOD UMult64_Op2[0]
STR UMult64_Op2[1]
LOD UMult64_loopCount
ADD N_[1]
STR UMult64_loopCount

;Return, if it is time
UMult64_RetAddr:
JMP 0000
LOD N_[0]
JMP UMult64_outerLoopStart




UMult64_Ans: 		.data 16
UMult64_Op1: 		.data 16
UMult64_Op2: 		.data 16
UMult64_loopCount:	.data 1
UMult64_mask:		.data 1
UMult64_o2nib:		.data 1
