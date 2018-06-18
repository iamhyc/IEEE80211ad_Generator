% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genOFDMData.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified data symbols
%    for specified OFDM PHY configuration
%    
%    [DataSymbols] = genOFDMData(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. DataSymbols - OFDM payload data symbols
%
%  *************************************************************************************/
function [DataSymbols] = genOFDMData(genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end
%encoding zero padding
databits = genParams.payload;
Npad = genParams.derived_params.ldpc.Npad;
databits = [databits zeros(1,Npad)];
%scramble payload data bits
Scrmb = genParams.scrambler_state;
[bits state] = scrambler(databits, Scrmb);
%write to file
fname = 'Scrambled Payload bits.txt';
if(wfile==1) write2file([pname fname],bits,'binary','%1.0f'); end
%encode scrambled bits
encodedbits = genOFDMEncodedBits(bits, genParams);
%write to file
fname = 'LDPC Encoded Payload bits.txt';
if(wfile==1) write2file([pname fname],encodedbits,'binary','%1.0f'); end
%OFDM modulation
modSymbols = genOFDMModMap(encodedbits, genParams);

DataSymbols = modSymbols;
return
