% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     QAM16.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs QAM16 modulation as specified in 802.11ad Std
%    
%    [symbols] = QAM16(codebits)
%
%    Inputs:
%
%       1. codebits - encoded bits
%
%    Outputs:
%
%       1. symbols - QAM16 modulated symbols
%
%  *************************************************************************************/
function [symbols] = QAM16(codebits)

Nsd = 336;
Nsd_by2 = Nsd/2;

bitstream_1 = codebits(1:2*Nsd);
bitstream_2 = codebits(2*Nsd+1:end);

[r c] = size(bitstream_1);
symbits = reshape(bitstream_1,[4,c/4]);
x1 = 4*symbits(1,:) - 2;
x2 = 2*symbits(1,:) - 1;
x3 = 2*symbits(2,:) - 1;
x = x1 - x2.*x3;
y1 = 4*symbits(3,:) - 2;
y2 = 2*symbits(3,:) - 1;
y3 = 2*symbits(4,:) - 1;
y = y1 - y2.*y3;
x2k = (x+j*y)/sqrt(10);

[r c] = size(bitstream_2);
symbits = reshape(bitstream_2,[4,c/4]);
x1 = 4*symbits(1,:) - 2;
x2 = 2*symbits(1,:) - 1;
x3 = 2*symbits(2,:) - 1;
x = x1 - x2.*x3;
y1 = 4*symbits(3,:) - 2;
y2 = 2*symbits(3,:) - 1;
y3 = 2*symbits(4,:) - 1;
y = y1 - y2.*y3;
x2k1 = (x+j*y)/sqrt(10);

x = [x2k ; x2k1];

symbols = reshape(x,1,Nsd);

return
