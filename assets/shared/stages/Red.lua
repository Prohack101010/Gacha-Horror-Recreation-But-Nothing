function onCreate()
	makeLuaSprite('GF but with big boobas', 'stages/red/GF but with big boobas', -200, -90)
	setScrollFactor('GF but with big boobas', 0.9, 0.9)
	scaleObject('GF but with big boobas', 1.4, 1.4)
	
	makeLuaSprite('black', 'black', -200, 50)
	setScrollFactor('black', 0.9, 0.9)
	scaleObject('black', 0.7, 0.7)
	
	makeLuaSprite('dablack', 'dablack', -500, -200)
	setScrollFactor('dablack', 0.9, 0.9)
	scaleObject('dablack', 3, 3)
	
	makeLuaSprite('GF but with bigger boobas', 'stages/red/GF but with bigger boobas', -285, -90)
	setScrollFactor('GF but with bigger boobas', 0.9, 0.9)
	scaleObject('GF but with bigger boobas', 1.3, 1.3)
	
	makeLuaSprite('GF but with small boobas', 'stages/red/GF but with small boobas', -700, -2000)
	setScrollFactor('GF but with small boobas', 0.9, 0.9)
	scaleObject('GF but with small boobas', 4.6, 4.6)

	addLuaSprite('GF but with small boobas', false)
	addLuaSprite('GF but with big boobas', false)
	addLuaSprite('black', false)
	addLuaSprite('GF but with bigger boobas', true)
	addLuaSprite('dablack', true)
	
	close(true)
end
