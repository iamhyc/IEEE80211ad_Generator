% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genOFDMpacket.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified waveform
%    for specified OFDM PHY configuration
%    
%    [waveform] = genOFDMpacket(genParams)
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
function [waveform] = genOFDMpacket(genParams)
%generate OFDM header symbol
[HeaderSymbol genParams] = genOFDMheaderSymbol(genParams);
%generate OFDM data symbols
DataSymbols = genOFDMData(genParams);
pktSym = [HeaderSymbol DataSymbols];
%construct waveform
waveform = genParams.waveform;
waveform.dt = genParams.timeParams.Tsmp;
waveform.data = pktSym;

return
