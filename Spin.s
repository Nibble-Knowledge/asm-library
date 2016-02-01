
Spin_Entry:
NOT64 Spin_Count INTO Spin_Count

Spin_Loop:
INC64 Spin_Count INTO Spin_Count

JMPNE Spin_Count Spin_Zero TO Spin_NotReturn

LOD N_[0]
Spin_Return:
JMP 0000
Spin_NotReturn:
LOD N_[0]
JMP Spin_Loop

Spin_Count: 		.data 16 0x0000000000000000
Spin_Zero:			.data 16 0x0000000000000000
Spin_OrBox: 		.data 1 0x0
