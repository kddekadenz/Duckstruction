package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
using flixel.util.FlxSpriteUtil;

class EndState extends FlxState
{
    private var _whatDoWeDoNow:FlxText;
    private var _logo:FlxSprite;
    private var _duck:FlxSprite;
    private var _btnPlay:FlxButton;

	override public function create():Void
	{
        FlxG.mouse.visible = true;
        bgColor = 0xFFFFFFFF;

        _whatDoWeDoNow = new FlxText(0, 0, 0, "You destroyed everything!", 24);
        _whatDoWeDoNow.screenCenter();
        add(_whatDoWeDoNow);
        _whatDoWeDoNow.y -= 250;
        _whatDoWeDoNow = new FlxText(0, 0, 0, "What do we do now?", 24);
        _whatDoWeDoNow.screenCenter();
        add(_whatDoWeDoNow);
        _whatDoWeDoNow.y -= 200;

        _logo = new FlxSprite(0, 0, "assets/images/maskelogo.png");
        _logo.screenCenter();
        add(_logo);
        _logo.y -= 100;

        _duck = new FlxSprite(0, 0);
        _duck.loadGraphic("assets/images/duck.png", true, 64, 64);
        _duck.animation.add("idle", [0, 1], 6, true);
        _duck.animation.play("idle");
        _duck.screenCenter();
        add(_duck);

        _btnPlay = new FlxButton(0, 0, "", clickPlay);
        _btnPlay.loadGraphic("assets/images/maskeplayagain.png");
        _btnPlay.screenCenter();
        add(_btnPlay);
        _btnPlay.y += 150;

		super.create();
	}

    private function clickPlay():Void
    {
        FlxG.switchState(new PlayState());
    }
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}	
}
