package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;

class AboutState extends FlxState
{
    private var _btnCredits:FlxButton;

    override public function create():Void
    {
        FlxG.mouse.visible = true;
        bgColor = 0xFFFFFFFF;

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
