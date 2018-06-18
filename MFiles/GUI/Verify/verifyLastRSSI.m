function verifyLastRSSI(handles)

Tag = 'LastRSSI';
verifyEditTextfornumber(handles,Tag);
verifyEditTextforinteger(handles,Tag);
verifyEditTextforrange(handles,Tag,0,15);

return

