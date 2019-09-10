package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Thing extends MovieClip {
		
		private var velocityX:Number = 0;
		private var velocityY:Number = 0;
		private var velocityA:Number = 0; // angular velocity
		
		public var isDead:Boolean = false;
		public var points:Number = 0;
		
		public function Thing() {
			x = 550/2;
			y = 400/2;
			
			
			velocityX = Math.random() * 20 - 10; // -10 to +10
			velocityY = Math.random() * 10 - 20; // -20 to -10
			velocityA = Math.random() * 80 - 40; // -40 to +40
			
			addEventListener(MouseEvent.MOUSE_DOWN, click);
			
		}
		public function dispose():void {
			removeEventListener(MouseEvent.MOUSE_DOWN, click);
		}
		private function click(e: MouseEvent):void {
			isDead = true;
			points = 100;
		}
		public function update():void {
						
			// euler integration:
			
			var gravity:Number = 1;
			
			velocityY += gravity;
			
			x += velocityX;
			y += velocityY;
			
			rotation += velocityA;
			
			if(y > 400) isDead = true; // I'm dead
		}
	}
}
