function onEvent(name, value1, value2)

	Time = tonumber(value1)
	Alpha = tonumber(value2)
	
    if name == 'OpponentNotesFade' then
	
	if not middlescroll then 
for i=0,3 do
    noteTweenAlpha(i+16, i, Alpha, Time, 'QuadOut')

    end
    end
end
end