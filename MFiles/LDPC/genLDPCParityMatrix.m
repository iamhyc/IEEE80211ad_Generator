function [parityMatrix] = genLDPCParityMatrix(codeIndex)

if codeIndex == 0; N = 1;   D = 2; end  % Rate 1/2 
if codeIndex == 1; N = 5;   D = 8; end  % Rate 5/8
if codeIndex == 2; N = 3;   D = 4; end  % Rate 3/4
if codeIndex == 3; N = 13;  D = 16;end  % Rate 13/16

codeTable = codeMatrixTable(codeIndex);
H = genCodeMatrix(codeTable);

Matrix = H;
parityMatrix.Matrix = Matrix;

[r c] = size(Matrix);
%Find non-zero indices in each row of Generator matrix
%Below for loop is find the max non-zeros in all of the rows of Generator matrix
maxSize = [];
for k1 = 1:r,
    nzIndex = find(Matrix(k1,:) == 1);
    maxSize = [maxSize length(nzIndex)];
end
%Construct a matrix with non zero indices (first element of each row of
%nZindexTable gives 'length of non-zero' elements
S = max(maxSize);
nZindexTable = zeros(r,S+1);
for k1 = 1:r,
    nzIndex = find(Matrix(k1,:) == 1);
    nZindexTable(k1,1:length(nzIndex)+1) = [length(nzIndex) nzIndex];
end
parityMatrix.Row.nZindex = nZindexTable;

[r c] = size(Matrix);
%Find non-zero indices in each column of Generator matrix
%Below for loop is find the max non-zeros in all of the columns of Generator matrix
maxSize = [];
for k1 = 1:c,
    nzIndex = find(Matrix(:,k1) == 1);
    maxSize = [maxSize length(nzIndex)];
end
%Construct a matrix with non zero indices (first element of each columns of
%nZindexTable gives 'length of non-zero' elements
S = max(maxSize);
nZindexTable = zeros(S+1,c);
for k1 = 1:c,
    nzIndex = find(Matrix(:,k1) == 1);
    nZindexTable(1:length(nzIndex)+1,k1) = [length(nzIndex); nzIndex];
end
parityMatrix.Col.nZindex = nZindexTable;

return



