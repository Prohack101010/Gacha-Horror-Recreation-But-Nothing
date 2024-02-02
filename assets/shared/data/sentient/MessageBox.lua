-- author: Lily(mcagabe19)
-- SUPPORTS EVERY PLATFROM

function onEndSong()
    runHaxeCode([[SUtil.showPopUp('See you soon...', 'SECURITY ERROR: GINA');]])
end

function onGameOverStart()
    runHaxeCode([[SUtil.showPopUp('Come back. I\'m not done playing yet.', 'GINA');]])
end

function onUpdate()
    if botPlay or cpuControlled then
	    runHaxeCode([[SUtil.showPopUp('NO CHEATING\nNO CHEATING\nNO CHEATING\nNO CHEATING', 'GINA');Sys.exit(1);]])
	end
end
