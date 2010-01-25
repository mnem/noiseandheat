package
{
	public class MrNoisy
	{
		private static var instanceCount :uint = 0;
		private var instanceID :uint;
		
		public function MrNoisy()
		{
			instanceID = instanceCount++;
			
			trace("MR NOISY " + instanceID + " CONSTRUCTED!");
		}
		
		public function toString() : String
		{
			trace("MR NOISY " + instanceID + " TURNED INTO A STRING!");
			return "[I AM MR NOISY NUMBER " + instanceID + "]";
		}
		
		public function set thing(value :Object) :void
		{
			trace("MR NOISY " + instanceID + " HAVING THING SET TO " + value + "!");
		}
		
		public function get thing() :Object
		{
			trace("MR NOISY " + instanceID + " HAVING THING FETCHED!");
			return {};
		}
	}
}