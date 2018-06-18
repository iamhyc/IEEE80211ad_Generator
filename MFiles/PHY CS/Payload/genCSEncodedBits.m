% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genCSEncodedBits.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs encoding on scrambled bits as specified in 802.11ad
%    Std for CONTROL PHY
%    
%    [encodedbits] = genCSEncodedBits(scrambledbits, genParams)
%
%    Inputs:
%
%       1. scrambledbits  - scrambled bit stream
%       2. genParams      - transmit configuration structure
%
%    Outputs:
%
%       1. encodedbits - encoded bit stream
%
%  *************************************************************************************/
function [encodedbits] = genCSEncodedBits(scrambledbits, genParams)
%read ldpc parameters
lpdc = genParams.derived_params.ldpc;
Lcwd = genParams.derived_params.ldpc.Lcwd;
Ldpcw = genParams.derived_params.ldpc.Ldpcw;
Ldplcw = genParams.derived_params.ldpc.Ldplcw;
Ldpfcw = genParams.derived_params.ldpc.Ldpfcw;
Lc = genParams.derived_params.ldpc.Lc;
Ncw = genParams.derived_params.ldpc.Ncw;
%fragment scrambled bits into 'first' , 'after-first pre-last' and 'last' symbol chunks
CwF = scrambledbits(1:Ldpfcw);
CwO = scrambledbits(Ldpfcw+1:end-Ldplcw);
CwL = scrambledbits(end-Ldplcw+1:end);
%Zeros length
ZF = Lc - size(CwF,2);
ZO = Lc - Ldpcw;
ZL = Lc - size(CwL,2);

encodedbits = [];
genMatrix = genParams.derived_params.ldpc.genMatrix;
%First Code Word
codeword = [CwF zeros(1,ZF)];
[paritybits] = genLDPCparity(codeword,genMatrix);
encodedbits = [encodedbits CwF paritybits];
%Other Code Words
for k1 = 1:(Ncw-2)
    Cw = CwO((k1-1)*Ldpcw+1 : (k1*Ldpcw));
    codeword = [Cw zeros(1,ZO)];
    [paritybits] = genLDPCparity(codeword,genMatrix);
    encodedbits = [encodedbits Cw paritybits];
end
%Last Code Word
codeword = [CwL zeros(1,ZL)];
[paritybits] = genLDPCparity(codeword,genMatrix);
encodedbits = [encodedbits CwL paritybits];

return
