% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genSCData.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified data symbols
%    for specified SC PHY configuration
%    
%    [DataSymbols] = genSCData(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. DataSymbols - SC payload data symbols
%
%  *************************************************************************************/
function [DataSymbols] = genSCData(genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end

%add encoding zero padding and block zero padding
databits = genParams.payload;
Npad = genParams.derived_params.ldpc.Npad;
Nbpad = genParams.derived_params.ldpc.Nbpad;
enc_bitlen = size(databits,2) + Npad;
databits = [databits zeros(1,Npad) zeros(1,Nbpad)];
%scramble data bits
Scrmb = genParams.scrambler_state;
[bits state] = scrambler(databits, Scrmb);
%write to file
fname = 'Scrambled Payload bits.txt';
if(wfile==1) write2file([pname fname],bits,'binary','%1.0f'); end
%LDPC encoding
encodedbits = genSCEncodedBits(bits(1:enc_bitlen), genParams);
%write to file
fname = 'LDPC Encoder Output bits.txt';
if(wfile==1) write2file([pname fname],encodedbits,'binary','%1.0f'); end
%add scrambled block padding bits 
encodedbits = [encodedbits bits(enc_bitlen+1:end)];
%write to file
fname = 'LDPC Encoded Payload bits.txt';
if(wfile==1) write2file([pname fname],encodedbits,'binary','%1.0f'); end
%modulation mapping
modSymbols = genSCModMap(encodedbits, genParams);
%write to file
fname = 'Payload Samples.txt';
if(wfile==1) write2file([pname fname],modSymbols,'complex','%1.3f'); end
DataSymbols = modSymbols;

return
