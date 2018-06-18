function verifyNumberofPackets(handles)

Tag = 'NumberofPackets';
verifyEditTextfornumber(handles,Tag);
verifyEditTextforinteger(handles,Tag);
verifyEditTextforrange(handles,Tag,1,inf);

return
