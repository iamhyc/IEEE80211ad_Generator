% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genSCheaderSymbol.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified SC PHY header symbols 
%    for a give SC PHY configuration
%    
%    [HeaderSymbol genParams] = genSCheaderSymbol(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. HeaderSymbol - SC PHY header symbol
%       2. genParams   - transmit configuration structure
%
%  *************************************************************************************/
function [HeaderSymbol genParams] = genSCheaderSymbol(genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end
%Generate Header Bits
header = genSCHeaderbits(genParams);
%write to file
fname = 'Header bits.txt';
if(wfile==1) write2file([pname fname],header,'binary','%1.0f'); end
%Scramble the Header Bits
seed = genParams.header.scrambler_seed;
S = dectobin(seed,7);
Scrmb = [];
[r c] = size(S);
for k1=1:7
    Scrmb(k1) = S(k1);
end
[scrambledbits nextState] = scrambler(header(8:end), Scrmb);
bits = [header(1:7) scrambledbits];
%write to file
fname = 'Scrambled Header bits.txt';
if(wfile==1) write2file([pname fname],bits,'binary','%1.0f'); end
% LDPC Encoding ( refer to 802.11ad std for more details)
Lc = 504;
Z = Lc - size(bits,2);
genMatrix = genLDPCGenMatrix(2); % 3/4
codeword = [bits zeros(1,Z)];
[paritybits] = genLDPCparity(codeword,genMatrix);
%write to file
fname = 'LDPC Encoded Header bits.txt';
if(wfile==1) write2file([pname fname],codeword,'binary','%1.0f'); end
C1 = [bits paritybits(1:160)];
C2 = [bits paritybits(1:152) paritybits(161:168)];
%write to file
fname = 'Shortened LDPC for CS1 bits.txt';
if(wfile==1) write2file([pname fname],C1,'binary','%1.0f'); end
%write to file
fname = 'Shortened LDPC for CS2 bits.txt';
if(wfile==1) write2file([pname fname],C2,'binary','%1.0f'); end
Scrmb = [1 1 1 1 1 1 1];
[r c] = size(C2);
[scrambledbits state] = scrambler(zeros(1,c), Scrmb);
C2 = xor(C2,scrambledbits);
C = [C1 C2];
%write to file
fname = 'Final CS1 CS2 Sequence bits.txt';
if(wfile==1) write2file([pname fname],C,'binary','%1.0f'); end
%QPSK modulation
symbols = BPSK(C);
N_GI = genParams.golayCode.Ga64;
%insert gaurd
SCsymbol = [N_GI symbols N_GI -1*symbols];
[r c] = size(SCsymbol);
HeaderSymbol = zeros(1,c);
%convert BPSK modulated symbols to pi/2-BPSK modulation
HeaderSymbol = SCsymbol .* exp(j * [0:(c-1)] * (pi/2));
%write to file
fname = 'Header Samples.txt';
if(wfile==1) write2file([pname fname],HeaderSymbol,'complex','%1.3f'); end
genParams.scrambler_state = nextState;

return
