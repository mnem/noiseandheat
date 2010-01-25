package
{
	import flash.display.Sprite;
	
	public class CircleSprite extends Sprite
	{
		public function CircleSprite()
		{
			graphics.lineStyle(2, 0xf0f0c0, 1, true);
			graphics.beginFill(0x8f8f8f);
			graphics.drawCircle(0, 0, 7);
			graphics.endFill();
		}
	}
}
