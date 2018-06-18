% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     spreadCScode.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function spreads CONTROL PHY data with Ga32 golay code as specified in
%    802.11ad Std
%    
%    [spreadCode] = spreadCScode(symbols,Ga32)
%
%    Inputs:
%
%       1. symbols   - modulation mapped symbols
%       2. Ga32      - Golay sequence Ga32
%
%    Outputs:
%
%       1. spreadCode - spreaded modulation CONTROL PHY symbols
%
%  *************************************************************************************/
function [spreadCode] = spreadCScode(symbols,Ga32)

[r c] = size(symbols);
Code = zeros(1,c*32);

for k1=1:c,
    Code([(k1-1)*32+1 : k1*32]) = Ga32*symbols(k1);
end

[r c] = size(Code);
spreadCode = zeros(1,c);
spreadCode = Code .* exp(j * [0:(c-1)] * (pi/2));

return
