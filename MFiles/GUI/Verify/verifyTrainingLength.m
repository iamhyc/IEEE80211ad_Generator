function verifyTrainingLength(handles)

Tag = 'TrainingLength';
verifyEditTextfornumber(handles,Tag);
verifyEditTextforinteger(handles,Tag);
verifyEditTextforrange(handles,Tag,0,31);

return

