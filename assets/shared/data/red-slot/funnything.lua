-- Author: Lily(mcagabe19)

local singleBf = false
local singleDad = false

function onStepHit()
if curStep == 512 then
singleDad = true
elseif curStep == 1024 then
singleDad = false
elseif curStep == 1536 then
singleDad = true
end
end

function onUpdatePost()
if singleDad then
setProperty('iconP1.x', -200)
setProperty('iconP2.x', 555)
elseif singleBf then
setProperty('iconP1.x', 555)
setProperty('iconP2.x', -200)
else
setProperty('iconP2.x', 15)
setProperty('iconP1.x', 1100)
end
end