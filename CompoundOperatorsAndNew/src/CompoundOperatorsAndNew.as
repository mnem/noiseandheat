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
// ABC Output for newChild		
//		function :CompoundOperatorsAndNew:::newChild()::void
//		maxStack:3 localCount:1 initScopeDepth:9 maxScopeDepth:10
//			getlocal0     	
//			pushscope     	
//			findpropstrict	:addChild
//			findpropstrict	:CircleSprite
//			constructprop 	:CircleSprite (0)
//			callproperty  	:addChild (1)
//			findpropstrict	:addChild
//			findpropstrict	:CircleSprite
//			constructprop 	:CircleSprite (0)
//			callproperty  	:addChild (1)
//			getproperty   	:x
//			pushbyte      	50
//			add           	
//			setproperty   	:x
//			returnvoid    	
//		0 Extras
//		0 Traits Entries
///////////////////////////////////////////////////////////////////
		
		public function newMrNoisy() :void
		{
			returnMrNoisy(new MrNoisy()).thing += 50;
		}
//	ABC Output for newMrNoisy
//		function :CompoundOperatorsAndNew:::newMrNoisy()::void
//		maxStack:3 localCount:1 initScopeDepth:9 maxScopeDepth:10
//			getlocal0     	
//			pushscope     	
//			getlocal0     	
//			findpropstrict	:MrNoisy
//			constructprop 	:MrNoisy (0)
//			callproperty  	:returnMrNoisy (1)
//			getlocal0     	
//			findpropstrict	:MrNoisy
//			constructprop 	:MrNoisy (0)
//			callproperty  	:returnMrNoisy (1)
//			getproperty   	:thing
//			pushbyte      	50
//			add           	
//			setproperty   	:thing
//			returnvoid    	
//		0 Extras
//		0 Traits Entries
///////////////////////////////////////////////////////////////////

		public function newMrNoisyWithLocalStorage() :void
		{
			var m :MrNoisy;
			returnMrNoisy(m = new MrNoisy()).thing += 50;
		}
		
//	ABC Output for newMrNoisyWithLocalStorage
//		function :CompoundOperatorsAndNew:::newMrNoisyWithLocalStorage()::void
//		maxStack:4 localCount:3 initScopeDepth:9 maxScopeDepth:10
//			getlocal0     	
//			pushscope     	
//			pushnull      	
//			coerce        	:MrNoisy
//			setlocal1     	
//			getlocal0     	
//			findpropstrict	:MrNoisy
//			constructprop 	:MrNoisy (0)
//			dup           	
//			setlocal2     	
//			coerce        	:MrNoisy
//			setlocal1     	
//			getlocal2     	
//			kill          	2
//			callproperty  	:returnMrNoisy (1)
//			getlocal0     	
//			findpropstrict	:MrNoisy
//			constructprop 	:MrNoisy (0)
//			dup           	
//			setlocal2     	
//			coerce        	:MrNoisy
//			setlocal1     	
//			getlocal2     	
//			kill          	2
//			callproperty  	:returnMrNoisy (1)
//			getproperty   	:thing
//			pushbyte      	50
//			add           	
//			setproperty   	:thing
//			returnvoid    	
//		0 Extras
//		0 Traits Entries
///////////////////////////////////////////////////////////////////
		
		public function returnMrNoisy(o :MrNoisy) :MrNoisy
		{
			return o;
		}
	}
}
