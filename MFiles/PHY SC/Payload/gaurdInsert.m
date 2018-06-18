% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     gaurdInsert.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function insert Ga64 gaurd to each SC PHY modulated block as specified
%    in 802.11ad std
%    
%    [Samples] = gaurdInsert(genParams,modSym)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%       2. modSym      - modulated symbols blocks
%
%    Outputs:
%
%       1. Samples -  gaurd inserted modulated symbols blocks(linearized)
%
%  *************************************************************************************/
function [Samples] = gaurdInsert(genParams,modSym)

len = length(modSym);
Ncbpb = genParams.derived_params.Ncbpb;
Ncbps = genParams.derived_params.Ncbps;
c = Ncbpb/Ncbps;
r = len/c;

Ga64 = genParams.golayCode.Ga64;
GaSp = Ga64 .* exp(j*[0:64-1]*(pi/2));

Samples = [];
for k = 1:r
    Samples = [ Samples GaSp modSym( ((k-1)*c+1) : k*c )];
end

Samples = [Samples GaSp];

return
