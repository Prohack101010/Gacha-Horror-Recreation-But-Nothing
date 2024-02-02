function onCreate()

	makeLuaSprite('Red', 'stages/red/GF but with big boobas', -600, -200)
	setScrollFactor('Red', 0.9, 0.9)
	scaleObject('Red', 6, 6)

	makeLuaSprite('big', 'stages/krima/Redslot/Treesback', -600, -250)
	setScrollFactor('big', 0.9, 0.9)
	scaleObject('big', 1.0, 1.0)
	
	makeLuaSprite('front', 'stages/krima/Redslot/Treesfront', -600, -250)
	setScrollFactor('front', 0.9, 0.9)
	scaleObject('front', 1.2, 1.0)

	makeLuaSprite('black', 'black', -600, -200)
    setScrollFactor('black', 0.6, 0.6)
	scaleObject('black', 1.0, 1.0)

	addLuaScript('black', false)
	addLuaSprite('big', false)
	addLuaSprite('front', true)
    addLuaSprite('Red', false)

	close(true)
end