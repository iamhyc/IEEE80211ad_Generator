% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     CodeMatrixTable.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates codematrix tables for specified coding rate
%
%    Four Low-Density Parity-Check (LDPC) codes are specified, 
%    each of a different rate but with a 19 common codeword size of 672 bits. 
%
%    Each of the parity-check matrices H is partitioned into square sub-matrices
%    of size Z x Z. The sub-matrices are either cyclic-permutations of the identity matrix,
%    or null sub-matrices with all zero entries. 
%
%    A location with integer i denotes the cyclic-permutation sub-matrix Pi obtained from
%    the Z x Z identity matrix by cyclically shifting the columns to the right by i elements.
%    The matrix Po is the Z x Z identity matrix. 
%
%    An i location with -1 value denotes a null sub-matrix of size Z x Z. 
%    
%    [CodeTable] = CodeMatrixTable(codeIndex)
%
%    Inputs:
%
%       1. codeIndex   - enumerated index for coding rate
%
%    Outputs:
%
%       1. CodeTable   - Matrix Code Table(as explained)
%
%  *************************************************************************************/
function [CodeTable] = CodeMatrixTable(codeIndex)

if(codeIndex == 0)              %Rate 1/2
    CodeTable = [40 -1 38 -1 13 -1 5 -1 18 -1 -1 -1 -1 -1 -1 -1
                34 -1 35 -1 27 -1 -1 30 2 1 -1 -1 -1 -1 -1 -1
                -1 36 -1 31 -1 7 -1 34 -1 10 41 -1 -1 -1 -1 -1
                -1 27 -1 18 -1 12 20 -1 -1 -1 15 6 -1 -1 -1 -1
                35 -1 41 -1 40 -1 39 -1 28 -1 -1 3 28 -1 -1 -1
                29 -1 0 -1 -1 22 -1 4 -1 28 -1 27 -1 23 -1 -1
                -1 31 -1 23 -1 21 -1 20 -1 -1 12 -1 -1 0 13 -1
                -1 22 -1 34 31 -1 14 -1 4 -1 -1 -1 13 -1 22 24];
elseif (codeIndex == 1)         %Rate 5/8
    CodeTable = [20 36 34 31 20 7 41 34 -1 10 41 -1 -1 -1 -1 -1
                30 27 -1 18 -1 12 20 14 2 25 15 6 -1 -1 -1 -1
                35 -1 41 -1 40 -1 39 -1 28 -1 -1 3 28 -1 -1 -1
                29 -1 0 -1 -1 22 -1 4 -1 28 -1 27 24 23 -1 -1
                -1 31 -1 23 -1 21 -1 20 -1 9 12 -1 -1 0 13 -1 
                -1 22 -1 34 31 -1 14 -1 4 -1 -1 -1 -1 -1 22 24];
elseif (codeIndex == 2)         %Rate 3/4
    CodeTable = [35 19 41 22 40 41 39 6 28 18 17 3 28 -1 -1 -1
                29 30 0 8 33 22 17 4 27 28 20 27 24 23 -1 -1 
                37 31 18 23 11 21 6 20 32 9 12 29 -1 0 13 -1 
                25 22 4 34 31 3 14 15 4 -1 14 18 13 13 22 24];
elseif (codeIndex == 3)         %Rate 13/16
    CodeTable = [29 30 0 8 33 22 17 4 27 28 20 27 24 23 -1 -1
                37 31 18 23 11 21 6 20 32 9 12 29 10 0 13 -1
                25 22 4 34 31 3 14 15 4 2 14 18 13 13 22 24];
else
    display('Invalid Code Index');
end
    
return
         
    
 
