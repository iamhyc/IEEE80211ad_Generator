% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genFileParams.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generate needed directory and file names to save
%    waveform and also intermediate data.
%    Call this function before packet generation to save the generated
%    waveform
%    Refer to 80211AD PHY Waveform Genreation.doc for more details
%
%    [Txparams] = genFileParams(Txparams,dname)
%
%    Inputs:
%
%       1. Txparams   - input structure with generation packet configuration
%       2. dname      - parent directory name to save filee
%
%    Outputs:
%
%       1. Txparams   - File controls are added under new leaf 'File'
%                       to input struct 'Txparams'
%
%  *************************************************************************************/

function [Txparams] = genFileParams(Txparams,dname)

wfile = 1;
clf = 1;
dmg = Txparams.dmgmethod;
mcs = Txparams.payload.mcs;
if(wfile==1) if(dmg==0) sdname = 'CPHY';   [S M I] = mkdir(dname,sdname); dname = [dname '\' sdname '\'];end; end
if(wfile==1) if(dmg==1) sdname = 'SCPHY';  [S M I] = mkdir(dname,sdname); s2dname = ['MCS_' num2str(mcs)]; [S M I] = mkdir([dname '\' sdname],s2dname); dname = [dname '\' sdname '\' s2dname '\'];end; end
if(wfile==1) if(dmg==2) sdname = 'OFDMPHY';[S M I] = mkdir(dname,sdname); s2dname = ['MCS_' num2str(mcs)]; [S M I] = mkdir([dname '\' sdname],s2dname); dname = [dname '\' sdname '\' s2dname '\'];end; end
if(clf == 1) delete([dname '*.txt']); end
if(wfile==1) if(dmg==0) Tname =  'CPHY_'; end; end
if(wfile==1) if(dmg==1) Tname = ['SCPHY_MCS'   num2str(mcs) '_']; end; end
if(wfile==1) if(dmg==2) Tname = ['OFDMPHY_MCS' num2str(mcs) '_']; end; end
if(wfile==1) pname = [dname Tname]; end
Txparams.File.pname = pname;
Txparams.File.dname = dname;
Txparams.File.wfile = wfile;
if(~S)
    display('Unable to create folder.Disabling File write operation');
    Txparams.File.wfile = 0;
end

return
[SUCCESS,MESSAGE,MESSAGEID]
