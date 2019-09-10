package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	
	
	public class Game extends MovieClip {
		
		
		private var health:Number = 100;
		private var score:Number = 0;
		private var xAtFullHealth:Number;
		
		private var things:Array = new Array();
		private var anims:Array = new Array();
		private var hud:MyHUD;
		
		public function Game() {
			
			hud = new MyHUD();
			addChild(hud);
			xAtFullHealth = hud.healthBar.x;
			hud.scoreboard.autoSize = TextFieldAutoSize.RIGHT;
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
			
		} // ends constructor
		
		private function gameLoop(e:Event):void {
			
			// spawn thing:
			var t:Thing = new Thing();
			var index:int = getChildIndex(hud);
			addChildAt(t, index);
			things.push(t);
			
			updateThings();
			updateAnims();
			
			
			health--; // hurt the player
			var p:Number = (health / 150); // get health as a percent
			if(p < 0) p = 0; // clamp min to 0
			if(p > 1) p = 1; // clamp max to 1
			
			hud.healthBar.x = xAtFullHealth - (1 - p) * hud.healthBar.width;
			//hud.healthBar.scaleX = p; // set width of health bar
			
			hud.scoreboard.text = "score: " + score;
			
						
		} // ends game loop
		
		private function updateThings():void {
			// update all things:
			for(var i:int = things.length - 1; i >= 0; i--){
				things[i].update();
				
				if(things[i].isDead){
					
					if(things[i].points > 0){
						score += things[i].points;
						var a = new AnimSplatter();
						a.x = things[i].x;
						a.y = things[i].y;
						addChild(a);
						anims.push(a);
					}
					things[i].dispose(); // remove event listeners
					removeChild(things[i]); // remove from scene graph
					things.removeAt(i); // remove from the array
				}				
			}
		}
		private function updateAnims():void {
			for(var i:int = anims.length - 1; i >= 0; i--){
				anims[i].update();
				
				if(anims[i].isDead){
					removeChild(anims[i]); // remove from scene graph
					anims.removeAt(i); // remove from the array
				}				
			}
		}
		
		
	} // ends class
	
} // ends package