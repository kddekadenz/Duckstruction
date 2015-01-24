package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
using flixel.util.FlxSpriteUtil;

class StoryState extends FlxState
{
    private var _btnContinue:FlxButton;

    override public function create():Void
    {
        FlxG.mouse.visible = true;
        bgColor = 0xFFFFFFFF;

        _btnContinue = new FlxButton(0, 0, "", clickContinue);
        _btnContinue.loadGraphic("assets/images/continuemaske.png");
        _btnContinue.screenCenter();
        add(_btnContinue);
        _btnContinue.y += 100;

        super.create();
    }

    private function clickContinue():Void
    {
        FlxG.switchState(new PlayState());
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
