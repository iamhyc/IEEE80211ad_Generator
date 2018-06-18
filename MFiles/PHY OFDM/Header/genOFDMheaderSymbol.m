% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genOFDMheaderSymbol.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified OFDM header symbols 
%    for a give OFDM PHY configuration
%    
%    [HeaderSymbol genParams] = genOFDMheaderSymbol(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. HeaderSymbol - OFDM header symbol
%       2. genParams   - transmit configuration structure
%
%  *************************************************************************************/
function [HeaderSymbol genParams] = genOFDMheaderSymbol(genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end

%Generate Header Bits
header = genOFDMHeaderbits(genParams);
%write to file
fname = 'Header bits.txt';
if(wfile==1) dlmwrite([pname fname],header,' ');end
%Scramble the Header Bits
seed = genParams.header.scrambler_seed;
S = dectobin(seed,7);
Scrmb = [];
[r c] = size(S);
for k1=1:7
    Scrmb(k1) = S(k1);
end
[scrambledbits nextState] = scrambler(header(8:end),Scrmb);
bits = [header(1:7) scrambledbits];
%write to file
fname = 'Scrambled Header bits.txt';
if(wfile==1) write2file([pname fname],bits,'binary','%1.0f'); end
% LDPC Encoding
Lc = 504;
Z = Lc - size(bits,2);
%R-3/4 encoding on header symbol
genMatrix = genLDPCGenMatrix(2); % 3/4
codeword = [bits zeros(1,Z)];
[paritybits] = genLDPCparity(codeword,genMatrix);
%write to file
fname = 'LDPC Encoded Header bits.txt';
if(wfile==1) write2file([pname fname],codeword,'binary','%1.0f'); end

C1 = [bits paritybits(9:end)];
%write to file
fname = 'Shortened LDPC for CS1 bits.txt';
if(wfile==1) write2file([pname fname],C1,'binary','%1.0f'); end

C2 = [bits paritybits(1:84) paritybits(93:end)];
%write to file
fname = 'Shortened LDPC for CS2 bits.txt';
if(wfile==1) write2file([pname fname],C2,'binary','%1.0f'); end
Scrmb = [1 1 1 1 1 1 1];
[r c] = size(C2);
[scrambledbits state] = scrambler(zeros(1,c),Scrmb);
C2 = xor(C2,scrambledbits);

C3 = [bits paritybits(1:160)];
%write to file
fname = 'Shortened LDPC for CS3 bits.txt';
if(wfile==1) write2file([pname fname],C3,'binary','%1.0f'); end
[r c] = size(C3);
Scrmb = state;
[scrambledbits state] = scrambler(zeros(1,c),Scrmb);
C3 = xor(C3,scrambledbits);

C = [C1 C2 C3];
%write to file
fname = 'Final CS1 CS2 CS3 Sequence bits.txt';
if(wfile==1) write2file([pname fname],C,'binary','%1.0f'); end

%QPSK modulation
symbols = QPSK(C);
%write to file
fname = 'Constellation Mapped Data Points.txt';
if(wfile==1) write2file([pname fname],symbols,'complex','%1.3f'); end

% Insert pilots and do fft
[OFDMsymbol genParams IFFTin] = genOFDMSymbol(symbols,genParams);
%write to file
fname = 'IFFT Input Samples.txt';
if(wfile==1) write2file([pname fname],IFFTin,'complex','%1.3f'); end

HeaderSymbol = OFDMsymbol;
%write to file
fname = 'Header Samples.txt';
if(wfile==1) write2file([pname fname],HeaderSymbol,'complex','%1.3f'); end

genParams.scrambler_state = nextState;

return
