% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genConstants.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates time constants, golay constants and Hfil for OFDM
%    PHY for specified transmit configuration
%    
%    [genParams] = genConstants(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. genParams   - derived constants are appended to transmit
%                        configuration structure
%
%  *************************************************************************************/
function [genParams] = genConstants(genParams)

%Time parameters
genParams = timeParams(genParams);

% Golay Codes
gConstants = golay_constants(); % golay constants
genParams.golayCode = gConstants;

%OFDM Resampling Filter
h = [-1,0,1,1,-2,-3,0,5,5,-3,-9,-4,10,14,-1,-20,-16,14,33,9,-35,...
    -42,11,64,40,-50,-96,-15,120,126,-62,-256,-148,360,985,...
    1267,...
    985,360,-148,-256,-62,126,120,-15,-96,-50,40,64,11,-42,...
     -35,9,33,14,-16,-20,-1,14,10,-4,-9,-3,5,5,0,-3,-2,1,1,0,-1];
 
hfilt = sqrt(3) * h / (sqrt( sum ( h.^2) ));

genParams.hfilt = hfilt; 

%Waveform structure
Ts = 1;
waveform = struct('t0',0,'dt',(1/Ts),'data', []+j*[]);
genParams.waveform = waveform;

return
