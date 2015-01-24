package;

import flixel.FlxSprite;
import flixel.FlxG;

class Car extends FlxSprite
{
    private var _map:GameMap;

    public function new(x:Float, y:Float, map:GameMap)
    {
        super(x, y);
        _map = map;
        makeGraphic(64, 64, 0xFFFF0000);
    }

    override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        _map = null;
        super.destroy();
    }

    override public function kill():Void
    {
        alive = false;
        y = y + 32;
        makeGraphic(64, 32, 0xFFFF0000);
    }
}
