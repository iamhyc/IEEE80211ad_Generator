% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genCE.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified Channel Estimation(CE) sequence
%    for specified transmit configuration
%    
%    [CE] = genCE(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. CE          - CE sequence as specified in 802.11ad Std.
%
%  *************************************************************************************/
function [CE] = genCE(genParams)

dmgmethod = genParams.txParams.dmgmethod;
Ga128 = genParams.golayCode.Ga128;
Gb128 = genParams.golayCode.Gb128;
% -------------------------------
% 0 - Control PHY
% 1 - SC PHY
% 2 - OFDM PHY
% -------------------------------

Gu512 = [-Gb128 -Ga128 Gb128 -Ga128];
Gv512 = [-Gb128 Ga128 -Gb128 -Ga128];
Gv128 = -Gb128;
CEField = [];
if(dmgmethod == 2)
    CEField = [CEField Gv512 Gu512 Gv128];            
else     
    CEField = [CEField Gu512 Gv512 Gv128];
end
CE = CEField .* exp(j * [0 : (size(CEField,2)-1)] * (pi/2));
return

    
