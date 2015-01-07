package server;

import mta.Globals;
import mta.Player;

class Server
{
	public static function main()
	{
		var player = Player.getRandom();

		Globals.outputChatBox(player.name);
	}
}
