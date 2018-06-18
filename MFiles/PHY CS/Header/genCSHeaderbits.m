% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genCSHeaderbits.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified Header
%    for specified CONTROL PHY configuration
%    
%    [header] = genCSHeaderbits(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. header      - header bits generated according 802.11ad Std.
%
%  *************************************************************************************/
function [header] = genCSHeaderbits(genParams)
%read header parameters
scrambler_seed = genParams.header.scrambler_seed;
length = genParams.header.length;
mcs = genParams.header.mcs;
pkttype = genParams.header.pkttype;
training_len = genParams.header.training_len;
sifsresponse = genParams.header.sifsresponse;
%convert to bits
bits = [];
b1 = dectobin(0,1);
b2 = dectobin(scrambler_seed,4);
b3 = dectobin(length,10);
b4 = dectobin(pkttype,1);
b5 = dectobin(training_len,5);
b6 = dectobin(sifsresponse,1);
b7 = dectobin(0,2);
%construct header bits (LSB first)
bits = [b1 b2 b3 b4 b5 b6 b7];
[r c] = size(bits);
data = bits;
%add CRC bits
bitsout = genCRC(data);

header = bitsout;
return
