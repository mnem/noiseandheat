package
{
	import flash.display.Shader;
	import flash.display.ShaderJob;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	public class Bender extends Sprite
	{
		[Embed(source="InverseSquareRoot.pbj", mimeType="application/octet-stream")]
		private var InverseSquareRootKernelClass :Class;
		
		private var inputNumbers :Vector.<Number>;
		private var result :ByteArray = null;
		
		public function Bender()
		{
			inputNumbers = new Vector.<Number>();
			
			for(var i :int = 0; i < 1000; i++)
			{
				inputNumbers.push(i);
			}
			
			var button :Sprite = new Sprite();
			button.graphics.beginFill(0xdcdccc);
			button.graphics.drawRoundRect(0, 0, 100, 20, 8, 8);
			button.graphics.endFill();
			button.x = 100;
			button.y = 100;
			button.addEventListener(MouseEvent.CLICK, buttonClicked);
			addChild(button);
		}
		
		public function buttonClicked(event :MouseEvent) :void
		{
			if( result == null)
			{
				trace("Here we go, here we go, here we go...");
				calculateInverseSqrt(inputNumbers);
			}
			else
			{
				trace("Looks like the result is still being processed... Patience...");
			}
		}
		
		public function calculateInverseSqrt(values :Vector.<Number>) :void
		{
			var input :ByteArray = numberVectorToByteArray(values);
			var shader :Shader = new Shader(new InverseSquareRootKernelClass());
			var shaderJob :ShaderJob;
			var height :int;
			var width :int;
			
			width = input.length / 4;
			height = 1;
			trace("shader.data.src.channels=" + shader.data.src.channels);
			shader.data.src.width = width;
			shader.data.src.height = height;
			shader.data.src.input = input;
			
			result = new ByteArray();
			result.endian = Endian.LITTLE_ENDIAN;
			
			shaderJob = new ShaderJob(shader, result, width, height);
			shaderJob.addEventListener(Event.COMPLETE, listProcessed);
			shaderJob.start();
		}
		
		public function listProcessed(event :Event) :void
		{
			var numbers :Vector.<Number> = byteArrayToNumberVector(result);
			var output :String = "And the results are in: ";
			
			// We actually only care about every third value as
			// the rest are padding - the kernel outputs a 3 channel
			// pixel
			for(var i :int = 0; i < numbers.length; i += 3)
			{
				output += "[" + (i/3) + "] " +numbers[i].toString() + ", ";
			}
			
			trace(output);
			
			result = null;
		}
		
		private function numberVectorToByteArray(values :Vector.<Number>) :ByteArray
		{
			var bytes :ByteArray = new ByteArray();
			
			bytes.endian = Endian.LITTLE_ENDIAN;
			
			for(var i :int = 0; i < values.length; i++)
			{
				bytes.writeFloat(values[i]);
			}
			
			bytes.position = 0;
			return bytes;
		}
		
		private function byteArrayToNumberVector(bytes :ByteArray) :Vector.<Number>
		{
			var numbers :Vector.<Number> = new Vector.<Number>();
			
			for(var i :int = 0; i < bytes.length; i += 4)
			{
				numbers.push(bytes.readFloat());
			}
			
			return numbers;
		}
	}
}