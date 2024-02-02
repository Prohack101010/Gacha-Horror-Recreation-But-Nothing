function onCreate()
	
	makeLuaSprite('mo', 'stages/krima/mobg', -160, -70)
	setScrollFactor('mo', 1, 1)
	scaleObject('mo', 1.6, 1.4)

	addLuaSprite('mo', false)
	
	close(true)
end