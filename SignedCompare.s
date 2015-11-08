#signed comparison as a function



#64-bit compare

CMP.Entry64:
LOD N_[1]
ADD CMP.op1[F]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[F]
CXA
NND N_[1]
ADD CMP.op1[E]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[E]
CXA
NND N_[1]
ADD CMP.op1[D]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[D]
CXA
NND N_[1]
ADD CMP.op1[C]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[C]
CXA
NND N_[1]
ADD CMP.op1[B]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[B]
CXA
NND N_[1]
ADD CMP.op1[A]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[A]
CXA
NND N_[1]
ADD CMP.op1[9]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[9]
CXA
NND N_[1]
ADD CMP.op1[8]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[8]
CXA
NND N_[1]

CMP.Entry32:
NOP N_[1]

ADD CMP.op1[7]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[7]
CXA
NND N_[1]
NND CMP.temp[0]
ADD CMP.op1[6]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[6]
CXA
NND N_[1]
NND CMP.temp[0]
ADD CMP.op1[5]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[5]
CXA
NND N_[1]
NND CMP.temp[0]
ADD CMP.op1[4]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[4]
CXA
NND N_[1]
NND CMP.temp[0]

CMP.Entry16:
NOP N_[1]

ADD CMP.op1[3]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[3]
CXA
NND N_[1]
NND CMP.temp[0]
ADD CMP.op1[2]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[2]
CXA
NND N_[1]
NND CMP.temp[0]
ADD CMP.op1[1]
STR CMP.temp[1]
CXA
NND N_[1]
STR CMP.temp[0]
LOD CMP.temp[1]
ADD CMP.op2[1]
CXA
NND N_[1]
NND CMP.temp[0]
;Start dealing with the most significant nibble
ADD CMP.op1[0]
STR CMP.temp[2]
;1st partial sum in CMP.temp[2]
CXA
;quick XOR of CMP with result (gives valid overflow bit)
STR CMP.temp[3]
NND CMP.temp[2]
STR CMP.temp[0]
NND CMP.temp[3]
STR CMP.temp[1]
LOD CMP.temp[0]
NND CMP.temp[2]
NND CMP.temp[1]
STR CMP.temp[3]
;OVF1 in MSB of CMP.temp[3]
;get final CMP bit
LOD CMP.temp[2]
ADD CMP.op2[0]
CXA

;xor of OVF1 with CMP2 bit, into ACC
STR CMP.temp[2]

NND CMP.temp[3]
STR CMP.temp[0]
NND CMP.temp[2]
STR CMP.temp[1]
LOD CMP.temp[0]
NND CMP.temp[3]
NND CMP.temp[1]
NND N_[8]
NND N_[F]

CMP.jmp1:
JMP 0x0000

LOD N_[0]

CMP.jmp2:
JMP 0x0000


CMP.op1: 	.data 16
CMP.op2: 	.data 16
CMP.temp:	.data 4



