% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genSTF.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified Short Training Field(STF)
%    for specified transmit configuration
%    
%    [stf] = genSTF(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. stf         - STF as specified in 802.11ad Std.
%
%  *************************************************************************************/
function [stf] = genSTF(genParams)

dmgmethod = genParams.txParams.dmgmethod;
Ga128 = genParams.golayCode.Ga128;
Gb128 = genParams.golayCode.Gb128;
% -------------------------------
% 0 - Control PHY
% 1 - SC PHY
% 2 - OFDM PHY
% -------------------------------
STField = [];
if(dmgmethod == 0)
    for k=1:48,
        STField = [STField Gb128]; 
    end
    STField = [STField -Gb128 -Ga128];           
else
    for k=1:16,
        STField = [STField Ga128]; 
    end
    STField = [STField -Ga128];
end
stf = STField .* exp(j * [0 : (size(STField,2)-1)] * (pi/2));
return

    
