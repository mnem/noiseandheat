package
{
	import noiseandheat.Log;

	public class MrNoisy
	{
		private static var instanceCount :uint = 0;
		private var instanceID :uint;
		
		public function MrNoisy()
		{
			instanceID = instanceCount++;
			
			Log.instance.writeln("MR NOISY " + instanceID + " CONSTRUCTED!");
		}
		
		public function toString() : String
		{
			Log.instance.writeln("MR NOISY " + instanceID + " TURNED INTO A STRING!");
			
			return "[I AM MR NOISY NUMBER " + instanceID + "]";
		}
		
		public function set thing(value :Object) :void
		{
			Log.instance.writeln("MR NOISY " + instanceID + " HAVING THING SET TO " + value + "!");
		}
		
		public function get thing() :Object
		{
			Log.instance.writeln("MR NOISY " + instanceID + " HAVING THING FETCHED!");
			
			return {};
		}
	}
}