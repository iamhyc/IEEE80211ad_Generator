% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     QPSK.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs QPSK modulation as specified in 802.11ad Std
%    
%    [symbols] = QPSK(codebits)
%
%    Inputs:
%
%       1. codebits - encoded bits
%
%    Outputs:
%
%       1. symbols - QPSK modulated symbols
%
%  *************************************************************************************/
function [symbols] = QPSK(codebits)

[r c] = size(codebits);
symbits = reshape(codebits,[4,c/4]);
mapbits = 2*symbits - 1; 

sym1 = (1/sqrt(2))*( mapbits(1,:) + j* mapbits(3,:) );
sym2 = (1/sqrt(2))*( mapbits(2,:) + j* mapbits(4,:) );

Q = (1/(sqrt(5))) * [1 2;-2 1];
S = Q * [sym1 ; sym2];

symbols = [S(1,:) S(2,:)];

return
