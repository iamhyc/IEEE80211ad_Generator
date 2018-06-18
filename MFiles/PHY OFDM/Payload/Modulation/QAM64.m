% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     QAM64.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs QAM64 modulation as specified in 802.11ad Std
%    
%    [symbols] = QAM64(codebits)
%
%    Inputs:
%
%       1. codebits - encoded bits
%
%    Outputs:
%
%       1. symbols - QAM64 modulated symbols
%
%  *************************************************************************************/
function [symbols] = QAM64(codebits)

Nsd = 336;

bitstream_1 = codebits(1:2*Nsd);
bitstream_2 = codebits(2*Nsd+1:4*Nsd);
bitstream_3 = codebits(4*Nsd+1:end);

[r c] = size(bitstream_1);
symbits = reshape(bitstream_1,[6,c/6]);
x1 = 8*symbits(1,:) - 4;
x2 = 2*symbits(1,:) - 1;
x3 = 4*symbits(2,:) - 2;
x4 = 2*symbits(2,:) - 1;
x5 = 2*symbits(3,:) - 1;
x = x1 - x2.*x3 + (x2.*x4).*x5;
y1 = 8*symbits(4,:) - 4;
y2 = 2*symbits(4,:) - 1;
y3 = 4*symbits(5,:) - 2;
y4 = 2*symbits(5,:) - 1;
y5 = 2*symbits(6,:) - 1;
y = y1 - y2.*y3 + (y2.*y4).*y5;
xSym = (x+j*y)/sqrt(42);

[r c] = size(bitstream_2);
symbits = reshape(bitstream_2,[6,c/6]);
x1 = 8*symbits(1,:) - 4;
x2 = 2*symbits(1,:) - 1;
x3 = 4*symbits(2,:) - 2;
x4 = 2*symbits(2,:) - 1;
x5 = 2*symbits(3,:) - 1;
x = x1 - x2.*x3 + (x2.*x4).*x5;
y1 = 8*symbits(4,:) - 4;
y2 = 2*symbits(4,:) - 1;
y3 = 4*symbits(5,:) - 2;
y4 = 2*symbits(5,:) - 1;
y5 = 2*symbits(6,:) - 1;
y = y1 - y2.*y3 + (y2.*y4).*y5;
ySym = (x+j*y)/sqrt(42);

[r c] = size(bitstream_3);
symbits = reshape(bitstream_3,[6,c/6]);
x1 = 8*symbits(1,:) - 4;
x2 = 2*symbits(1,:) - 1;
x3 = 4*symbits(2,:) - 2;
x4 = 2*symbits(2,:) - 1;
x5 = 2*symbits(3,:) - 1;
x = x1 - x2.*x3 + (x2.*x4).*x5;
y1 = 8*symbits(4,:) - 4;
y2 = 2*symbits(4,:) - 1;
y3 = 4*symbits(5,:) - 2;
y4 = 2*symbits(5,:) - 1;
y5 = 2*symbits(6,:) - 1;
y = y1 - y2.*y3 + (y2.*y4).*y5;
zSym = (x+j*y)/sqrt(42);

X = [xSym ; ySym ; zSym];

symbols = reshape(X,1,Nsd);

return
