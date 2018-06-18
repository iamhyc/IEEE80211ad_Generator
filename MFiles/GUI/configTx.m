function [Txparams] = configTx(handles)
Txparams = [];
MCS = str2num(get(handles.MCS,'String'));
DMG = get(handles.CPHY,'Value')*0 + get(handles.SCPHY,'Value')*1 + get(handles.OFDMPHY,'Value')*2;
switch DMG
    case 0, MCSflag = (MCS==0);
    case 1, if(MCS>0 & MCS<13) MCSflag=1; else MCSflag = 0; end
    case 2, if(MCS>12 & MCS <25) MCSflag=1; else MCSflag = 0; end
end
if(~MCSflag)
    set(handles.Message,'String','Invalid MCS...valide MCS are CPHY-0;SCPHY-1 to 12,OFDMPHY-13 to 24');
else
    Txparams.dmgmethod=DMG;
    Txparams.payload.genmode = -1+get(handles.PayloadGenType,'Value');
    Txparams.payload.payload_seed = get(handles.PayloadSeed,'Value');
    Txparams.payload.payload_state = get(handles.PayloadState,'Value');
    Txparams.payload.scrambler_seed = str2num(get(handles.ScramblerSeed,'String'));
    Txparams.payload.mcs = str2num(get(handles.MCS,'String'));
    Txparams.payload.length = str2num(get(handles.PayloadLength,'String'));
    Txparams.payload.appdu = get(handles.APPDU,'Value');
    Txparams.payload.pkttype = get(handles.PacketType,'Value');
    Txparams.payload.training_len = str2num(get(handles.TrainingLength,'String'));
    Txparams.payload.aggregation = get(handles.Aggregation,'Value');
    Txparams.payload.beamtrackreq = get(handles.BeamTrackReq,'Value');
    Txparams.payload.tonepairingtype = get(handles.TonePairingType,'Value');
    Txparams.payload.dtpindicator = get(handles.DTPIndicator,'Value');
    Txparams.payload.lastrssi = str2num(get(handles.LastRSSI,'String'));
    Txparams.payload.sifsresponse = get(handles.SIFSResponse,'Value');
    Txparams.File.wfile = get(handles.Writetofile,'Value');
    Txparams.Misc.numpkts = str2num(get(handles.NumberofPackets,'String'));
    Txparams.Misc.idletime = 1e-6*str2num(get(handles.IdleTime,'String'));
end






