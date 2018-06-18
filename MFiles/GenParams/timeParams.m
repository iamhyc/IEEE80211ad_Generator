% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     timeParams.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function derive Time parameters as specified in 802.11ad std
%    
%    [genParams] = timeParams(genParams)
%
%    Inputs:
%
%       1. genParams - transmit configuration strucure
%
%    Outputs:
%
%       1. genParams - transmit configuration strucure
%
%  *************************************************************************************/
function [genParams] = timeParams(genParams)

TimeParams = [];

TimeParams.Nsd = 336;                                       %Number of Data subcarriers
TimeParams.Nsp = 16;                                        %Number of pilot subcarriers
TimeParams.Ndc = 3;                                         %Number of DC subcarriers
TimeParams.Nst = 355;                                       %Total subcarriers
TimeParams.Nsr = 177;                                       %OFDM sample rate
TimeParams.fs = 2640e+6;                                    %OFDM sample rate
TimeParams.fc = 1760e+6;                                    %SC/CPHY chip rate
TimeParams.ts = 1/TimeParams.fs;                            %OFDM sample Period
TimeParams.tc = 1/TimeParams.fc;                            %SC sample period
TimeParams.Sfft = 512;                                      %FFT size
TimeParams.Tdft = TimeParams.Sfft * TimeParams.ts;          %DFT duration
TimeParams.Tg = TimeParams.Tdft/4;                          %Gaurd Interval
TimeParams.Tsym = TimeParams.Tdft + TimeParams.Tg;          %Total Symbol Duration
                                                            %Derive samplerate                                                      
if genParams.txParams.dmgmethod == 2
    TimeParams.Tsmp = TimeParams.ts;
else
    TimeParams.Tsmp = TimeParams.tc;
end


genParams.timeParams = TimeParams;
return
