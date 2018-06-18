% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genIFFTin.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified OFDM data symbols 
%    as input to IDFT module
%    
%    [FFTIn] = genIFFTin(dataSymbols,pilotSymbols,genParams)
%
%    Inputs:
%
%       1. dataSymbols  - OFDM PHY data symbols
%       2. pilotSymbols - OFDM PHY pilot symbols
%       3. genParams    - transmit configuration structure
%
%    Outputs:
%
%       1. IFFTin       - IFFT input 
%
%  *************************************************************************************/
function [IFFTin] = genIFFTin(dataSymbols,pilotSymbols,genParams)

fftSize = 512;
data_index = genParams.derived_params.ofdm.data_index;
pilot_index = genParams.derived_params.ofdm.pilot_index;

IFFTin = zeros(1,fftSize);
IFFTin(257 + data_index) = dataSymbols;
IFFTin(257 + pilot_index) = pilotSymbols;

IFFTin = [IFFTin(257:end) IFFTin(1:256)];

return
