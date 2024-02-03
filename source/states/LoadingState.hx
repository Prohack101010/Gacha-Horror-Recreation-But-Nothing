package states;

import haxe.Json;
import sys.thread.Thread;
import sys.thread.Mutex;
import lime.utils.Assets;
import openfl.utils.AssetType;
import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxState;

import backend.StageData;
import objects.Character;

class LoadingState extends MusicBeatState
{
	var target:FlxState = null;
	var stopMusic = false;
	var directory:String = null;

	public static var loaded:Int = 0;
	public static var loadMax:Int = 0;
	function new(target:FlxState, stopMusic:Bool, directory:String)
	{
		super();
		this.target = target;
		this.stopMusic = stopMusic;
		this.directory = directory;
	}
	
	var bar:FlxSprite;
	var barWidth:Int = 0;
	var intendedPercent:Float = 0;
	var curPercent:Float = 0;
	var canChangeState:Bool = true;

	var loadingText:FlxText;

	var timePassed:Float;
	var shakeFl:Float;
	var shakeMult:Float = 0;
	
	var isSpinning:Bool = false;
	var pressedTimes:Int = 0;

	static var mutex:Mutex = new Mutex();

	override function create()
	{
		if(checkLoaded())
		{
			skipUpdate = true;
			super.create();
			return;
		}

		// GACHA HORROR LOADING SCREEN
		var bg = new FlxSprite().loadGraphic(Paths.image('funkay'));
		bg.setGraphicSize(0, FlxG.height);
		bg.updateHitbox();
                bg.screenCenter();
		add(bg);

                var bottomBG = new FlxSprite(0, FlxG.height - 26).makeGraphic(FlxG.width, 26, 0xFF000000);
                bottomBG.alpha = 0.6;
                add(bottomBG);
	
		loadingText = new FlxText(520, 600, 400, 'Now Loading...', 32);
		loadingText.setFormat(Paths.font("Comfortaa-Bold.ttf"), 32, FlxColor.WHITE, LEFT, OUTLINE_FAST, FlxColor.BLACK);
		loadingText.borderSize = 2;
		add(loadingText);

                var bgBar:FlxSprite = new FlxSprite(0, 660).makeGraphic(1, 1, FlxColor.BLACK);
                bgBar.scale.set(FlxG.width - 300, 25);
                bgBar.updateHitbox();
                bgBar.screenCenter(X);
                add(bgBar);

		bar = new FlxSprite(bgBar.x + 5, bgBar.y + 5).makeGraphic(1, 1, FlxColor.WHITE);
		bar.scale.set(0, 15);
		bar.updateHitbox();
		add(bar);
		barWidth = Std.int(bgBar.width - 10);

		persistentUpdate = true;
		super.create();
	}
	
	var skipUpdate:Bool = false;
	var transitioning:Bool = false;
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if(skipUpdate) return;

		if(!transitioning)
		{
			if(canChangeState && !finishedLoading && checkLoaded())
			{
				transitioning = true;
				onLoad();
			}
			intendedPercent = loaded / loadMax;
		}

		if(curPercent != intendedPercent)
		{
			if(Math.abs(curPercent - intendedPercent) < 0.001) curPercent = intendedPercent;
			else curPercent = FlxMath.lerp(curPercent, intendedPercent, FlxMath.bound(0, 1, elapsed * 15));

			bar.scale.x = barWidth * curPercent;
			bar.updateHitbox();
		}

