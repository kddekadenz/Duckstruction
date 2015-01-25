package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
using flixel.util.FlxSpriteUtil;

class AboutState extends FlxState
{
    private var _creditsImg:FlxSprite;
    private var _btnCredits:FlxButton;

    override public function create():Void
    {
        FlxG.mouse.visible = true;
        bgColor = 0xFFFFFFFF;

        _creditsImg = new FlxSprite(0, 0, "assets/images/credits.png");
        _creditsImg.screenCenter();
        add(_creditsImg);

        _btnCredits = new FlxButton(1024 - 128, 576 - 32, "", clickBack);
        _btnCredits.loadGraphic("assets/images/backbutton_small.png");
        add(_btnCredits);

        super.create();
    }

    private function clickBack():Void
    {
        FlxG.switchState(new MenuState());
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
