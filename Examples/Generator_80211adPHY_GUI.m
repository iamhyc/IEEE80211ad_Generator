% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     Generator_80211adPHY_GUI.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    GENERATOR_80211ADPHY_GUI M-file for Generator_80211adPHY_GUI.fig
%    GENERATOR_80211ADPHY_GUI, by itself, creates a new GENERATOR_80211ADPHY_GUI or raises the existing
%    singleton*
%
%    GENERATOR_80211ADPHY_GUI.fig creates IEEE 802.11ad Std specified PHY transmit waveforms
%
%    Call this function from 'Generator' folder path to avoid unresolved file paths. Also run
%    'startup.m' M-File once in startup
%
%  *************************************************************************************/

function varargout = Generator_80211adPHY_GUI(varargin)
%GENERATOR_80211ADPHY_GUI M-file for Generator_80211adPHY_GUI.fig
%      GENERATOR_80211ADPHY_GUI, by itself, creates a new GENERATOR_80211ADPHY_GUI or raises the existing
%      singleton*.
%
%      H = GENERATOR_80211ADPHY_GUI returns the handle to a new GENERATOR_80211ADPHY_GUI or the handle to
%      the existing singleton*.
%
%      GENERATOR_80211ADPHY_GUI('Property','Value',...) creates a new GENERATOR_80211ADPHY_GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Generator_80211adPHY_GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GENERATOR_80211ADPHY_GUI('CALLBACK') and GENERATOR_80211ADPHY_GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GENERATOR_80211ADPHY_GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Generator_80211adPHY_GUI

% Last Modified by GUIDE v2.5 11-Apr-2014 18:36:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @Generator_80211adPHY_GUI_OpeningFcn, ...
    'gui_OutputFcn',  @Generator_80211adPHY_GUI_OutputFcn, ...
    'gui_LayoutFcn',  [], ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Generator_80211adPHY_GUI is made visible.
function Generator_80211adPHY_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
%Sartup programming
openingFcn(handles);
% Choose default command line output for Generator_80211adPHY_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Generator_80211adPHY_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
return

% --- Outputs from this function are returned to the command line.
function varargout = Generator_80211adPHY_GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
return

% --- Executes on selection change in PayloadGenType.
function PayloadGenType_Callback(hObject, eventdata, handles)
% hObject    handle to PayloadGenType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns PayloadGenType contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PayloadGenType
return

