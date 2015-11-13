Mult32_SignedEntry:

;Get sign-extension bit patterns
LOD Mult32_Op1[0]
SIGNEX ACC
STR Mult32_Op1Ex[0]
LOD Mult32_Op2[0]
SIGNEX ACC
STR Mult32_Op2Ex[0]

Mult32_UnsignedEntry:

;appropriately extend Op1
LOD Mult32_Op1Ex[0]
STR Mult32_1full[0]
STR Mult32_1full[1]
STR Mult32_1full[2]
STR Mult32_1full[3]
STR Mult32_1full[4]
STR Mult32_1full[5]
STR Mult32_1full[6]
STR Mult32_1full[7]

;appropriately extend Op2
LOD Mult32_Op2Ex[0]
STR Mult32_2full[0]
STR Mult32_2full[1]
STR Mult32_2full[2]
STR Mult32_2full[3]
STR Mult32_2full[4]
STR Mult32_2full[5]
STR Mult32_2full[6]
STR Mult32_2full[7]

;64-bit version needs no extensions
Mult32_64Entry:

LOD N_[0]
STR Mult32_Ans[0]
STR Mult32_Ans[1]
STR Mult32_Ans[2]
STR Mult32_Ans[3]
STR Mult32_Ans[4]
STR Mult32_Ans[5]
STR Mult32_Ans[6]
STR Mult32_Ans[7]
STR Mult32_Ans[8]
STR Mult32_Ans[9]
STR Mult32_Ans[A]
STR Mult32_Ans[B]
STR Mult32_Ans[C]
STR Mult32_Ans[D]
STR Mult32_Ans[E]
STR Mult32_Ans[F]
STR Mult32_loopCount[0]
LOD N_[1]
STR Mult32_mask[0]



;Outer loop
Mult32_outerLoopStart:
LOD Mult32_2full[F]
STR Mult32_o2nib

;Inner loop
Mult32_innerLoopStart:
LOD Mult32_o2nib
NND Mult32_mask
NND N_[F]

;Add, if necessary
JMP Mult32_doneAdd
ADD64 Mult32_1full Mult32_Ans INTO Mult32_Ans

;Mess with operands appropriately
Mult32_doneAdd:
LShift64 Mult32_1full INTO Mult32_1full
LROT Mult32_mask INTO Mult32_mask

;Leave inner loop, if it is time to do so
LOD Mult32_mask
ADD N_[F]
JMP Mult32_doneInner
LOD N_[0]
JMP Mult32_innerLoopStart

;Done inner loop. Do outer loop stuff.
Mult32_doneInner:
LOD Mult32_2full[E]
STR Mult32_2full[F]
LOD Mult32_2full[D]
STR Mult32_2full[E]
LOD Mult32_2full[C]
STR Mult32_2full[D]
LOD Mult32_2full[B]
STR Mult32_2full[C]
LOD Mult32_2full[A]
STR Mult32_2full[B]
LOD Mult32_2full[9]
STR Mult32_2full[A]
LOD Mult32_2full[8]
STR Mult32_2full[9]
LOD Mult32_2full[7]
STR Mult32_2full[8]
LOD Mult32_2full[6]
STR Mult32_2full[7]
LOD Mult32_2full[5]
STR Mult32_2full[6]
LOD Mult32_2full[4]
STR Mult32_2full[5]
LOD Mult32_2full[3]
STR Mult32_2full[4]
LOD Mult32_2full[2]
STR Mult32_2full[3]
LOD Mult32_2full[1]
STR Mult32_2full[2]
LOD Mult32_2full[0]
STR Mult32_2full[1]

LOD Mult32_loopCount
ADD N_[1]
STR Mult32_loopCount

;Return, if it is time
Mult32_RetAddr:
JMP 0000
LOD N_[0]
JMP Mult32_outerLoopStart




Mult32_Ans: 		.data 16
Mult32_1full:		.data 8
Mult32_Op1: 		.data 8
Mult32_2full:		.data 8
Mult32_Op2: 		.data 8
Mult32_loopCount:	.data 1
Mult32_mask:		.data 1
Mult32_o2nib:		.data 1
Mult32_Op1Ex:		.data 1
Mult32_Op2Ex:		.data 1