		// GACHA HORROR LOADING SCREEN
		timePassed += elapsed;
		shakeFl += elapsed * 3000;
		var txt:String = 'Now Loading.';
		switch(Math.floor(timePassed % 1 * 3))
		{
			case 1:
				txt += '.';
			case 2:
				txt += '..';
		}
		loadingText.text = txt;
	}
	
	var finishedLoading:Bool = false;
	function onLoad()
	{
		if (stopMusic && FlxG.sound.music != null)
			FlxG.sound.music.stop();

		MusicBeatState.switchState(target);
		imagesToPrepare = [];
		soundsToPrepare = [];
		musicToPrepare = [];
		songsToPrepare = [];
		finishedLoading = true;
	}
	
	inline static public function loadAndSwitchState(target:FlxState, stopMusic = false)
	{
		MusicBeatState.switchState(getNextState(target, stopMusic));
	}
	
	static function getNextState(target:FlxState, stopMusic = false):FlxState
	{
		var directory:String = 'shared';
		var weekDir:String = StageData.forceNextDirectory;
		StageData.forceNextDirectory = null;

		if(weekDir != null && weekDir.length > 0 && weekDir != '') directory = weekDir;

		Paths.setCurrentLevel(directory);
		trace('Setting asset folder to ' + directory);

		if(ClientPrefs.data.loadingScreen)
		{
			clearInvalids();
			if(imagesToPrepare.length > 0 || soundsToPrepare.length > 0 || musicToPrepare.length > 0 || songsToPrepare.length > 0)
			{
				startThreads();
				return new LoadingState(target, stopMusic, directory);
			}
		}

		if (stopMusic && FlxG.sound.music != null)
			FlxG.sound.music.stop();
		
		return target;
	}

	function checkLoaded()
	{
		if(loaded == loadMax && !finishedLoading)
			onLoad();

		return (loaded == loadMax);
	}

	static var imagesToPrepare:Array<String> = [];
	static var soundsToPrepare:Array<String> = [];
	static var musicToPrepare:Array<String> = [];
	static var songsToPrepare:Array<String> = [];
	public static function prepare(images:Array<String> = null, sounds:Array<String> = null, music:Array<String> = null)
	{
		if(images != null)
			imagesToPrepare = imagesToPrepare.concat(images);
		if(sounds != null)
			soundsToPrepare = soundsToPrepare.concat(sounds);
		if(music != null)
			musicToPrepare = musicToPrepare.concat(music);
	}

	public static function prepareToSong()
	{
		if(!ClientPrefs.data.loadingScreen) return;

		var folder:String = Paths.formatToSongPath(PlayState.SONG.song);
		try
		{
			var path:String = Paths.json('$folder/preload');
			var json:Dynamic = null;

			#if MODS_ALLOWED
			var moddyFile:String = Paths.modsJson('$folder/preload');
			if(FileSystem.exists(moddyFile)) json = Json.parse(File.getContent(moddyFile));
			else json = Json.parse(File.getContent(path));
			#else
			json = Json.parse(Assets.getText(path));
			#end

			if(json != null)
				prepare((!ClientPrefs.data.lowQuality || json.images_low) ? json.images : json.images_low, json.sounds, json.music);
		}
		catch(e:Dynamic) {}

		if(PlayState.SONG.stage == null || PlayState.SONG.stage.length < 1) {
			PlayState.SONG.stage = StageData.vanillaSongStage(folder);
		}

		var stageData:StageFile = StageData.getStageFile(PlayState.SONG.stage);
		if(stageData != null && stageData.preload != null)
			prepare((!ClientPrefs.data.lowQuality || stageData.preload.images_low) ? stageData.preload.images : stageData.preload.images_low, stageData.preload.sounds, stageData.preload.music);

		songsToPrepare.push(folder + '/Inst'); //load Inst
		//if(PlayState.SONG.needsVoices) songsToPrepare.push(Paths.voices(PlayState.SONG.song)); //load Voices

		var player1:String = PlayState.SONG.player1;
		var player2:String = PlayState.SONG.player2;
		var gfVersion:String = PlayState.SONG.gfVersion;
		if(gfVersion == null) gfVersion = 'gf';

		preloadCharacter(player1, PlayState.SONG.needsVoices);
		if(player2 != player1) preloadCharacter(player2, PlayState.SONG.needsVoices);

		if(!stageData.hide_girlfriend && gfVersion != player2 && gfVersion != player1)
			preloadCharacter(gfVersion, false);
	}

	public static function clearInvalids()
	{
		clearInvalidFrom(imagesToPrepare, 'images', '.png', IMAGE);
		clearInvalidFrom(soundsToPrepare, 'sounds', '.${Paths.SOUND_EXT}', SOUND);
		clearInvalidFrom(musicToPrepare, 'music',' .${Paths.SOUND_EXT}', SOUND);
		clearInvalidFrom(songsToPrepare, 'songs', '.${Paths.SOUND_EXT}', SOUND);

		for (arr in [imagesToPrepare, soundsToPrepare, musicToPrepare, songsToPrepare])
			while (arr.contains(null))
				arr.remove(null);
	}

	static function clearInvalidFrom(arr:Array<String>, prefix:String, ext:String, type:AssetType)
	{
		for (i in 0...arr.length)
		{
			var folder:String = arr[i];
			if(folder.trim().endsWith('/'))
			{
				for (subfolder in Mods.directoriesWithFile(Paths.getSharedPath(), '$prefix/$folder'))
					for (file in FileSystem.readDirectory(subfolder))
						if(file.endsWith(ext))
							arr.push(folder + file.substr(0, file.length - ext.length));

				//trace('Folder detected! ' + folder);
			}
		}

		var i:Int = arr.length-1;
		while(i > 0)
		{
			var member:String = arr[i];
			if(member.endsWith('/') || !Paths.fileExists('$prefix/$member$ext', type))
			{
				arr.remove(member);
				trace('Removed invalid $prefix: $member');
			}
			--i;
		}
	}

	public static function startThreads()
	{
		loaded = 0;
		loadMax = imagesToPrepare.length + soundsToPrepare.length + musicToPrepare.length + songsToPrepare.length;

		//then start threads
		for (image in imagesToPrepare)
			initThread(() -> Paths.image(image), 'image $image');
		for (sound in soundsToPrepare)
			initThread(() -> Paths.sound(sound), 'sound $sound');
		for (music in musicToPrepare)
			initThread(() -> Paths.music(music), 'music $music');
		for (song in songsToPrepare)
			initThread(() -> Paths.returnSound(null, song, 'songs'), 'song $song');
	}

	static function initThread(func:Void->Dynamic, traceData:String)
	{
		Thread.create(() -> {
			mutex.acquire();
			var ret:Dynamic = func();
			if(ret != null) trace('finished preloading $traceData');
			else trace('ERROR! fail on preloading $traceData');
			loaded++;
			mutex.release();
		});
	}

	inline private static function preloadCharacter(char:String, loadSong:Bool = true)
	{
		try
		{
			var path:String = Paths.getPath('characters/$char.json', TEXT, null, true);
			#if MODS_ALLOWED
			var character:Dynamic = Json.parse(File.getContent(path));
			#else
			var character:Dynamic = Json.parse(Assets.getText(path));
			#end
			
			imagesToPrepare.push(character.image);
			//if(loadSong) songsToPrepare.push(character.vocals_file);
		}
		catch(e:Dynamic) {}
	}
}
