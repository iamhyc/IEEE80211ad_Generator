function verifyEditTextforrange_CallbackFcn(hObject,handles,min,max)

user_entry = str2double(get(hObject,'string'));
if(~((user_entry >= min) && (user_entry <= max)))
    set(handles.Message,'String',['"' get(hObject,'Tag') '" ' 'entry is out of valid range [' num2str(min) ' ' num2str(max) ']']);
end

return
