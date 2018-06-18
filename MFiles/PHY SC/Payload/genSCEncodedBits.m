% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genSCEncodedBits.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs encoding on scrambled bits as specified in 802.11ad
%    Std for SC PHY
%    
%    [encodedbits] = genSCEncodedBits(scrambledbits, genParams)
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
function [encodedbits] = genSCEncodedBits(scrambledbits, genParams)
%read LDPC parameters
Lcwd = genParams.derived_params.ldpc.Lcwd;
Lcw = genParams.derived_params.ldpc.Lcw;
Ncw = genParams.derived_params.ldpc.Ncw;
RepF = genParams.derived_params.rep;
%generation matrix
genMatrix = genParams.derived_params.ldpc.genMatrix;

encodedbits = [];
%scrambler for cases with repition factor '2'
if(RepF == 2)
    Scrmb = [1 1 1 1 1 1 1];
    c = 168;
    [scrambledbits_2 state] = scrambler(zeros(1,c), Scrmb);
end
%encoding process
for k1 = 1:Ncw
    if(RepF == 2)
        Cw = scrambledbits((k1-1)*Lcwd+1 : (k1*Lcwd));
        Cwd = [Cw zeros(1,size(Cw,2))];
        [paritybits] = genLDPCparity(Cwd,genMatrix);
        C1 = xor(Cw,scrambledbits_2);
        encodedbits = [encodedbits Cw C1 paritybits];
    else
        Cw = scrambledbits((k1-1)*Lcwd+1 : (k1*Lcwd));
        [paritybits] = genLDPCparity(Cw,genMatrix);
        encodedbits = [encodedbits Cw paritybits];
    end
end

return
