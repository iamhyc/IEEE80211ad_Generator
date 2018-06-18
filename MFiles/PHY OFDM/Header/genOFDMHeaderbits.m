% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genOFDMHeaderbits.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified Header
%    for specified OFDM PHY configuration
%    
%    [header] = genOFDMHeaderbits(genParams)
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
function [header] = genOFDMHeaderbits(genParams)

scrambler_seed = genParams.header.scrambler_seed;
mcs = genParams.header.mcs;
length = genParams.header.length;
appdu = genParams.header.appdu;
pkttype = genParams.header.pkttype;
training_len = genParams.header.training_len;
aggregation = genParams.header.aggregation;
beamtrackreq = genParams.header.beamtrackreq;
tonepairingtype = genParams.header.tonepairingtype;
dtpindicator = genParams.header.dtpindicator;
lastrssi = genParams.header.lastrssi;
sifsresponse = genParams.header.sifsresponse;

bits = [];

b1 = dectobin(0,2);
b2 = dectobin(sifsresponse,1);
b3 = dectobin(lastrssi,4);
b4 = dectobin(dtpindicator,1);
b5 = dectobin(tonepairingtype,1);
b6 = dectobin(beamtrackreq,1);
b7 = dectobin(aggregation,1);
b8 = dectobin(training_len,5);
b9 = dectobin(pkttype,1);
b10 = dectobin(appdu,1);
b11 = dectobin(length,18);
b12 = dectobin(mcs,5);
b13 = dectobin(scrambler_seed,7);

bits = [b13 b12 b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1];


data = bits;
bitsout = genCRC(data);

header = bitsout;
return
