function verifyPayloadLength(handles)

Tag = 'PayloadLength';
verifyEditTextfornumber(handles,Tag);
verifyEditTextforinteger(handles,Tag);

dmg = 0*get(handles.CPHY,'Value') + 1*get(handles.SCPHY,'Value') + 2*get(handles.OFDMPHY,'Value');
switch dmg
    case 0,verifyEditTextforrange(handles,Tag,14,1023.);
    case 1,verifyEditTextforrange(handles,Tag,0,262143);
    case 2,verifyEditTextforrange(handles,Tag,0,262143);
end

return

