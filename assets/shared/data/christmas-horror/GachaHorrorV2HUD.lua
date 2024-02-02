-- MODIFICATION FOR KRIMA

local mopart = false

function onBeatHit()
        if (curBeat % 2 == 0) then
        if getProperty('health') <= 1.625 then
        if mopart then
        setProperty('iconP2.angle', -20)
        else
        setProperty('iconP2.angle', 20)
        end
        doTweenAngle('bip', 'iconP2', 0,0.2,'cubicOut')
        end
        end
        if getProperty('health') <= 1.625 then
        if (curBeat % 2 == 1) and mopart then
        setProperty('iconP2.angle', 20)
        doTweenAngle('bip', 'iconP2', 0,0.2,'cubicIn')
        end
        end
end
function onStepHit()
    if curStep == 896 then
        runHaxeCode([[PlayState.instance.changeNoteSkin(false, "noteSkins/NurseArrows");]])
    end
    if curStep == 1680 then
        runHaxeCode([[PlayState.instance.changeNoteSkin(false, "noteSkins/RedSlotArrows");]])
    end
    if curStep == 2448 then
        runHaxeCode([[PlayState.instance.changeNoteSkin(false, "noteSkins/CCArrows");]])
    end
    if curStep == 3216 then
        runHaxeCode([[PlayState.instance.changeNoteSkin(false, "noteSkins/M-O-Arrows");]])
        mopart = true
    end
    if curStep == 3728 then
        runHaxeCode([[PlayState.instance.changeNoteSkin(false, "noteSkins/NOTE_assets");]])
        mopart = false
     end
end
