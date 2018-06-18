function verifyEditTextfornumber(handles,Tag)

user_entry = str2double(get(eval(['handles.' Tag]),'string'));
if isnan(user_entry)
    set(handles.Message,'String',['You must enter a numeric value for "' Tag '"']);
end

return
