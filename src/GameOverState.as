package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;

	public class GameOverState extends FlxState
	{
		
		[Embed(source="../data/gameover.png")] public var rawGameOverImage:Class;
		[Embed(source="../data/gameOverBackground.jpeg")] public var rawGameOverBackgroundImage:Class;
		[Embed(source="../data/gameOver.mp3")]  public var rawGameOverMusic:Class;
		
		public function GameOverState()
		{
			
		}
		
		override public function create():void
		{
			var gameOverBackgroundImage:FlxSprite = new FlxSprite( 0, 0 , rawGameOverBackgroundImage );
			add( gameOverBackgroundImage );
			
			var gameOverImage:FlxSprite = new FlxSprite( 150, 180 , rawGameOverImage );
			add( gameOverImage );
			
			
			
			
			FlxG.playMusic( rawGameOverMusic );
		}
	}
}