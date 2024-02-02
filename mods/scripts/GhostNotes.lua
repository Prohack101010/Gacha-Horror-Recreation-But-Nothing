local silhouetteShit = require('mods/custom_events/Silhouette')

function goodNoteHit(i,d,t,s)
  if _G['boyfriendGhostData.strumTime'] == getPropertyFromGroup('notes',i,'strumTime') and not s and not getPropertyFromGroup('notes',i,'gfNote') then
    createGhost('boyfriend')
  elseif not s and not getPropertyFromGroup('notes',i,'gfNote') then
    _G['boyfriendGhostData.strumTime'] = getPropertyFromGroup('notes',i,'strumTime')
    updateGData('boyfriend')
  elseif _G['gfGhostData.strumTime'] == getPropertyFromGroup('notes',i,'strumTime') and not s and getPropertyFromGroup('notes',i,'gfNote') then
    createGhost('gf')
  elseif not s and getPropertyFromGroup('notes',i,'gfNote') then
    _G['gfGhostData.strumTime'] = getPropertyFromGroup('notes',i,'strumTime')
    updateGData('gf')
  end
end

function opponentNoteHit(i,d,t,s)
  if _G['dadGhostData.strumTime'] == getPropertyFromGroup('notes',i,'strumTime') and not s and not getPropertyFromGroup('notes',i,'gfNote') then
    createGhost('dad')
  elseif not s and not getPropertyFromGroup('notes',i,'gfNote') then
    _G['dadGhostData.strumTime'] = getPropertyFromGroup('notes',i,'strumTime')
    updateGData('dad')
  elseif _G['gfGhostData.strumTime'] == getPropertyFromGroup('notes',i,'strumTime') and not s and getPropertyFromGroup('notes',i,'gfNote') then
    createGhost('gf')
  elseif not s and getPropertyFromGroup('notes',i,'gfNote')then
    _G['gfGhostData.strumTime'] = getPropertyFromGroup('notes',i,'strumTime')
    updateGData('gf')    
  end
end

function createGhost(char)
  songPos = getSongPosition()
  makeAnimatedLuaSprite(char..'Ghost'..songPos,getProperty(char..'.imageFile'),getProperty(char..'.x'),getProperty(char..'.y'))
  addLuaSprite(char..'Ghost'..songPos,false)
  setProperty(char..'Ghost'..songPos..'.scale.x',getProperty(char..'.scale.x'))
  setProperty(char..'Ghost'..songPos..'.scale.y',getProperty(char..'.scale.y'))
  setProperty(char..'Ghost'..songPos..'.flipX',getProperty(char..'.flipX'))
  if inSilhouette then
  setProperty(char..'Ghost'..songPos..'.color',000000)
  else
  end
  setProperty(char..'Ghost'..songPos..'.alpha',1)
  doTweenAlpha(char..'Ghost'..songPos..'delete',char..'Ghost'..songPos,0,0.4)
  setProperty(char..'Ghost'..songPos..'.animation.frameName',_G[char..'GhostData.frameName'])
  setProperty(char..'Ghost'..songPos..'.offset.x',_G[char..'GhostData.offsetX'])
  setProperty(char..'Ghost'..songPos..'.offset.y',_G[char..'GhostData.offsetY'])
  setObjectOrder(char..'Ghost'..songPos,getObjectOrder(char..'Group')-1)
end

function onTweenCompleted(tag)
  if (tag:sub(#tag- 5,#tag)) == 'delete' then
    removeLuaSprite(tag:sub(1,#tag - 6),true)
  end 
end

function updateGData(char)
  _G[char..'GhostData.frameName'] = getProperty(char..'.animation.frameName')
  _G[char..'GhostData.offsetX'] = getProperty(char..'.offset.x')
  _G[char..'GhostData.offsetY'] = getProperty(char..'.offset.y')
end
