-- Author: Lily(mcagabe19)

local width = getPropertyFromClass('openfl.Lib', 'application.window.width')
local height = getPropertyFromClass('openfl.Lib', 'application.window.height')

function onEvent(name, value1, value2)
    if name == "WindowMove" then
        setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
        if buildTarget == 'android' or buildTarget == 'ios' then --nerd
        setPropertyFromClass('openfl.Lib', 'application.window.width', width/getRandomFloat(0.001,2.999)) 
	    setPropertyFromClass('openfl.Lib', 'application.window.height', height/getRandomFloat(0.001,2.999)) 
	    else
	    setPropertyFromClass('openfl.Lib', 'application.window.x', getRandomInt(0,700)) 
        setPropertyFromClass('openfl.Lib', 'application.window.y', getRandomInt(0,350)) 
	    setPropertyFromClass('openfl.Lib', 'application.window.width', width/2.25) 
	    setPropertyFromClass('openfl.Lib', 'application.window.height', height/2.25)
        end 
    end
end
