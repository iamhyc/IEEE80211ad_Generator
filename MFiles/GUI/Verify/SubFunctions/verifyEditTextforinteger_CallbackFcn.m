function verifyEditTextforinteger_CallbackFcn(hObject,handles)

user_entry = str2double(get(hObject,'string'));
if(mod(user_entry,1) ~=0 )
    set(handles.Message,'String',['You must enter a Integer value for "' get(hObject,'Tag') '"']);
end

return
