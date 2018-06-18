function verifyMCS(handles)

Tag = 'MCS';
verifyEditTextfornumber(handles,Tag);
verifyEditTextforinteger(handles,Tag);

dmg = 0*get(handles.CPHY,'Value') + 1*get(handles.SCPHY,'Value') + 2*get(handles.OFDMPHY,'Value');
switch dmg
    case 0,verifyEditTextforrange(handles,Tag,0,0);
    case 1,verifyEditTextforrange(handles,Tag,1,12);
    case 2,verifyEditTextforrange(handles,Tag,13,24);
end
return

