package ;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxAngle;

class Duck extends FlxSprite
{
    public var speed:Float = 300;

    public function new()
    {
        super();
        //makeGraphic(32, 32, 0xFFFF0000);
        loadGraphic("assets/images/duck.png", true, 64, 64);
        animation.add("walk", [0, 1], 8, false);
        drag.x = drag.y = 1600;
        width = 32;
        offset.x = 16;
    }

    override public function update():Void
    {
        movement();
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    // Stolen from FlixelTut
    // https://raw.githubusercontent.com/HaxeFlixel/flixel-tutorial/Part-VII/source/Player.hx
	override public function draw():Void 
	{
		if (velocity.x != 0 || velocity.y != 0)
		{
			switch(facing)
			{
				case FlxObject.LEFT, FlxObject.RIGHT:
					animation.play("walk");
					
				case FlxObject.UP:
					animation.play("walk");
					
				case FlxObject.DOWN:
					animation.play("walk");
			}
		}
			
		super.draw();
	}

    private function movement():Void
    {
        var _up:Bool = false;
        var _down:Bool = false;
        var _left:Bool = false;
        var _right:Bool = false;

        _up = FlxG.keys.anyPressed(["UP", "W"]);
        _down = FlxG.keys.anyPressed(["DOWN", "S"]);
        _left = FlxG.keys.anyPressed(["LEFT", "A"]);
        _right = FlxG.keys.anyPressed(["RIGHT", "D"]);

        if (_up && _down)
            _up = _down = false;
        if (_left && _right)
            _left = _right = false;

        if (_up || _down || _left || _right)
        {
            var mA:Float = 0;
            if (_up)
            {
                mA = -90;
                if (_left)
                    mA -= 45;
                else if (_right)
                    mA += 45;
                facing = FlxObject.UP;
            }
            else if (_down)
            {
                mA = 90;
                if (_left)
                    mA += 45;
                else if (_right)
                    mA -= 45;
                facing = FlxObject.DOWN;
            }
            else if (_left)
            {
                mA = 180;
                facing = FlxObject.LEFT;
            }
            else if (_right)
            {
                mA = 0;
                facing = FlxObject.RIGHT;
            }       

            FlxAngle.rotatePoint(speed, 0, 0, 0, mA, velocity);
        }
    }


}
