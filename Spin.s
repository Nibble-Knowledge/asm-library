
Spin_Entry:
ADD64 Spin_Count Spin_Decrement INTO Spin_Count
MOV N_[0] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[0] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[1] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[2] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[3] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[4] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[5] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[6] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[7] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[8] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[9] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[A] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[B] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[C] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[D] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[E] INTO Spin_OrBox
OR Spin_OrBox Spin_Count[F] INTO Spin_OrBox
LOD Spin_OrBox
Spin_Return:
JMP 0000
LOD N_[0]
JMP Spin_Entry

Spin_Count: 		.data 16 0x0000000000000000
Spin_Decrement:		.data 16 0xFFFFFFFFFFFFFFFF
Spin_OrBox: 		.data 1 0x0
