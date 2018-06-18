% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     QAM16_PIby2.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs pi/2-QAM16 modulation as specified in 802.11ad Std
%    
%    [symbols] = QAM16_PIby2(codebits)
%
%    Inputs:
%
%       1. codebits - encoded bits
%
%    Outputs:
%
%       1. mapbits -  pi/2-QAM16 modulated symbols
%
%  *************************************************************************************/
function [symbols] = QAM16_PIby2(codebits)

[r c] = size(codebits);
symbits = reshape(codebits,[4,c/4]);
x1 = 4*symbits(1,:) - 2;
x2 = 2*symbits(1,:) - 1;
x3 = 2*symbits(2,:) - 1;
x = x1 - x2.*x3;
y1 = 4*symbits(3,:) - 2;
y2 = 2*symbits(3,:) - 1;
y3 = 2*symbits(4,:) - 1;
y = y1 - y2.*y3;
x2k = (x+j*y)/sqrt(10);

symbols = reshape(x2k,1,length(x2k));

return
