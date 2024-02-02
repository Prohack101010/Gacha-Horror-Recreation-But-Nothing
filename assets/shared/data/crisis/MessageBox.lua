-- author: Lily(mcagabe19)
-- SUPPORTS EVERY PLATFROM

function onUpdate()
    if botPlay or cpuControlled then
	    runHaxeCode([[SUtil.showPopUp('NO CHEATING\nNO CHEATING\nNO CHEATING\nNO CHEATING', 'GINA');Sys.exit(1);]])
	end
end
