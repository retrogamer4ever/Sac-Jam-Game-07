package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	
	public class WinState extends FlxState
	{
		
		[Embed(source="../data/win.mp3")] public var rawWinMusic:Class;
		
		[Embed(source="../data/winner.jpeg")]   public var rawWinner:Class;
		
		public function WinState()
		{
		}
		
		override public function create():void
		{
			FlxG.playMusic( rawWinMusic );
			
			var winnerBackground:FlxSprite = new FlxSprite();
			winnerBackground.loadGraphic( rawWinner );
			winnerBackground.x = -50;
			add( winnerBackground );
		}
	}
}