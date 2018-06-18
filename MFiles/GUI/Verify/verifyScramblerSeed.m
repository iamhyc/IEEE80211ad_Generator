function verifyScramblerSeed(handles)

Tag = 'ScramblerSeed';
verifyEditTextfornumber(handles,Tag);
verifyEditTextforinteger(handles,Tag);
verifyEditTextforrange(handles,Tag,0,127);

return

