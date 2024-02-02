function onCreate()
	
	makeLuaSprite('Ginabg/bottom', 'stages/krima/Ginabg/bottom', -340, 50)
	setScrollFactor('Ginabg/bottom', 0.9, 0.9)
	scaleObject('Ginabg/bottom', 0.7, 0.7)
	
	makeLuaSprite('Ginabg/top', 'stages/krima/Ginabg/top', -340, 50)
	setScrollFactor('Ginabg/top', 0.9, 0.9)
	scaleObject('Ginabg/top', 0.7, 0.7)

	addLuaSprite('Ginabg/bottom', false)
	addLuaSprite('Ginabg/top', true)
	
	close(true)
end

function onStepHit()
	if curStep == 896 then
		setProperty('Ginabg/top.visible', false)
	end
end