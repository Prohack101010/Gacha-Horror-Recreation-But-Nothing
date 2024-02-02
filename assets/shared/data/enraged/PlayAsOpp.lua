check = true
move = true
invis = false

function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length')-1 do
        if getPropertyFromGroup('unspawnNotes', i, 'noAnimation') == true then
            setPropertyFromGroup('unspawnNotes', i, 'animSuffix', 'therenoanimation')
        end
    end
    -- Healthbar stuff
    setProperty('healthBar.flipX', true)
end

shouldAnimation = false

function onSpawnNote(id, d, noteType)
    noteType = getPropertyFromGroup('notes', id, 'noteType')
    check = true -- To make sure player notes don't go on your side

    setPropertyFromGroup('unspawnNotes', id, 'noMissAnimation', true)
    setPropertyFromGroup('unspawnNotes', id, 'noAnimation', true)
    if getPropertyFromGroup('notes', id,'mustPress') == true then
        setPropertyFromGroup('notes', id,'mustPress', false)
        check = false
    elseif getPropertyFromGroup('notes', id,'mustPress') == false and check then
        setPropertyFromGroup('notes', id,'mustPress', true)
    end
end

-- Animations

function goodNoteHit(id, noteData, noteType)
    local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
    local Player = 'dad'
    local PlayThis = getProperty('singAnimations')[noteData + 1]
    if getPropertyFromGroup('notes', id, 'gfNote') then
        Player = 'gf'
        setProperty('gf.holdTimer', 0)
    else
        setProperty('dad.holdTimer', 0)
    end
    if altAnim then
        animSuffix = '-alt'
    end

    if noteType == 'Hey!' then
        PlayThis = 'hey'
    end

    playAnim(Player, PlayThis..animSuffix, true)
end

function noteMiss(id, noteData, noteType)
    local animSuffix = 'miss'
    local Player = 'dad'
    local PlayThis = getProperty('singAnimations')[noteData + 1]
    if getPropertyFromGroup('notes', id, 'gfNote') then
        Player = 'gf'
    end

    if noteType == 'Hurt Note' then
        PlayThis = 'hurt'
    end

    setProperty(Player..'holdTimer', 0)

    playAnim(Player, PlayThis..animSuffix, true)
end

function opponentNoteHit(id, noteData, noteType)
    local animSuffix = getPropertyFromGroup('notes', id, 'animSuffix')
    local Player = 'boyfriend'
    local PlayThis = getProperty('singAnimations')[noteData + 1]
    if getPropertyFromGroup('notes', id, 'gfNote') then
        Player = 'gf'
        setProperty('gf.holdTimer', 0)
    else
        setProperty('boyfriend.holdTimer', 0)
    end
    if altAnim then
        animSuffix = '-alt'
    end

    if noteType == 'Hey!' then
        PlayThis = 'hey'
    end

    playAnim(Player, PlayThis..animSuffix, true)
end

function onUpdate()
    if invis then
        setProperty('boyfriend.visible', false)
    end
    health = getProperty('health')
end

-- for moe part and didn't work
--[[function onBeatHit()
    if curBeat == 272 then
        setProperty('iconP1.flipX', false)
    end
    if curBeat == 336 then
        setProperty('iconP1.flipX', true)
    end
end--]]

-- game over stuff
function onGameOver()
    invis = true
end