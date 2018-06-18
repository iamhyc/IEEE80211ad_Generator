% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genSCModMap.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function performs modulation mapping as specified by transmit SC PHY
%    configuration
%    
%    [modSymbols] = genSCModMap(encodedbits, genParams)
%
%    Inputs:
%
%       1. encodedbits - encoded bits
%       2. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. modSymbols -  modulated symbols
%
%  *************************************************************************************/
function [modSymbols] = genSCModMap(encodedbits, genParams)
%modulation mapping
derived_params = genParams.derived_params;
modtype = derived_params.modtype;

if(modtype == 0)
    dataSym = BPSK(encodedbits);
elseif(modtype == 1)
    dataSym = QPSK_PIby2(encodedbits);
else
    dataSym = QAM16_PIby2(encodedbits);
end

len = length(dataSym);
modSymbols = dataSym .* exp(j*[0:len-1]*(pi/2));
%add gaurd symbol
modSym = gaurdInsert(genParams,modSymbols);
modSymbols = modSym;

return

