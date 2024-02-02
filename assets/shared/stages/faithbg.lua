function onCreate()
	
	makeLuaSprite('lights', 'stages/krima/faith/lights', -250, -670)
	setScrollFactor('lights', 0.9, 0.9)
	scaleObject('lights', 1.1, 1.1)
	
	makeLuaSprite('room', 'stages/krima/faith/room', -1056, -850)
	setScrollFactor('room', 0.9, 0.9)
	scaleObject('room', 1, 1)

	makeLuaSprite('L', 'stages/krima/people/deadmf', 180, 450)
	setScrollFactor('L', 0.9, 0.9)
	scaleObject('L', 0.4, 0.4)

	addLuaSprite('lights', true)
	addLuaSprite('room', false)
	addLuaSprite('L', false)
	
	close(true)
end