% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genParams.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function derive required constants and parameters for packet generation
%    
%    [gParams] = genParams(Txparams)
%
%    Inputs:
%
%       1. Txparams   - input structure with generation packet configuration
%
%    Outputs:
%
%       1. gParams   -  new structure consisting of Txparams along with
%                       derived constants and parameters for                                                              
%                       specified transmit configuration
%
%  *************************************************************************************/
function [gParams] = genParams(Txparams)

gParams.txParams = Txparams;
[gParams] = genConstants(gParams);
[gParams] = genDerivedParams(gParams);

end
