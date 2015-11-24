Mult4_SignedEntry:

;Get sign-extension bit patterns
LOD Mult4_Op1[1]
SIGNEX ACC
STR Mult4_Op1[0]
LOD Mult4_Op2[1]
SIGNEX ACC
STR Mult4_Op2[0]


;Initialise variables
Mult4_UnsignedEntry:
Mult4_8Entry:

LOD N_[0]
STR Mult4_Ans[0]
STR Mult4_Ans[1]
STR Mult4_loopCount[0]
LOD N_[1]
STR Mult4_mask[0]

;Both loops start here
Mult4_innerLoopStart:
LOD Mult4_Op2[1]
NND Mult4_mask
NND N_[F]

;Add, if necessary
JMP Mult4_doneAdd
ADD8 Mult4_Op1 Mult4_Ans INTO Mult4_Ans

;Mess with operands appropriately
Mult4_doneAdd:
LSHIFT8 Mult4_Op1 INTO Mult4_Op1
LROT Mult4_mask INTO Mult4_mask
;Leave inner loop, if it is time to do so
LOD Mult4_mask
ADD N_[F]
JMP Mult4_doneInner
LOD N_[0]
JMP Mult4_innerLoopStart

;Done inner loop. Do outer loop stuff.
Mult4_doneInner:
LOD Mult4_2full[0]
STR Mult4_2full[1]
LOD Mult4_loopCount
ADD N_[1]
STR Mult4_loopCount
ADD N_[E]

;Return, if it is time
Mult4_RetAddr:
JMP 0000
LOD N_[0]
JMP Mult4_innerLoopStart




Mult4_Ans: 			.data 2
Mult4_Op1: 			.data 2
Mult4_Op2: 			.data 2
Mult4_mask:			.data 1
Mult4_loopCount:	.data 1
