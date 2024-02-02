function onCreate()
	
	makeLuaSprite('house', 'stages/krima/cc/house', -950, -250)
	setScrollFactor('house', 0.9, 0.9)
	scaleObject('house', 1.3, 1)

	makeLuaSprite('tree', 'stages/krima/cc/trees', -350, -170)
	setScrollFactor('tree', 0.9, 1)
	scaleObject('tree', 1.7, 1.9)

	makeLuaSprite('dablack', 'black')
	setScrollFactor('dablack', 0.9, 1)
	scaleObject('dablack', 0.9, 0.9)

    addLuaScript('dablack', false)
	addLuaSprite('house', false)
	addLuaSprite('tree', true)

	close(true) 
end