funny = -135
angle = 360

function onSongStart()
runHaxeCode([[var backup=game.playerStrums;game.playerStrums=game.opponentStrums;game.opponentStrums = backup;game.playerStrums.reloadNotes();game.opponentStrums.reloadNotes();]])
for i = 0,7 do
noteTweenAlpha("Alpha"..i, i, 1, 1, 'cubeOut')
end
end
function onTweenCompleted(tag)
if middlescroll then
if tag == "Alpha0" then
noteTweenX("Move0", 0, 413, 1, 'cubeOut')
noteTweenAngle("Angle0", 0, angle, 1, 'cubeOut')
elseif tag == "Alpha1" then
noteTweenAngle("Angle1", 1, angle, 1, 'cubeOut')
noteTweenX("Move1", 1, 525, 1, 'cubeOut')
elseif tag == "Alpha2" then
noteTweenAngle("Angle2", 2, angle, 1, 'cubeOut')
noteTweenX("Move2", 2, 636, 1, 'cubeOut')
elseif tag == "Alpha3" then
noteTweenAngle("Angle3", 3, angle, 1, 'cubeOut')
noteTweenX("Move3", 3, 748, 1, 'cubeOut')
end
end
for i = 4,7 do
if tag == "Alpha"..i and middlescroll or not opponentStrums then
noteTweenX("FunnyMove"..i, i, funny, 1, 'cubeOut')
noteTweenAngle("FunnyAngle"..i, i, angle, 1, 'cubeOut')
end
end
end