function verifyIdleTime(handles)

Tag = 'IdleTime';
verifyEditTextfornumber(handles,Tag);
%verifyEditTextforinteger(handles,Tag);
verifyEditTextforrange(handles,Tag,0,inf);

return

