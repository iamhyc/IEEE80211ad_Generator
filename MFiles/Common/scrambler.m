% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     scrambler.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function scrambles the input data bit stream using 802.11ad Std specified scrambler
%    
%    [scrambledbits state] = scrambler(bits,state)
%
%    Inputs:
%
%       1. bits   - input bit stream
%       2. state  - initial state of scrambler
%
%    Outputs:
%
%       1. scrambledbits - scrambled bit stream
%       2. state         - final state of scrambler at the end of scrambling
%
%  *************************************************************************************/
function [scrambledbits state] = scrambler(bits,state)
%802.11ad std specified scrambler
[r c] = size(bits);
scrambledbits = zeros(1,c);
for k = 1:size(bits,2),
    xin = xor(state(4),state(7));
    state = [xin state(1:end-1)];
    scrambledbits(k) = xor(xin,bits(k));
end

return
