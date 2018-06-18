function verifyEditTextforrange_CallbackFcn(handles,Tag,min,max)

user_entry = str2double(get(eval(['handles.' Tag]),'string'));
if(~((user_entry >= min) && (user_entry <= max)))
    set(handles.Message,'String',['"' Tag '" ' 'entry is out of valid range [' num2str(min) ' ' num2str(max) ']']);
end

return
