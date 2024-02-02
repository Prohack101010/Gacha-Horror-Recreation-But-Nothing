function onCreate()
	
	makeLuaSprite('krima_spooky', 'stages/krima/krima_spooky', -680, -280)
	setScrollFactor('krima_spooky', 0.9, 0.9)
	scaleObject('krima_spooky', 0.8, 0.8)

	makeAnimatedLuaSprite('vitamin', 'stages/krima/people/horlex', -320, -40) 
    addAnimationByPrefix('vitamin', 'dance', 'horlex idle', 24, true)
    setScrollFactor('vitamin', 0.9, 0.9)
	scaleObject('vitamin', 0.6, 0.6)

	makeAnimatedLuaSprite('shit', 'stages/krima/people/justdude', 0, -170) 
    addAnimationByPrefix('shit', 'dance', 'justdude idle', 24, true)
    setScrollFactor('shit', 0.9, 0.9)
	scaleObject('shit', 0.7, 0.7)

	makeAnimatedLuaSprite('waman', 'stages/krima/people/ishitbell', -870, -60) 
    addAnimationByPrefix('waman', 'dance', 'ishitbell Idle', 24, true)
    setScrollFactor('waman', 0.9, 0.9)
	scaleObject('waman', 0.7, 0.7)

	makeAnimatedLuaSprite('waman2', 'stages/krima/people/pix', 70, -40) 
    addAnimationByPrefix('waman2', 'dance', 'pix idle', 24, true)
    setScrollFactor('waman2', 0.9, 0.9)
	scaleObject('waman2', 0.6, 0.6)

	makeAnimatedLuaSprite('blec', 'stages/krima/people/darkbro', 870, -20) 
    addAnimationByPrefix('blec', 'dance', 'darkbro idle', 24, true)
    setScrollFactor('blec', 0.9, 0.9)
	scaleObject('blec', 0.6, 0.6)

	addLuaSprite('krima_spooky', false)
	addLuaSprite('vitamin', false)
	addLuaSprite('shit', false)
	addLuaSprite('waman', false)
	addLuaSprite('waman2', false)
	addLuaSprite('blec', false)
	
	close(true)
end