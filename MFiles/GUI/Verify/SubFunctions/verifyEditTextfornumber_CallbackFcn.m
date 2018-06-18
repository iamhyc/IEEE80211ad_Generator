function verifyEditTextfornumber_CallbackFcn(hObject,handles)

user_entry = str2double(get(hObject,'string'));
if isnan(user_entry)
    set(handles.Message,'String',['You must enter a numeric value for "' get(hObject,'Tag') '"']);
end

return
