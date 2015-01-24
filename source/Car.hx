package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.util.FlxRandom;

class Car extends FlxSprite
{
    private var _map:GameMap;

    private var _speed:Float;

    public function new(x:Float, y:Float, map:GameMap)
    {
        super(x, y);
        _map = map;
        switch (FlxRandom.intRanged(0, 1)) {
            case 0:
                _speed = -350.0;
            case 1:
                _speed = 350.0;
        }
        makeGraphic(64, 64, 0xFFFF0000);
    }

    override public function update():Void
    {
        if (alive) {
            var tilePos = _map.getTileCoordsForWorldCoords(x, y);
            var tileKind = _map.getTile(tilePos[0], tilePos[1]);
            switch (tileKind) {
                case GameMap.TILE_STREET_VERT:
                    velocity.y = _speed;
                case GameMap.TILE_STREET_HORI:
                    velocity.x = _speed;
                case GameMap.TILE_STREET_CROSS:
            }

            if (velocity.x < 0) {
                facing = FlxObject.LEFT;
            } else if (velocity.x > 0) {
                facing = FlxObject.RIGHT;
            } else if (velocity.y < 0) {
                facing = FlxObject.UP;
            } else if (velocity.y > 0) {
                facing = FlxObject.DOWN;
            }

            if (x < 0) {
                x = _map._width * _map._tileSize;
            }
            if (y < 0) {
                y = _map._height * _map._tileSize;
            }
            if (x > _map._width * _map._tileSize) {
                x = 0;
            }
            if (y > _map._height * _map._tileSize) {
                y = 0;
            }
        }

        super.update();
    }

    override public function destroy():Void
    {
        _map = null;
        super.destroy();
    }

    override public function kill():Void
    {
        velocity.x = velocity.y = 0;
        alive = false;
        y = y + 32;
        makeGraphic(64, 32, 0xFFFF0000);
    }
}
