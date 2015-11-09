
;Initialise variables
SMult8_Entry:
LOD N_[0]
STR SMult8_Ans[0]
STR SMult8_Ans[1]
STR SMult8_Ans[2]
STR SMult8_Ans[3]
STR SMult8_loopCount[0]
LOD N_[1]
STR SMult8_mask[0]

;sign-extend Op1
LOD SMult8_Op1[0]
ADD N_[8]
GETCARR ACC
JMP SMult8_ZE1
LOD N_[F]
STR SMult8_1full[0]
STR SMult8_1full[1]
LOD N_[0]
JMP SMult8_DoneSE1
SMult8_ZE1:
LOD N_[0]
STR SMult8_1full[0]
STR SMult8_1full[1]
SMult8_DoneSE1:

;signed-extend Op2
LOD SMult8_Op2[0]
ADD N_[8]
GETCARR ACC
JMP SMult8_ZE2
LOD N_[F]
STR SMult8_2full[0]
STR SMult8_2full[1]
LOD N_[0]
JMP SMult8_DoneSE2
SMult8_ZE2:
LOD N_[0]
STR SMult8_2full[0]
STR SMult8_2full[1]
SMult8_DoneSE2:

;Outer loop
SMult8_outerLoopStart:
LOD SMult8_Op2[3]
STR SMult8_o2nib

;Inner loop
SMult8_innerLoopStart:
LOD SMult8_o2nib
NND SMult8_mask
NND N_[F]

;Add, if necessary
JMP SMult8_doneAdd
ADD16 SMult8_1full SMult8_Ans INTO SMult8_Ans

;Mess with operands appropriately
SMult8_doneAdd:
LShift16 SMult8_1full INTO SMult8_1full
LROT SMult8_mask

;Leave inner loop, if it is time to do so
LOD SMult8_mask
ADD N_[F]
JMP SMult8_doneInner
LOD N_[0]
JMP SMult8_innerLoopStart

;Done inner loop. Do outer loop stuff.
SMult8_doneInner:
LOD SMult8_Op2[2]
STR SMult8_Op2[3]
LOD SMult8_Op2[1]
STR SMult8_Op2[2]
LOD SMult8_Op2[0]
STR SMult8_Op2[1]
LOD SMult8_loopCount
ADD N_[1]
STR SMult8_loopCount
ADD N_[C]

;Return, if it is time
SMult8_RetAddr:
JMP 0000
LOD N_[0]
JMP SMult8_outerLoopStart




SMult8_Ans: 		.data 4
SMult8_1full:		.data 2
SMult8_Op1: 		.data 2
SMult8_2full:		.data 2
SMult8_Op2: 		.data 2
SMult8_loopCount:	.data 1
SMult8_mask:		.data 1
SMult8_o2nib:		.data 1
