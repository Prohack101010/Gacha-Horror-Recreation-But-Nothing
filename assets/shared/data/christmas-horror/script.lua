function onCreate()
--augh
precacheImage('stages/krima/krima_spooky')
precacheImage('stages/krima/mobg')
precacheImage('stages/krima/cc/house')
precacheImage('stages/krima/cc/trees')
precacheImage('stages/krima/faith/lights')
precacheImage('stages/krima/faith/room')
precacheImage('stages/krima/Redslot/Treesback')
precacheImage('stages/krima/Redslot/Treesfront')
precacheImage('stages/krima/people/Candice')
precacheImage('stages/krima/people/darkbro')
precacheImage('stages/krima/people/deadmf')
precacheImage('stages/krima/people/gameguy')
precacheImage('stages/krima/people/horlex')
precacheImage('stages/krima/people/ishitbell')
precacheImage('stages/krima/people/justdude')
precacheImage('stages/krima/people/pix')
precacheImage('noteSkins/NurseArrows')
precacheImage('noteSkins/RedSlotArrows')
precacheImage('noteSkins/CCArrows')
precacheImage('noteSkins/M-O-Arrows')
precacheImage('noteSkins/NOTE_assets')
end

function onCreatePost()

makeLuaSprite('O_BlackScreen', 'empty', -250,-50)
makeGraphic('O_BlackScreen', 6920, 1920, '000000')
setObjectCamera('O_BlackScreen', 'screen')
addLuaSprite('O_BlackScreen', true)

makeLuaSprite('BlackScreen', 'empty', -50,-170)
makeGraphic('BlackScreen', 1920, 1920, '000000')
setObjectCamera('BlackScreen', 'screen')
addLuaSprite('BlackScreen', false)
setProperty("BlackScreen.visible", false)

makeLuaSprite('Blackbar', 'hud/Blackbars', 0, -20)
scaleObject('Blackbar', 0.7, 0.7)
setObjectCamera('Blackbar', 'hud')
addLuaSprite('Blackbar', false)
setProperty("Blackbar.visible", true)

triggerEvent('Camera Follow Pos',340,430)

makeLuaText("Captions", " ", 1200, 55, 515)
addLuaText("Captions", true)
setTextSize("Captions", 30)
setTextBorder("Captions", 2, "ab0303")
setTextColor("Captions", "fc0505")
setTextFont("Captions", "Pigmo 05 Clr Normal.otf")
setTextAlignment("Captions", "center")
end

function onSongStart()
cameraFlash('hud', 'FFFFFF', 1, true)
setProperty("O_BlackScreen.visible", false)
end