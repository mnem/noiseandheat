package
{
	import flash.display.Sprite;
	
	[SWF(backgroundColor="#3f3f3f", frameRate="31", width="128", height="128")]
	public class CompoundOperatorsAndNew extends Sprite
	{
		public function CompoundOperatorsAndNew()
		{
			// Do some random magic. Nothing to see here
			x = (128 - 40) / 2;
			y = 128 / 2;
			
			// Stick one child on the stage. Or do I? Bwahahahaha.
			newChild();
			
			// Make a new Mr. Noisy and ghostly friend.
			newMrNoisy();
		}
		
		public function newChild() :void
		{
			addChild(new CircleSprite()).x += 40;
		}
		
		public function newMrNoisy() :void
		{
			returnMrNoisy(new MrNoisy()).thing += 40;
		}

		public function newMrNoisyWithLocalStorage() :void
		{
			var m :MrNoisy;
			returnMrNoisy(m = new MrNoisy()).thing += 40;
		}
		
		public function returnMrNoisy(o :MrNoisy) :MrNoisy
		{
			return o;
		}
	}
}
