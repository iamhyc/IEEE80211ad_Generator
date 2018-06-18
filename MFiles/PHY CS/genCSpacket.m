% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genCSpacket.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified waveform
%    for specified CONTROL PHY configuration
%    
%    [waveform] = genCSpacket(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. waveform    - waveform generated according 802.11ad Std.
%
%    Note: waveform = struct('t0',0,'dt',(1/Ts),'data', []+j*[])
%          t0   - initial time stamp
%          dt   - sampling time (sec)
%          data - complex data array 
%
%  *************************************************************************************/
function [waveform] = genCSpacket(genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end
%genereate header bits
header = genCSHeaderbits(genParams);
%write to file
fname = 'Header bits.txt';
if(wfile==1) write2file([pname fname],header,'binary','%1.0f'); end
%create payload
payload = genParams.payload;
databits = [header payload];
%write to file
fname = 'Header and Payload bits.txt';
if(wfile==1) write2file([pname fname],databits,'binary','%1.0f'); end
%scramble payload bits
seed = genParams.header.scrambler_seed;
S = dectobin(seed,7);
Scrmb = ones(1,7);
[r c] = size(S);
for k1=1:4
    Scrmb(k1) = S(k1);
end
[scrambledbits state] = scrambler(databits(6:end), Scrmb);
bits = [0 Scrmb(1:4) scrambledbits];
%write to file
fname = 'Scrambled Header And Payload bits.txt';
if(wfile==1) write2file([pname fname],bits,'binary','%1.0f'); end
%encode scrambled bits
encodedbits = genCSEncodedBits(bits, genParams);
%write to file
fname = 'LDPC Encoded Header and Payload bits.txt';
if(wfile==1) write2file([pname fname],encodedbits,'binary','%1.0f'); end
%DBPSK modulation mapping
symbols = DBPSK(encodedbits);
%write to file
fname = 'Diff Encoded Header and Payload symbols.txt';
if(wfile==1) write2file([pname fname],symbols,'real','%1.0f'); end
%Spread modulated symbols
Ga32 = genParams.golayCode.Ga32;
spreadcode = spreadCScode(symbols,Ga32);
%write to waveform
fname = 'Header and Payload Samples.txt';
if(wfile==1) write2file([pname fname],spreadcode,'complex','%1.3f'); end
%construct output waveform
waveform = genParams.waveform;
waveform.dt = genParams.timeParams.Tsmp;
waveform.data = spreadcode;

return
