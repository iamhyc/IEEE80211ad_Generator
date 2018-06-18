% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genSCpacket.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified waveform
%    for specified SC PHY configuration
%    
%    [waveform] = genSCpacket(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. waveform    - waveform generated according 802.11ad Std.
%
%    Note: waveform = struct('t0',0,'dt',(1/Ts),'data', []+j*[])
%          t0   - initial time stamp
%          dt   - sampling time (sec)
%          data - complex data array 
%
%  *************************************************************************************/
function [waveform] = genSCpacket(genParams)
%generate header symbol
[HeaderSymbol genParams] = genSCheaderSymbol(genParams);
%generate data symbols
DataSymbols = genSCData(genParams);
pktSym = [HeaderSymbol DataSymbols];
%construct waveform
waveform = genParams.waveform;
waveform.dt = genParams.timeParams.Tsmp;
waveform.data = pktSym;

return
