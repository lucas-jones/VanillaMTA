package server;

import mta.constants.HudComponent;
import mta.Globals;
import mta.Player;
import mta.math.Vector3;

class Server
{
	public static function main()
	{
		var player = Player.getRandom();

		player.spawn(2595.31, -1690.17, 1.76);
		player.fadeCamera(true);
		player.cameraTarget = player;
		player.setCameraMatrix(1468.87, -919.25, 100.15, 1468.38, -918.42, 99.88);
		player.setHudComponentVisible(HudComponent.ALL, false);

		Globals.outputChatBox("Welcome from the server " + player.name);				
	}
}
