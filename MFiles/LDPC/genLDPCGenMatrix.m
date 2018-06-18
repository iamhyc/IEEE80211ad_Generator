% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genLDPCGenMatrix.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates LDPC encoding matrix for specified transmit
%    configuration
%    
%    [genMatrix] = genLDPCGenMatrix(codeIndex)
%
%    Inputs:
%
%       1. codeIndex   - enumerated index for coding rate
%
%    Outputs:
%
%       1. genMatrix   - LDPC parity generation matrix parameters
%
%  *************************************************************************************/
function [genMatrix] = genLDPCGenMatrix(codeIndex)

if codeIndex == 0; N = 1;   D = 2; end  % Rate 1/2 
if codeIndex == 1; N = 5;   D = 8; end  % Rate 5/8
if codeIndex == 2; N = 3;   D = 4; end  % Rate 3/4
if codeIndex == 3; N = 13;  D = 16;end  % Rate 13/16

codeTable = CodeMatrixTable(codeIndex);
H = genCodeMatrix(codeTable);
[r c] = size(H);
HC = H(:, 1:N*c/D);
HP = H(:, N*c/D +1:end);
Matrix = mod(inv(HP) * HC , 2);

[r c] = size(Matrix);

%Find non-zero indices in each row of Generator matrix
%Below for loop is find the max non-zeros in all of the rows of Generator matrix
maxSize = [];
for k1 = 1:r,
    nzIndex = find(Matrix(k1,:) == 1);
    maxSize = [maxSize size(nzIndex,2)];
end

%Construct a matrix with non zero indices (first element of each row of
%nZindexTable gives 'length of non-zero' elements
S = max(maxSize);
nZindexTable = zeros(r,S+1);
for k1 = 1:r,
    nzIndex = find(Matrix(k1,:) == 1);
    nZindexTable(k1,1:size(nzIndex,2)+1) = [size(nzIndex,2) nzIndex];
end

genMatrix.Matrix = Matrix;
genMatrix.nZindex = nZindexTable;

return



