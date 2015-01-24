package;

import flixel.FlxSprite;
import flixel.FlxG;

class Building extends FlxSprite
{
    public function new(x:Float, y:Float)
    {
        super(x, y);
        makeGraphic(64, 256, 0xFF0000FF);
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
        y = y + 256 -32;
        makeGraphic(64, 32, 0xFF0000FF);
    }
}
