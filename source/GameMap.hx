package ;

import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxRandom;

class GameMap extends FlxTilemap
{
    public var _width:Int = 20;
    public var _height:Int = 20;
    public var _tileSize:Int = 128;

    public function new()
    {
        super();
        var mapArray = [];
        for (i in 0..._width) {
            for (j in 0..._height) {
                mapArray.push(1);
            }
        }
        widthInTiles = _width;
        heightInTiles = _height;
        loadMap(mapArray, "assets/images/bodentextur.png", _tileSize, _tileSize);

        
//        for (i in 0..._width) {
//            for (j in 0..._height) {
//                setTile(i, j, );
//            }
//        }
        // von Silvio
        var strassen_x:Int = Std.int(_width / 10);
        for (sx in 0...strassen_x) {
            var sp = FlxRandom.intRanged(0, _width - 1);
            if (sp > 1 && sp < _height - 2 && getTile(sp-1, 0) != 2 && getTile(sp-2, 0) != 2 && getTile(sp+1, 0) != 2 && getTile(sp+2, 0) != 2) {
                for (c in 0..._width) {
                    setTile(sp, c, 2);
                }
            }
        }

        var strassen_y:Int = Std.int(_height / 10);
        for (sy in 0...strassen_y) {
            var sp = FlxRandom.intRanged(0, _height - 1);
            if (sp > 1 && sp < _width-2 && getTile(0,sp-1) != 3 && getTile(0,sp-2) != 3 && getTile(0, sp+1) != 3 && getTile(0, sp+2) != 3) {
                for (c in 0..._height) {
                    if (getTile(c, sp) == 2 || getTile(c, sp) == 4)
                    {
                        setTile(c, sp, 4);
                    }
                    else
                    {
                        setTile(c, sp, 3);
                    }
                }
            }
        }
    }

//    override public function update():Void
//    {
//        super.update();
//    }

    override public function destroy():Void
    {
        super.destroy();
    }
}
