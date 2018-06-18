% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     DBPSK.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs differential BPSK modulation as specified in 802.11ad Std
%    
%    [symbols] = DBPSK(codebits)
%
%    Inputs:
%
%       1. codebits   - encoded bits
%
%    Outputs:
%
%       1. symbols - Differentially BPSK modulation symbols
%
%  *************************************************************************************/
function [symbols] = DBPSK(codebits)

mapbits = 2*codebits - 1;

[r c] = size(mapbits);

dinit = 1;
symbols = zeros(1,c);
for k1=1:c,
    symbols(k1) = mapbits(k1) * dinit;
    dinit = symbols(k1);
end

return
