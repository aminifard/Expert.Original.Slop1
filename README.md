Expert.Original.Slop1 code has been associated to find optimal matrix of the following optimization problem:
min_{t\in R} sum_{i=1}^{n}t_i,
s.t. SV=0,
||[V_{i,1},...,V_{i,n}]||<=t_i,  \forall i=1,...,n,
t_i>=0,                          \forall i=1,...,n,   
L<=V<=U.
This problem can be considered as a second order cone programming relaxation of the following problem proposed in Round 3:
min ||V||_{2,0},
s.t. SV=0,
     L<=V<=U. 

This code employ the 'coneprog' function which has been provided in MATLAB(R2020b) or upper.

For running the program, please set your file name, your sheet and your data range for matrix S on lines 8-10.
Please set your data range for lower bound matrix L on the line 19.
Please set your data range for upper bound matrix U on the line 26.

Input files must be in .xlsx(or .xls) format.
