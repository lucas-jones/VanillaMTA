package client;

import mtahx.events.EventHandler;
import mta.audio.Sound;
import mta.Globals;
import mta.Player;

class CameraManager
{
	public var cameras(default, null):Array<Camera>;

	public var currentCamera(default, null):Camera;

	public function new(camera:Camera)
	{
		cameras = [];

		cameras.push(camera);
		currentCamera = camera;
	}

	public function update(deltaTime:Float)
	{
		currentCamera.update(deltaTime);

		Globals.setCameraMatrix(currentCamera.x, currentCamera.y, currentCamera.z,
								currentCamera.lookAtX, currentCamera.lookAtY, currentCamera.lookAtZ);


	}
}

class Camera
{
	public var x:Float;
	public var y:Float;
	public var z:Float;

	public var lookAtX:Float;
	public var lookAtY:Float;
	public var lookAtZ:Float;

	public var tweening(default, null):Bool;

	public function new(x:Float, y:Float, z:Float, lookAtX:Float = 0, lookAtY:Float = 0, lookAtZ:Float = 0)
	{
		this.x = x;
		this.y = y;
		this.z = z;

		this.lookAtX = lookAtX;
		this.lookAtY = lookAtY;
		this.lookAtZ = lookAtZ;
	}
	var currentTime:Float = 0;

	public function update(deltaTime:Float)
	{
		currentTime += deltaTime / 1200000;

		this.x = lerp(currentTime, this.x, 1263.74);
		this.y = lerp(currentTime, this.y, -934.68);
		this.z = lerp(currentTime, this.z, 53.15);

		this.lookAtX = lerp(currentTime, this.lookAtX, 0);
		this.lookAtY = lerp(currentTime, this.lookAtY, -1000);
		this.lookAtZ = lerp(currentTime, this.lookAtZ, 0);
	}

	public function lerp(amount:Float, start:Float, end:Float):Float
    {
        if (start == end) 
        {
            return start;
        }

        return ( ( 1 - amount ) * start ) + ( amount * end ) ;
    };
}

class Client 
{
	public static var cameraManager:CameraManager;

	public static function main()
	{
		var camera:Camera = new Camera(1504.75, -934.57, 82.60, 800, 0, 0);

		cameraManager = new CameraManager(camera);

		//var sound = Sound.create("assets/theme.mp3");
		//sound.volume = 1;


		EventHandler.addOnClientPreRender(function(delta)
		{
			cameraManager.update(delta);
			//Globals.outputChatBox(obj + "ms");
		});
		//1504.75, -934.57, 82.60
		//1263.74, -934.68, 53.15
		//1086.84, -953.10, 43.47
	}
}