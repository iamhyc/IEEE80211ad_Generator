% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genOFDMEncodedBits.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs encoding on scrambled bits as specified in 802.11ad
%    Std for OFDM PHY
%    
%    [encodedbits] = genOFDMEncodedBits(scrambledbits, genParams)
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
function [encodedbits] = genOFDMEncodedBits(scrambledbits, genParams)

Lcwd = genParams.derived_params.ldpc.Lcwd;
Lcw = genParams.derived_params.ldpc.Lcw;
Ncw = genParams.derived_params.ldpc.Ncw;

genMatrix = genParams.derived_params.ldpc.genMatrix;

encodedbits = [];
for k1 = 1:Ncw
    Cw = scrambledbits((k1-1)*Lcwd+1 : (k1*Lcwd));    
    [paritybits] = genLDPCparity(Cw,genMatrix);
    encodedbits = [encodedbits Cw paritybits];
end

return
