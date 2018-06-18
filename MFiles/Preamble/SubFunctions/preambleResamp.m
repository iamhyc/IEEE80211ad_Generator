% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     preambleResamp.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function resmaples OFDM PHY and apply filter with coefficients specified in
%    802.11ad Std 
%    
%    [dataout] = preambleResamp(hfilt, datain)
%
%    Inputs:
%
%       1. hfilt   - filter coefficients specified in 802.11ad Std
%       2. datain  - complex valued preamble samples
%
%    Outputs:
%
%       1. dataout  - resampled and filtered preamble samples
%
%  *************************************************************************************/
function [dataout] = preambleResamp(hfilt, datain)

dataSize = size(datain,2);
%upsample by factor 3
upsamp = [datain.' zeros(dataSize,1) zeros(dataSize,1)];
len = size(upsamp,1) * size(upsamp,2);
upsamp = reshape(upsamp.',1,len);
%filter
filt_len = (size(hfilt,2) + 1)/2 - 1;
data_filt = conv(hfilt,upsamp);
data_filt = data_filt(filt_len+1 : end-filt_len);
%downsample by factor 2
dataout = data_filt(1:2:end);
