package noiseandheat
{
	public class Log
	{
		private static var _instance :Log;
		private static var chastityBeltUnlocked :Boolean;
		
		private static var _out :Function;
		
		public static function get instance() :Log
		{
			if(_instance == null)
			{
				chastityBeltUnlocked = true;
				_instance = new Log();
				chastityBeltUnlocked = false;
			}
			
			return _instance;
		}

		public function get out():Function
		{
			return _out;
		}

		public function set out(value:Function):void
		{
			_out = value;
		}
		
		public function Log()
		{
			if(!chastityBeltUnlocked)
			{
				throw new Error("Use Log.instance instead of new.");
			}
			
			out = trace;
		}
		
		public function writeln(message :String):void
		{
			write(message + "/n");
		}
		
		public function write(message :String):void
		{
			if(_out != null)
			{
				_out(message);
			}
		}
	}
}