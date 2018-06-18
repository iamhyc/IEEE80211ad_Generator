% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genCodeMatrix.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates parity check matrix as specified by codematrix
%    table
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
%    [H] = genCodeMatrix(codeMatrixTable);
%
%    Inputs:
%
%       1. codeMatrixTable   - Matrix Code Table(as explained)
%
%    Outputs:
%
%       1. H   - Parity check matrix
%
%  *************************************************************************************/
function [H] = genCodeMatrix(codeMatrixTable);
[r c] = size(codeMatrixTable);

H = [];
for k1 = 1:r,
    rowmatrix = [];
    for k2 = 1:c,
        index = codeMatrixTable(k1,k2);
        if( index == -1 )
            rowmatrix = [rowmatrix zeros(42,42)];
        else
            rowmatrix = [rowmatrix rotateZ(index)];            
        end
    end
    H = [H ; rowmatrix];
end

return
