% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genPilotSymbols.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified OFDM pilot symbols 
%    for a give OFDM PHY configuration
%    
%    [pilotSymbols genParams] = genPilotSymbols(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. pilotSymbols  - OFDM header symbol
%       2. genParams     - transmit configuration structure
%
%  *************************************************************************************/
function [pilotSymbols genParams] = genPilotSymbols(genParams)

LFSRstate = genParams.derived_params.ofdm.pilot_LFSRstate;
[pn state]=  scrambler(zeros(1),LFSRstate);
genParams.derived_params.ofdm.pilot_LFSRstate = state;

pilots = genParams.derived_params.ofdm.pilots;

pilotSymbols = (2*pn - 1) * pilots;

return
