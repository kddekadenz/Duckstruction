package;

import flixel.effects.particles.FlxEmitter;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxRandom;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
    private var _map:GameMap;
    private var _duck:Duck;
    private var _buildings:FlxTypedGroup<Building>;
    private var _buildingGibs:FlxEmitter;

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		FlxG.mouse.visible = false;

        _map = new GameMap();
        add(_map);

        _buildings = new FlxTypedGroup<Building>();
        placeBuildings();

        _buildingGibs = new FlxEmitter();
		_buildingGibs.setXSpeed( -1600, 1600);
		_buildingGibs.setYSpeed( -1600, 0);
		_buildingGibs.setRotation( -720, -720);
		_buildingGibs.gravity = 800;
		_buildingGibs.bounce = 0.35;
		_buildingGibs.makeParticles("assets/images/building_gibs.png", 200, 20, true, 0.0);
        add(_buildingGibs);

        _duck = new Duck();
        add(_duck);
        FlxG.camera.follow(_duck, FlxCamera.STYLE_TOPDOWN, 1);

		super.create();
	}

    private function placeBuildings():Void
    {
        for (tileX in 3..._map._width - 3) {
            for (tileY in 3..._map._height - 3) {
                switch (_map.getTile(tileX, tileY)) {
                    case GameMap.TILE_BLOCK:
                        if (FlxRandom.float() < 0.1) {
                            _buildings.add(new Building(tileX * _map._tileSize, tileY * _map._tileSize));
                        }
                }
            }
        }
        add(_buildings);
    }

	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();

        FlxG.overlap(_duck, _buildings, duckOverlapBuilding);

        // Make duck stay on map
        if (_duck.x < 0)
            _duck.x = 0;
        if (_duck.y < 0)
            _duck.y = 0;
        if (_duck.x > _map._width * _map._tileSize - _duck.width)
            _duck.x = _map._width * _map._tileSize - _duck.width;
        if (_duck.y > _map._height * _map._tileSize - _duck.height)
            _duck.y = _map._height * _map._tileSize - _duck.height;

	}	

    private function duckOverlapBuilding(duck:Duck, building:Building):Void
    {
        trace("hit");
        trace("alive" + building.alive);
        trace("exists" + building.exists);
        if (duck.alive && duck.exists && building.alive && building.exists) {
            _buildingGibs.at(building);
            _buildingGibs.start(true, 5);
            building.kill();
        }
    }
}
