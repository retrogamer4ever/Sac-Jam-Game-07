package
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;

	public class PlayState extends FlxState
	{	
		[Embed(source="../data/timePowerUp.png")] public var rawTimePowerUp:Class;
		[Embed(source="../data/trophy.png")]       public var rawTrophy:Class;
		[Embed(source="../data/floor.png")]        public var rawFloor:Class;
		[Embed(source="../data/background.jpeg")]   public var rawBackground:Class;
		[Embed(source="../data/player.png")]       public var rawPlayer:Class;
		[Embed(source="../data/block.png")]        public var rawBlock:Class;
		
		
		[Embed(source="../data/game.mp3")]      public var rawGameMusic:Class;
		[Embed(source="../effects/win3.mp3")]      public var rawTrophyClick:Class;
		[Embed(source="../effects/collect2.mp3")]      public var rawTimeClick:Class;
		
		
		
		public var player:FlxSprite;
		
		public var floor:FlxSprite;
		
		public var background:FlxSprite;
		
		public var timer:Timer;
		
		public var countDownText:FlxText;
		
		public var timeLeft:int = 2;
		
		public var level:FlxTilemap;
		
		
		public var timerPowerUp:FlxSprite;
		public var bottomLeftBlock:FlxSprite;
		public var topRightBlock:FlxSprite;
		public var topLeftBlock:FlxSprite;
		public var trophy:FlxSprite;
		
		public var addTime:int = 1;
		
		
		public function PlayState()
		{
			
		}
		
		public override function create():void
		{			
			FlxG.playMusic( rawGameMusic );
			
			player = new FlxSprite( 0, 450, rawPlayer );
			floor = new FlxSprite( 0, 475, rawFloor );
			floor.immovable = true;
			floor.touching = FlxObject.UP;
			
			floor.scrollFactor.x = 0;
			floor.scrollFactor.y = 0;
			
			background = new FlxSprite( 0, 0, rawBackground );
			background.scrollFactor.x = 0;
			background.scrollFactor.y = 0;
		
			add( background );
			
			trophy = new FlxSprite( 430, 390, rawTrophy );
			trophy.immovable = true;
			add( trophy );
			
			
			add( player );
			add( floor );
			
			timer = new Timer( 700 );
			timer.addEventListener( TimerEvent.TIMER, onTimerCountDown );
			
			countDownText = new FlxText( 100, 100, 300, "Time left: " + timeLeft );
			countDownText.size = 20;
			countDownText.scrollFactor.x = 0;
			countDownText.scrollFactor.y = 0;
			
			timer.start();
			
			add( countDownText );	
			
			
			player.maxVelocity.x = 80;   // Theses are pysics settings,
			player.maxVelocity.y = 200;  // controling how the players behave
			player.acceleration.y = 200; // in the game
			player.drag.x = player.maxVelocity.x*4;
			
			player.y = 425;
		}
		
		
		
		override public function update():void
		{
			super.update();
			
			updatePlayer();
			
			FlxG.collide( player, floor );
			
			FlxG.collide( player, trophy, function( player:FlxObject, trophy:FlxObject ):void
			{
				timer.removeEventListener(TimerEvent.TIMER, onTimerCountDown );
				
				var sound:FlxSound = new FlxSound();
				sound.loadEmbedded( rawTrophyClick );
				sound.play();

				
				FlxG.playMusic( rawTrophyClick );
				
				FlxG.switchState( new WinState() );	
			});
		}
		
		protected function updatePlayer():void
		{	
			player.acceleration.x = 0;
			
			if(FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x*4;
			
			if(FlxG.keys.justPressed( "SPACE") )
			{
				FlxG.shake();
				var sound:FlxSound = new FlxSound();
				sound.loadEmbedded( rawTimeClick );
				sound.play();
				
				addTime += 1;
				
				if( addTime > 7 )
				{
					addTime = 0;
					timeLeft += 1
						
					countDownText.text = "Time left: " + timeLeft;
				}
			}
		}
		
		public function onTimerCountDown( event:TimerEvent ):void
		{
			try
			{
				if( timeLeft == 0 )
				{
					timer.removeEventListener( TimerEvent.TIMER, onTimerCountDown );
					FlxG.switchState( new GameOverState() );	
					timer.stop();
				}
				else
				{
					timeLeft--;
					countDownText.text = "Time left: " + timeLeft;
				}
			}
			catch( error:Error )
			{
				trace( "bad way to handle something!" );	
			}
		}
	}
}