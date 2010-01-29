package
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class CircleSprite extends Sprite
	{
		public static const DIAMETER :Number = 17 * 2;
		
		private static var instanceCount :uint = 0;
		private var instanceID :uint;

		public function CircleSprite()
		{
			instanceID = instanceCount++;
			
			mouseEnabled = false;
			mouseChildren = false;

			graphics.lineStyle(2, 0xf0f0c0, 1, true);
			graphics.beginFill(0x8f8f8f);
			graphics.drawCircle(0, 0, DIAMETER / 2);
			graphics.endFill();
			
			var text :TextField = new TextField();
			
			var format :TextFormat = text.defaultTextFormat;
			format.align = TextFormatAlign.CENTER;
			format.font = "Arial";
			format.bold = false;
			format.color = 0xdcdccc;
			text.defaultTextFormat = format;
			
			text.text = instanceID.toString();
			text.width = text.textWidth + 4;
			text.height = text.textHeight + 2;
			
			text.x = -text.width / 2;
			text.y = -text.height / 2;
			
			addChild(text);
		}
	}
}
