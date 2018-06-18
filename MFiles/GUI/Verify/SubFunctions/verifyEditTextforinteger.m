function verifyEditTextforinteger_CallbackFcn(handles,Tag)

user_entry = str2double(get(eval(['handles.' Tag]),'string'));
if(mod(user_entry,1) ~=0 )
    set(handles.Message,'String',['You must enter a Integer value for "' Tag '"']);
end

return
