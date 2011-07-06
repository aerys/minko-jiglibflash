package aerys.minko.type.jiglib
{
	import jiglib.physics.PhysicsSystem;
	
	public final class JiglibPhysics
	{
		public static const MIN_SPEED	: Number	= .001;
		
		private var _speed			: Number		= 0.;
		private var _lastUpdate		: Number		= 0;
		private var _physicsSystem	: PhysicsSystem	= null;
		private var _paused			: Boolean		= false;
		private var _processingTime	: int			= 0;
		private var _frameRate		: Number		= 30.;
		
		public function get processingTime() : int
		{
			return _processingTime;
		}
		
		public function get isPaused() : Boolean
		{
			return _paused;
		}
		
		public function set speed(value : Number) : void
		{
			_speed = value;
		}
		
		public function get speed() : Number
		{
			return _speed;
		}
		
		public function JiglibPhysics(speed : Number = 2)
		{
			_speed = speed;
			_physicsSystem = PhysicsSystem.getInstance();
			_physicsSystem.setCollisionSystem(false);
		}
		
		public function get system() : PhysicsSystem
		{
			return _physicsSystem;
		}
		
		public function pause() : void
		{
			_paused = true;
		}
		
		public function resume() : void
		{
			_paused = false;
		}
		
		public function update() : void
		{
			var t 		: Number = new Date().time;
			var deltaT 	: Number = t - _lastUpdate;
			
//			if (deltaT < 1000. / _frameRate)
//				return ;
			
			if (!_paused && _speed >= MIN_SPEED)
				_physicsSystem.integrate(deltaT / 1000. * _speed);

			_processingTime = new Date().time - t;
			_lastUpdate = t;
		}
	}
}