% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genSCHeaderbits.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified Header
%    for specified SC PHY configuration
%    
%    [header] = genSCHeaderbits(genParams)
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
function [header] = genSCHeaderbits(genParams)

scrambler_seed = genParams.header.scrambler_seed;
mcs = genParams.header.mcs;
length = genParams.header.length;
appdu = genParams.header.appdu;
pkttype = genParams.header.pkttype;
training_len = genParams.header.training_len;
aggregation = genParams.header.aggregation;
beamtrackreq = genParams.header.beamtrackreq;
lastrssi = genParams.header.lastrssi;
sifsresponse = genParams.header.sifsresponse;

bits = [];

b1 = dectobin(0,4);
b2 = dectobin(sifsresponse,1);
b3 = dectobin(lastrssi,4);
b4 = dectobin(beamtrackreq,1);
b5 = dectobin(aggregation,1);
b6 = dectobin(training_len,5);
b7 = dectobin(pkttype,1);
b8 = dectobin(appdu,1);
b9 = dectobin(length,18);
b10 = dectobin(mcs,5);
b11 = dectobin(scrambler_seed,7);

bits = [b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1];

data = bits;
bitsout = genCRC(data);

header = bitsout;
return
