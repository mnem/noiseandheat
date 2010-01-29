package
{
	import flash.display.Sprite;
	
	[SWF(backgroundColor="#3f3f3f", frameRate="31", width="128", height="128")]
	public class CompoundOperatorsAndNew extends Sprite
	{
		public function CompoundOperatorsAndNew()
		{
			// Do some random magic. Nothing to see here
			x = (128 - 50) / 2;
			y = 128 / 2;
			
			// Stick one child on the stage. Or do I? Bwahahahaha.
			newChild();
			
			// Make a new Mr. Noisy and ghostly friend.
			newMrNoisy();
			
			funcWithManyArguments(1,2,3,4,5,6,7);
		}
		
		public function funcWithManyArguments(a:int,b:int,c:int,d:int,e:int,f:int,g:int) :int
		{
			return a+b+c+d+e+f+g;
		}
		
		public function newChild() :void
		{
			addChild(new CircleSprite()).x += 50;
		}
		
		public function newMrNoisy() :void
		{
			returnMrNoisy(new MrNoisy()).thing += 50;
		}

		public function newMrNoisyWithLocalStorage() :void
		{
			var m :MrNoisy;
			returnMrNoisy(m = new MrNoisy()).thing += 50;
		}
		
		public function returnMrNoisy(o :MrNoisy) :MrNoisy
		{
			return o;
		}
	}
}