% --- Executes during object creation, after setting all properties.
function PayloadGenType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PayloadGenType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function PayloadState_Callback(hObject, eventdata, handles)
% hObject    handle to PayloadState (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PayloadState as text
%        str2double(get(hObject,'String')) returns contents of PayloadState as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
%verifyEditTextforrange_CallbackFcn(hObject,handles,min,max);
return

% --- Executes during object creation, after setting all properties.
function PayloadState_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PayloadState (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function PayloadSeed_Callback(hObject, eventdata, handles)
% hObject    handle to PayloadSeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PayloadSeed as text
%        str2double(get(hObject,'String')) returns contents of PayloadSeed as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
%verifyEditTextforrange_CallbackFcn(hObject,handles,min,max);
return

% --- Executes during object creation, after setting all properties.
function PayloadSeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PayloadSeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

% --- Executes on button press in PacketType.
function PacketType_Callback(hObject, eventdata, handles)
% hObject    handle to PacketType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of PacketType
return

% --- Executes on button press in SIFSResponse.
function SIFSResponse_Callback(hObject, eventdata, handles)
% hObject    handle to SIFSResponse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SIFSResponse
return

% --- Executes on button press in APPDU.
function APPDU_Callback(hObject, eventdata, handles)
% hObject    handle to APPDU (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of APPDU
return

% --- Executes on button press in Aggregation.
function Aggregation_Callback(hObject, eventdata, handles)
% hObject    handle to Aggregation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Aggregation
return

% --- Executes on button press in BeamTrackReq.
function BeamTrackReq_Callback(hObject, eventdata, handles)
% hObject    handle to BeamTrackReq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of BeamTrackReq
return

% --- Executes on button press in TonePairingType.
function TonePairingType_Callback(hObject, eventdata, handles)
% hObject    handle to TonePairingType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of TonePairingType
return

function LastRSSI_Callback(hObject, eventdata, handles)
% hObject    handle to LastRSSI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LastRSSI as text
%        str2double(get(hObject,'String')) returns contents of LastRSSI as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
verifyEditTextforrange_CallbackFcn(hObject,handles,0,15);
return

% --- Executes during object creation, after setting all properties.
function LastRSSI_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LastRSSI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function MCS_Callback(hObject, eventdata, handles)
% hObject    handle to MCS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MCS as text
%        str2double(get(hObject,'String')) returns contents of MCS as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
dmg = 0*get(handles.CPHY,'Value') + 1*get(handles.SCPHY,'Value') + 2*get(handles.OFDMPHY,'Value');
switch dmg
    case 0,verifyEditTextforrange_CallbackFcn(hObject,handles,0,0);
    case 1,verifyEditTextforrange_CallbackFcn(hObject,handles,1,12);
    case 2,verifyEditTextforrange_CallbackFcn(hObject,handles,13,24);

end
return

% --- Executes during object creation, after setting all properties.
function MCS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MCS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function ScramblerSeed_Callback(hObject, eventdata, handles)
% hObject    handle to ScramblerSeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ScramblerSeed as text
%        str2double(get(hObject,'String')) returns contents of ScramblerSeed as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
verifyEditTextforrange_CallbackFcn(hObject,handles,0,127);
return

% --- Executes during object creation, after setting all properties.
function ScramblerSeed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ScramblerSeed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function PayloadLength_Callback(hObject, eventdata, handles)
% hObject    handle to PayloadLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of PayloadLength as text
%        str2double(get(hObject,'String')) returns contents of PayloadLength as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
dmg = 0*get(handles.CPHY,'Value') + 1*get(handles.SCPHY,'Value') + 2*get(handles.OFDMPHY,'Value');
switch dmg
    case 0,verifyEditTextforrange_CallbackFcn(hObject,handles,14,1023.);
    case 1,verifyEditTextforrange_CallbackFcn(hObject,handles,0,262143);
    case 2,verifyEditTextforrange_CallbackFcn(hObject,handles,0,262143);
end
return

% --- Executes during object creation, after setting all properties.
function PayloadLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PayloadLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function TrainingLength_Callback(hObject, eventdata, handles)
% hObject    handle to TrainingLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TrainingLength as text
%        str2double(get(hObject,'String')) returns contents of TrainingLength as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
verifyEditTextforrange_CallbackFcn(hObject,handles,0,31);
return

% --- Executes during object creation, after setting all properties.
function TrainingLength_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TrainingLength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

% --- Executes on button press in DTPIndicator.
function DTPIndicator_Callback(hObject, eventdata, handles)
% hObject    handle to DTPIndicator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of DTPIndicator
return

% --- Executes on selection change in PlotOptions.
function PlotOptions_Callback(hObject, eventdata, handles)
% hObject    handle to PlotOptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns PlotOptions contents as cell array
%        contents{get(hObject,'Value')} returns selected item from PlotOptions
return

% --- Executes during object creation, after setting all properties.
function PlotOptions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PlotOptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

% --- Executes on button press in UpdatePlot.
function UpdatePlot_Callback(hObject, eventdata, handles)
% hObject    handle to UpdatePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value'))
    plotindex = get(handles.PlotOptions,'Value');
    waveform = handles.waveform;
    switch plotindex
        case 1, plot(abs(waveform.data));grid on;
        case 2, plot(real(waveform.data));grid on;
        case 3, plot(imag(waveform.data));grid on;
    end
end
return

% --- Executes on button press in Generate.
function Generate_Callback(hObject, eventdata, handles)
% hObject    handle to Generate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value'))
    clc;
    axes(handles.Waveform);cla;
    message = get(handles.Message,'String');
    if(~strcmp(message,''))        
        m1 = 'Clear messages..';
        if(strcmp(m1,message(1:length(m1))));
            set(handles.Message,'String',message);
        else
            set(handles.Message,'String',['Clear messages..' message]);
        end
    else
        %include sub-directory path
        startup;
        
        % Verify Edit Text 
        verifyIdleTime(handles);
        verifyLastRSSI(handles);
        verifyMCS(handles);
        verifyNumberofPackets(handles);
        verifyPayloadLength(handles);
        verifyPayloadSeed(handles);
        verifyPayloadState(handles);
        verifyScramblerSeed(handles);
        verifyTrainingLength(handles);
        
        [Txparams] = configTx(handles);
        if(strcmp(get(handles.Message,'String'),''))
            if(Txparams.File.wfile)
                dname = get(handles.FileDirectoryPath,'String');
            end
            if(Txparams.File.wfile) [Txparams] = genFileParams(Txparams,dname); end
            % Derive generation parameters
            [gParams] = genParams(Txparams);
            % Packet generation
            wfm = gParams.waveform;
            for numpkt = 1:Txparams.Misc.numpkts
                [gParams waveform] = genPacket(gParams);
                wfm.data = [wfm.data waveform.data];
            end
            handles.waveform = wfm;
            guidata(hObject,handles);
            
            %Title Packet Configuration
            dmg = 0*get(handles.CPHY,'Value') + 1*get(handles.SCPHY,'Value') + 2*get(handles.OFDMPHY,'Value');
            switch dmg
                case 0,T = 'C PHY';
                case 1,T = 'SC PHY';   T = [T ' MCS:' num2str(get(handles.MCS,'String'))];
                case 2,T = 'OFDM PHY'; T = [T ' MCS:' num2str(get(handles.MCS,'String'))];
            end
            plotindex = get(handles.PlotOptions,'Value');
            switch plotindex
                case 1, plot(abs(wfm.data));grid on;legend(T);
                case 2, plot(real(wfm.data));grid on;legend(T);
                case 3, plot(imag(wfm.data));grid on;legend(T);
            end            
        else
            message = get(handles.Message,'String');
            set(handles.Message,'String',['Generation not initiated..' message]);
        end
    end
end
return

% --- Executes on button press in Writetofile.
function Writetofile_Callback(hObject, eventdata, handles)
% hObject    handle to Writetofile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Writetofile
if(get(hObject,'Value') == 1)
    if(strcmp(get(handles.FileDirectoryPath,'String'),''))
        %FileDirectoryParth
        P = pwd;
        [SUCCESS,MESSAGE,MESSAGEID] = MKDIR(P,'DataFiles');
        if(SUCCESS)
            set(handles.FileDirectoryPath,'String',[P '\DataFiles']);
            set(handles.Message,'String',['Created "DataFiles" directory at location "' P '" for File store operations']);
        else
            set(handles.Message,'String',['Attempt to create "DataFiles" Directory at location "' P '"failed' MESSAGE]);
        end
    end
end
return

function FileDirectoryPath_Callback(hObject, eventdata, handles)
% hObject    handle to FileDirectoryPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of FileDirectoryPath as text
%        str2double(get(hObject,'String')) returns contents of FileDirectoryPath as a double
if(~strcmp(get(hObject,'String'),''))
    message = get(handles.Message,'String');
    set(handles.Message,'String',[message '.' 'Enter Valid Directory Path']);
end
return

% --- Executes during object creation, after setting all properties.
function FileDirectoryPath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to FileDirectoryPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function Message_Callback(hObject, eventdata, handles)
% hObject    handle to Message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Message as text
%        str2double(get(hObject,'String')) returns contents of Message as a double
return

% --- Executes during object creation, after setting all properties.
function Message_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Message (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

%-------------------------------------------------------------------
% --- Executes during object creation, after setting all properties.
function DMG_SelectionChangeFcn(hObject,eventdata,handles)
% hObject    handle to DMG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%PHY selection button group programming
dmgbuttongroupFcn(hObject,handles)
return

% --- Executes on button press in clearmessage.
function clearmessage_Callback(hObject, eventdata, handles)
% hObject    handle to clearmessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value'))
    set(handles.Message,'String','');
end
return

function NumberofPackets_Callback(hObject, eventdata, handles)
% hObject    handle to NumberofPackets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NumberofPackets as text
%        str2double(get(hObject,'String')) returns contents of NumberofPackets as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
verifyEditTextforinteger_CallbackFcn(hObject,handles);
verifyEditTextforrange_CallbackFcn(hObject,handles,1,inf);
return

% --- Executes during object creation, after setting all properties.
function NumberofPackets_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NumberofPackets (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return

function IdleTime_Callback(hObject, eventdata, handles)
% hObject    handle to IdleTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of IdleTime as text
%        str2double(get(hObject,'String')) returns contents of IdleTime as a double
verifyEditTextfornumber_CallbackFcn(hObject,handles);
%verifyEditTextforinteger_CallbackFcn(hObject,handles);
verifyEditTextforrange_CallbackFcn(hObject,handles,0,inf);
return

% --- Executes during object creation, after setting all properties.
function IdleTime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to IdleTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end
return


% --- Executes on button press in Preset.
function Preset_Callback(hObject, eventdata, handles)
% hObject    handle to Preset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value'))
    openingFcn(handles);
end
return

