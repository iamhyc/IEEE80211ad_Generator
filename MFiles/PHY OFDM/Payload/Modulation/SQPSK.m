% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     SQPSK.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs Spread QPSK modulation as specified in 802.11ad Std
%    
%    [symbols] = SQPSK(codebits)
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
function [symbols] = SQPSK(codebits)

[r c] = size(codebits);
symbits = reshape(codebits,[2,c/2]);
mapbits = 2*symbits - 1;
sym = (1/sqrt(2)) * ( mapbits(1,:) + j* mapbits(2,:) );

symbols = [sym conj(sym)];

return
