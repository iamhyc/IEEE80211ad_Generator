function openingFcn(handles)
%Start up programming

%include sub-directory path
startup;

%Configure CPHY 
set(handles.CPHY,'Value',1);
set(handles.SCPHY,'Value',0);
set(handles.OFDMPHY,'Value',0);
set(handles.MCS, 'String', '0');
set(handles.ScramblerSeed, 'String', 66);
set(handles.PayloadLength, 'String', 120);

%Disable non-Control PHY header parameters
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

%configure popup-menus
set(handles.PayloadGenType, 'String', {'random', 'count'});
set(handles.PayloadGenType, 'Value', 1);
set(handles.PayloadSeed, 'String', 0);
set(handles.PayloadState, 'String', 12);

set(handles.PlotOptions, 'String', {'abs(waveform)', 'real(waveform)','imag(waveform'});
set(handles.PlotOptions, 'Value', 1);
%set(handles.PlotOptions, 'String', {'abs(waveform)'});
set(handles.PlotOptions,'Value',1);
set(handles.UpdatePlot,'Visible','on');

%Write to file operations are disabled
set(handles.Writetofile,'Value',0);
set(handles.FileDirectoryPath,'String','');
set(handles.Message,'String','');

%Iterations & Idle time are configured to default
set(handles.NumberofPackets,'String',1);
set(handles.IdleTime,'String',2);

axes(handles.Waveform);cla;

set(handles.Prem,'Title','Tm');
return
