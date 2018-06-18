% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     BPSK.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs BPSK modulation as specified in 802.11ad Std
%    
%    [mapbits] = BPSK(codebits)
%
%    Inputs:
%
%       1. codebits - encoded bits
%
%    Outputs:
%
%       1. mapbits -  BPSK modulated symbols
%
%  *************************************************************************************/
function [mapbits] = BPSK(codebits)

mapbits = 2*codebits - 1;

return
