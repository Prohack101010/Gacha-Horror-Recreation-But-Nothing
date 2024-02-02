function onCreate()
makeLuaSprite('black2', '', 0, 0)
makeGraphic('black2', 4000, 4000, '000000')
scaleObject('black2', 1.5, 1.5)
setObjectCamera('black2', 'hud')
addLuaSprite('black2', true)
setProperty('black2.visible', false)
end

function onBeatHit()
if curBeat == 448 then
setTextString("Captions", "You")
end
if curBeat == 449 then
setTextString("Captions", "You Are")
end
if curBeat == 450 then
setTextString("Captions", "You Are Dead")
end
if curBeat == 452 then
setTextString("Captions", " ")
end
if curBeat == 580 then
setTextString("Captions", "In this jolly")
end
if curBeat == 582 then
setTextString("Captions", "Christ-")
end
if curBeat == 583 then
setTextString("Captions", "Christmas")
end
if curBeat == 585 then
setTextString("Captions", "you will fall")
end
if curBeat == 588 then
setTextString("Captions", "Cause tonight")
end
if curBeat == 589 then
setTextString("Captions", "Cause tonight will be")
end
if curBeat == 590 then
setTextString("Captions", "the fi-")
end
if curBeat == 592 then
setTextString("Captions", "the final")
end
if curBeat == 593 then
setTextString("Captions", "the final song")
end
if curBeat == 595 then
setTextString("Captions", "There's nothing you can do")
end
if curBeat == 599 then
setTextString("Captions", "There's nowhere else to go")
end
if curBeat == 603 then
setTextString("Captions", "Say goodbye to this world")
end
if curBeat == 607 then
setTextString("Captions", "cause")
end
if curBeat == 608 then
setTextString("Captions", "You")
end
if curBeat == 609 then
setTextString("Captions", "You Are")
end
if curBeat == 610 then
setTextString("Captions", "You Are DEAD")
end
if curBeat == 612 then
setTextString("Captions", " ")
end
end

function onStepHit()
if curStep == 2675 then
setTextColor("Captions", "8A6751")
setTextFont("Captions", "Comfortaa-Bold.ttf")
end
if curStep == 2675 then
setTextString("Captions", "Please...")
end
if curStep == 2688 then
setTextString("Captions", "Don't hurt me...")
end
if curStep == 2702 then
setTextString("Captions", " ")
end
if curStep == 3471 then
setTextBorder("Captions", 2, "ab0303")
setTextColor("Captions", "fc0505")
setTextFont("Captions", "Pigmo 05 Clr Normal.otf")
end
if curStep == 3472 then
setTextString("Captions", "San")
end
if curStep == 3476 then
setTextString("Captions", "Santa's")
end
if curStep == 3480 then
setTextString("Captions", "Santa's Sleigh")
end
if curStep == 3484 then
setTextString("Captions", "Santa's Sleigh In")
end
if curStep == 3488 then
setTextString("Captions", "Win...")
end
if curStep == 3494 then
setTextString("Captions", "Winter")
end
if curStep == 3496 then
setTextString("Captions", "Winter Night!")
end
if curStep == 3504 then
setTextString("Captions", "I..")
end
if curStep == 3508 then
setTextString("Captions", "I am")
end
if curStep == 3512 then
setTextString("Captions", "I am yet")
end
if curStep == 3516 then
setTextString("Captions", "I am yet to")
end
if curStep == 3520 then
setTextString("Captions", "See...")
end
if curStep == 3526 then
setTextString("Captions", "See The")
end
if curStep == 3528 then
setTextString("Captions", "See The Light!")
end

if curStep == 3535 then
setTextBorder("Captions", 2, "ffffff")
setTextColor("Captions", "fc0505")
end
if curStep == 3536 then
setTextString("Captions", "Blood")
end
if curStep == 3540 then
setTextString("Captions", "Blood Flows.")
end
if curStep == 3544 then
setTextString("Captions", "In")
end
if curStep == 3546 then
setTextString("Captions", "In The")
end
if curStep == 3548 then
setTextString("Captions", "In The Snow.")
end
if curStep == 3552 then
setTextString("Captions", "Mur-")
end
if curStep == 3554 then
setTextString("Captions", "Murder")
end
if curStep == 3556 then
setTextString("Caption", "Murder Sight-")
end
if curStep == 3558 then
setTextString("Captions", "Murder Sightings.")
end
if curStep == 3560 then
setTextString("Captions", "In")
end
if curStep == 3562 then
setTextString("Captions", "In The")
end
if curStep == 3564 then
setTextString("Captions", "In The Glob")
end
if curStep == 3568 then
setTextString("Captions", "Crim-")
end
if curStep == 3570 then
setTextString("Captions", "Crimson")
end
if curStep == 3572 then
setTextString("Captions", "Crimson Snow.")
end
if curStep == 3576 then
setTextString("Captions", "Chris-")
end
if curStep == 3578 then
setTextString("Captions", "Christmas")
end
if curStep == 3580 then
setTextString("Captions", "Christmas Fear.")
end
if curStep == 3584 then
setTextString("Captions", "Dark")
end
if curStep == 3588 then
setTextString("Captions", "Dark Haunt-")
end
if curStep == 3590 then
setTextString("Captions", "Dark Hauntings")
end
if curStep == 3592 then
setProperty('black2.visible', true)
setTextSize("Captions", 50)
setTextAlignment("Captions", "center")
setTextString("Captions", "ATMOSPHERE.")
end
if curStep == 3600 then
cameraFlash('hud', 'FFFFFF', 0.75, true)
setProperty('black2.visible', false)
setTextString("Captions", " ")
end
if curStep == 4240 then
setProperty('black2.visible', true)
end
end