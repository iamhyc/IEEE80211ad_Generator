% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     Generator_80211adPHY.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    GENERATOR_80211ADPHY M-file creates IEEE 802.11ad Std specified PHY transmit waveforms
%
%    Call this function from 'Generator' folder path to avoid unresolved file paths. Also run
%    'genstartup.m' M-File once in startup
%
%  *************************************************************************************/

%********************************************************************
%----------- IEEE 802.11ad Packet Generation Script -----------------
%********************************************************************
clc; close all;clear all; warning off;
%include sub-directory path
startup;
%Transmit Configuration
Txparams = [];
%0-CPHY; 1-SCPHY; 2-OFDMPHY
Txparams.dmgmethod=2;
%0-Random; 1-CountBytes
Txparams.payload.genmode = 0;
Txparams.payload.payload_seed = 0;
Txparams.payload.payload_state = 10;
%Range [0 127]
Txparams.payload.scrambler_seed = 66;
%Rangle CPHY[0]; SCPHY[1 12]; OFDMPHY[13 24]
Txparams.payload.mcs = 13;
%Rangle CPHY[14 1023]; SCPHY[0 262143]; OFDMPHY[0 262143]
Txparams.payload.length = 120;
%Rangle [0 1]
Txparams.payload.appdu = 0;
%Rangle [0 1]
Txparams.payload.pkttype = 0;
%Rangle [0 31]
Txparams.payload.training_len = 0;
%Rangle [0 1]
Txparams.payload.aggregation = 0;
%Rangle [0 1]
Txparams.payload.beamtrackreq = 0;
%Rangle [0 1]
Txparams.payload.tonepairingtype = 0;
%Rangle [0 1]
Txparams.payload.dtpindicator = 0;
%Rangle [0 15]
Txparams.payload.lastrssi = 0;
%Rangle [0 1]
Txparams.payload.sifsresponse = 0;
%File Write Control
Txparams.File.wfile = 0;
%Number of Packets
Txparams.Misc.numpkts = 5;
%Idle time (sec)
Txparams.Misc.idletime = 2e-6;
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
%Only 3 M-File API
% File Controls
dname = 'C:\PREM\11AD\Code\MatlabCode\DataFiles';
if(Txparams.File.wfile) [Txparams] = genFileParams(Txparams,dname); end
% Derive generation parameters
[gParams] = genParams(Txparams);
% Packet generation
wfm = gParams.waveform;
for numpkt = 1:Txparams.Misc.numpkts
    [gParams waveform] = genPacket(gParams);
    wfm.data = [wfm.data waveform.data];
end
%^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% Plot waveform
plotEnable = 1;
dmg = Txparams.dmgmethod;
mcs = Txparams.payload.mcs;
if(plotEnable) if(dmg==0) T = 'C PHY'; end; end
if(plotEnable) if(dmg==1) T = 'SC PHY';   T = [T ' MCS:' num2str(mcs)]; end; end
if(plotEnable) if(dmg==2) T = 'OFDM PHY'; T = [T ' MCS:' num2str(mcs)]; end; end
if(plotEnable) H = figure; plot(abs(wfm.data),'-'); xlabel('Enumerated Sample Index');ylabel('abs(waveform)'); title(T);grid on;end
