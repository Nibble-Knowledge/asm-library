;Figure out if we should negate the answer, plus make the
;inputs unsigned
Div4_SignedEntry:
UCLC ACC
LOD N_[0]
STR Div4_ShouldNegate

LOD Div4_Divisor
SIGNEX ACC
JMP Div4_Signed1

;make divisor unsigned, if need be
LOD N_[8]
STR Div4_ShouldNegate
NEG Div4_Divisor

Div4_Signed1:
LOD Div4_Dividend
SIGNEX ACC
JMP Div4_UnsignedEntry

;make dividend unsigned, if need be
ADD Div4_ShouldNegate N_[8] INTO Div4_ShouldNegate
NEG Div4_Dividend
;if both were negated, ShouldNegate will be zero

Div4_UnsignedEntry:

LOD N_[0]
STR Div4_LowDivisor
STR Div4_HighDividend
STR Div4_Quotient
STR Div4_LoopCount

; division by zero not allowed
JMPNE Div4_Divisor N_[0] TO Div4_Loop
HLT 0

Div4_Loop:
LSHIFT Div4_Quotient

;If current divisor > Dividend, do not subtract
JMPG8 Div4_Divisor Div4_HighDividend TO Div4_NoSub

;Do the subtraction, and add to the answer
SUB8 Div4_HighDividend Div4_Divisor INTO Div4_HighDividend
ADD Div4_AddNum Div4_Quotient INTO Div4_Quotient

Div4_NoSub:
;Right-rotate the divisor by one, the fastest way we know
LOD Div4_Divisor
STR macro[0]
LOD Div4_LowDivisor
STR Div4_Divisor
LOD macro[0]
STR Div4_LowDivisor

LOD N_[0]
STR Div4_RotCount

Div4_LROT:
LROT8 Div4_Divisor
INC Div4_RotCount
JMPNE N_[3] Div4_RotCount TO Div4_LROT

INC Div4_LoopCount
JMPL Div4_LoopCount N_[4] TO Div4_Loop

LOD Div4_ShouldNegate
JMP Div4_NotNegate

NEG Div4_Quotient

Div4_NotNegate:
LOD N_[0]
Div4_Return:
JMP 0000



Div4_Divisor: 		.data 1
Div4_LowDivisor:	.data 1
Div4_HighDividend:	.data 1
Div4_Remainder:
Div4_Dividend: 		.data 1
Div4_Quotient: 		.data 1
Div4_AddNum:		.data 1 0x1
Div4_LoopCount:		.data 1
Div4_RotCount:		.data 1
Div4_ZeroForUnsigned:
Div4_ShouldNegate:	.data 1
