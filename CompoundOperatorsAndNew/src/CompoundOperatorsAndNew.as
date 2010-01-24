package
{
	import flash.display.Sprite;
	
	public class CompoundOperatorsAndNew extends Sprite
	{
		public function CompoundOperatorsAndNew()
		{
			newChild();
		}
		
		public function newChild() :void
		{
			addChild(new CircleSprite()).x += 40;
		}
	}
}