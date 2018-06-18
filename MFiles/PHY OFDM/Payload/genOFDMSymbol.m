% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genOFDMSymbol.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified OFDM data symbols 
%    for a give OFDM PHY configuration
%    
%    [OFDMsymbol genParams IFFTin] = genOFDMSymbol(dataSymbols,genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. OFDMsymbol  - OFDM header symbol
%       2. genParams   - transmit configuration structure
%       3. FFTIn       - IFFT input 
%
%  *************************************************************************************/
function [OFDMsymbol genParams IFFTin] = genOFDMSymbol(dataSymbols,genParams)
%generate pilot symbols
[pilotSymbols genParams] = genPilotSymbols(genParams);
%stack symbols in order to feed in to FFT
[IFFTin] = genIFFTin(dataSymbols,pilotSymbols,genParams);
%perform IFFT
IFFTout = 512 * sqrt(1/352)* ifft(IFFTin,512);

%Cyclic prefix
OFDMsymbol = [IFFTout(end-128+1:end) IFFTout];

return




