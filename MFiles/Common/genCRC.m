% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genCRC.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generate Header CRC as described in 802.11ad Std
%    
%    [dataout] = genCRC(bits)
%
%    Inputs:
%
%       1. bits - Header bits
%
%    Outputs:
%
%       1. dataout  - Header bits appended with CRC bits at the tail end
%
%  *************************************************************************************/
function [dataout] = genCRC(bits)
%802.11ad std specified CRC generator
CRCInit = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
[r c] = size(bits);
CRCbits = CRCInit;
dataout = [];
for k1 = 1:c,
    C1 = CRCbits(1);
    C5 = CRCbits(5);
    C12 = CRCbits(12);
    
    C16 = xor(C1,bits(k1));    
    C4 = xor(C5,C16);
    C11 = xor(C12,C16);
    
    CRCbits = [CRCbits(2:end) C16];
    CRCbits(4) = C4;
    CRCbits(11) = C11;
    dataout = [dataout bits(k1)];
end

CRCbits = xor(CRCbits,1);

dataout = [dataout CRCbits];

return
