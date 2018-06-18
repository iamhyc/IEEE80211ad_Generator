% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genPreamble.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates 802.11ad Std specified preamble (Short Training Field(STF) and Channel
%    Estimation(CE) sequence for specified transmit configuration
%    
%    [preamble] = genPreamble(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. preamble    - preamble generated according 802.11ad Std.
%
%    Note: preamble = struct('t0',0,'dt',(1/Ts),'data', []+j*[])
%          t0   - initial time stamp
%          dt   - sampling time (sec)
%          data - complex data array 
%
%  *************************************************************************************/
function [preamble] = genPreamble(genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end
%Short Training Field
STF = genSTF(genParams);
%Channel Estimation Sequence
CE = genCE(genParams);
prmb = [STF CE];
%OFDM PHY preamble resample (3/2) filter
if(genParams.txParams.dmgmethod == 2)
    hfilt = genParams.hfilt;
    prmb = preambleResamp(hfilt,prmb);
end
%waveform structure
preamble = genParams.waveform;
preamble.dt = genParams.timeParams.Tsmp;
preamble.data = prmb;
%write to file
fname = 'Preamble Samples.txt';
dmg = genParams.txParams.dmgmethod;
if(dmg==0) if(wfile==1) write2file([dname 'CPHY_' fname],preamble.data,'complex','%1.3f'); end; end;
if(dmg==1) if(wfile==1) write2file([dname 'SCPHY_' fname],preamble.data,'complex','%1.3f'); end; end;
if(dmg==2) if(wfile==1) write2file([dname 'OFDMPHY_' fname],preamble.data,'complex','%1.3f'); end; end;

return
