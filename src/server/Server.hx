package server;

import mta.constants.HudComponent;
import mta.Globals;
import mta.Player;
import mta.math.Vector3;
import mtahx.BaseServer;

class Server extends BaseServer
{
	public static function main()
	{
		/*
		var obj = Globals.createObject(1337, 2597.31, -1690.17, 1.76);

		Globals.moveObject(obj, 1000, 2597.31, -1690.17, 5.76);
		player.setHudComponentVisible(HudComponent.ALL, false);

		Globals.outputChatBox("Welcome from the server " + player.name);
		*/
	}

	override public function create():Void
	{
		var player = Player.getRandom();

		player.spawn(2595.31, -1690.17, 1.76);
		player.fadeCamera(true);
		player.cameraTarget = player;
	}
}
