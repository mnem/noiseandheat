package
{
	import flash.display.Sprite;
	
	public class CircleSprite extends Sprite
	{
		public function CircleSprite()
		{
			graphics.beginFill(0xff0000);
			graphics.drawCircle(0, 0, 8);
			graphics.endFill();
		}
	}
}
