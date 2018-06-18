% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genLDPCParams.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates LDPC encoding parameters for specified transmit
%    configuration
%    
%    [derived_params] = genLDPCParams(derived_params,dmgmethod)
%
%    Inputs:
%
%       1. derived_params   - input derived parameters structure
%       2. dmgmethod        - specifies dmg phy method
%
%    Outputs:
%
%       1. derived_params   - updated derived parameters structure with
%                             generation LDPC parameters
%
%  *************************************************************************************/
function [derived_params] = genLDPCParams(derived_params,dmgmethod)

Length = derived_params.length;
if(dmgmethod ~= 0)
    Renum = derived_params.R;
    Ncbps = derived_params.Ncbps;
    if(Renum == 0) R = 1/2;   end
    if(Renum == 1) R = 5/8;   end
    if(Renum == 2) R = 3/4;   end
    if(Renum == 3) R = 13/16; end
end
if(dmgmethod == 0)
    Lc     = 504;
    Lcwd   = 168;
    Ncw    = 1 + ceil( (Length-6)*8/Lcwd );
    Ldpcw  = ceil( (Length-6)*8/(Ncw-1) );
    Ldplcw = (Length-6)*8 - (Ncw-2)*Ldpcw;
    
    derived_params.ldpc.Lc = Lc;
    derived_params.ldpc.Lcwd = Lcwd;
    derived_params.ldpc.Ncw  = Ncw;
    derived_params.ldpc.Ldpfcw = 88;
    derived_params.ldpc.Ldpcw = Ldpcw;
    derived_params.ldpc.Ldplcw = Ldplcw;
    derived_params.R = 2;

elseif(dmgmethod == 1)
    RepF = derived_params.rep;
    Lcw = 672; 
    Ncw = ceil( Length*8/(Lcw*R/RepF) );
    Npad = (Ncw*R*Lcw/RepF) - Length*8;
    Lcwd = Lcw * R/RepF;
    
    derived_params.ldpc.Lcw = Lcw;
    derived_params.ldpc.Lcwd = Lcwd;
    derived_params.ldpc.Ncw  = Ncw;
    derived_params.ldpc.Npad  = Npad; 
    
    Ncbpb = derived_params.Ncbpb;
    Nblk = ceil((Ncw * Lcw)/Ncbpb);
    Nbpad = Nblk * Ncbpb - Ncw * Lcw;
    derived_params.ldpc.Nblk  = Nblk;
    derived_params.ldpc.Nbpad  = Nbpad;
else
    Lcw = 672;
    Ncw = ceil( Length * 8/(Lcw * R) );
    Nsym = ceil(Ncw * Lcw/Ncbps);
    Npad = R * Nsym * Ncbps - Length*8;
    Ncw = Nsym * (Ncbps/Lcw);
    Lcwd = Lcw * R;

    derived_params.ldpc.Ncw = Ncw;
    derived_params.Nsym = Nsym;
    derived_params.ldpc.Npad = Npad;
    derived_params.ldpc.Lcw = Lcw;
    derived_params.ldpc.Lcwd = Lcwd;
end


return
