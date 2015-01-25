package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
using flixel.util.FlxSpriteUtil;

class StoryState extends FlxState
{
    private var _storyBoard:FlxSprite;
    private var _btnContinue:FlxButton;
    private var _contCount:Int = 0;

    override public function create():Void
    {
        FlxG.mouse.visible = true;
        bgColor = 0xFFFFFFFF;

        _storyBoard = new FlxSprite();
        _storyBoard.loadGraphic("assets/images/S1.png");
        _storyBoard.screenCenter();
        add(_storyBoard);

        _btnContinue = new FlxButton(0, 0, "", clickContinue);
        _btnContinue.loadGraphic("assets/images/continuemaske.png");
        _btnContinue.screenCenter();
        add(_btnContinue);
        _btnContinue.y += 250;

        FlxG.sound.play("assets/sounds/EnteRTAINER/Narrator01.wav");

        super.create();
    }

    private function clickContinue():Void
    {
        switch (_contCount) {
            case 0:
                _storyBoard.loadGraphic("assets/images/S2.png");
                FlxG.sound.play("assets/sounds/EnteRTAINER/Narrator02.wav");
                _contCount++;
            case 1:
                _storyBoard.loadGraphic("assets/images/S3.png");
                FlxG.sound.play("assets/sounds/EnteRTAINER/Narrator03.wav");
                _contCount++;
            case 2:
                _storyBoard.loadGraphic("assets/images/S4.png");
                FlxG.sound.play("assets/sounds/EnteRTAINER/Narrator04.wav");
                _contCount++;
            case 3:
                _storyBoard.loadGraphic("assets/images/RAGE.png");
                FlxG.sound.play("assets/sounds/RageAD02.wav");
                _storyBoard.screenCenter();
                _contCount++;
            case 4:
                FlxG.switchState(new PlayState());
        }

    }

    override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }
}
