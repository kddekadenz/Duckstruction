package;

import flixel.FlxSprite;
import flixel.FlxG;

class Building extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        loadGraphic("assets/images/haus1_new.png", true, 105, 272);
        animation.add("destroyed", [1], 1, true);
    }

    override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function kill():Void
    {
        alive = false;
        animation.play("destroyed");
    }
}
