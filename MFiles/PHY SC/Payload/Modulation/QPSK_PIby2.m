% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     QPSK_PIby2.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs pi/2-QPSK modulation as specified in 802.11ad Std
%    
%    [symbols] = QPSK_PIby2(codebits)
%
%    Inputs:
%
%       1. codebits - encoded bits
%
%    Outputs:
%
%       1. mapbits -  pi/2-QPSK modulated symbols
%
%  *************************************************************************************/
function [symbols] = QPSK_PIby2(codebits)

[r c] = size(codebits);
symbits = reshape(codebits,[2,c/2]);
mapbits = 2*symbits - 1;
symbols = exp(-j*pi/4)*(1/sqrt(2)) * ( mapbits(1,:) + j* mapbits(2,:) );

return
