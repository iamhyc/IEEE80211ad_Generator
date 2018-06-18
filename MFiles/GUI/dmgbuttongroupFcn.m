function dmgbuttongroupFcn(hObject,handles)
%Clear waveform axes
axes(handles.Waveform);cla;
%Insignificant header parameters are disabled
if(hObject == handles.CPHY)
    %Control PHY header configuration
    %Default MCS
    set(handles.MCS, 'String', '0');
    set(handles.MCS, 'Enable', 'off');
    set(handles.MCSTitle, 'Enable', 'off');
    set(handles.LastRSSI, 'Enable', 'off');
    set(handles.LastRSSITitle, 'Enable', 'off');
    set(handles.APPDU, 'Enable', 'off');
    set(handles.Aggregation, 'Enable', 'off');
    set(handles.BeamTrackReq, 'Enable', 'off');
    set(handles.TonePairingType, 'Enable', 'off');
    set(handles.DTPIndicator, 'Enable', 'off');
    
    set(handles.TrainingLength, 'Enable', 'off');
    set(handles.TrainingLengthTitle, 'Enable', 'off');
    set(handles.TrainingLength, 'String', '0');
    set(handles.PacketType, 'Enable', 'off');
    set(handles.PacketType, 'Value', 0);
    set(handles.SIFSResponse, 'Enable', 'off');
    set(handles.SIFSResponse, 'Value', 0);
elseif(hObject == handles.SCPHY)
    %SC PHY header configuration
    %Default MCS
    set(handles.MCS, 'String', '1');
    set(handles.MCS, 'Enable', 'on');
    set(handles.MCSTitle, 'Enable', 'on');
    
    set(handles.LastRSSI, 'Enable', 'off');
    set(handles.LastRSSITitle, 'Enable', 'off');
    set(handles.APPDU, 'Enable', 'off');
    set(handles.Aggregation, 'Enable', 'off');
    set(handles.BeamTrackReq, 'Enable', 'off');
    set(handles.TonePairingType, 'Enable', 'off');
    set(handles.DTPIndicator, 'Enable', 'off');

elseif(hObject == handles.OFDMPHY)
    %OFDM PHY header configuration
    %Default MCS
    set(handles.MCS, 'String', '13');
    set(handles.MCS, 'Enable', 'on');
    set(handles.MCSTitle, 'Enable', 'on');
    set(handles.LastRSSI, 'Enable', 'off');
    set(handles.LastRSSITitle, 'Enable', 'off');
    set(handles.APPDU, 'Enable', 'off');
    set(handles.Aggregation, 'Enable', 'off');
    set(handles.BeamTrackReq, 'Enable', 'off');
    set(handles.TonePairingType, 'Enable', 'off');
    set(handles.DTPIndicator, 'Enable', 'off');
end
