
Spin_Entry:
NOT64 Spin_Count INTO Spin_Count

Spin_Loop:
INC64 Spin_Count INTO Spin_Count

;OR together all the nibbles of Spin_Count
;The result will be zero iff Spin_Count == 0

MOV N_[F] INTO Spin_OrBox

LOD Spin_Count[0]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[1]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[2]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[3]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[4]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[5]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[6]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[7]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[8]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[9]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[A]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[B]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[C]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[D]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[E]
NND N_[F]
NND Spin_OrBox
NND N_[F]
STR Spin_OrBox

LOD Spin_Count[F]
NND N_[F]
NND Spin_OrBox


Spin_Return:
JMP 0000
LOD N_[0]
JMP Spin_Loop

Spin_Count: 		.data 16 0x0000000000000000
Spin_OrBox: 		.data 1 0x0
