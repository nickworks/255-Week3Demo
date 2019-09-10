package  {
	
	import flash.display.MovieClip;
	
	
	public class AnimSplatter extends MovieClip {
		
		public var isDead:Boolean = false;
		
		public function AnimSplatter() {
			// constructor code
		}
		public function update():void {
			
			if(currentFrame == totalFrames){
				stop();
				if(alpha > 0){
					alpha -= .1;
				} else {
					isDead = true;
				}
			}
			
		}
	}	
}
