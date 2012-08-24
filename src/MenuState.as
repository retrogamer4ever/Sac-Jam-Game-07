package
{
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;

	public class MenuState extends FlxState
	{
		[Embed(source="../data/openMenu.mp3")]  public var rawOpenMenuMusic:Class;
		[Embed(source="../effects/menu2.mp3")]  public var rawMenuClick:Class;
		
		[Embed(source="../data/startup.png")]   public var rawStartup:Class;
		[Embed(source="../data/cursor.png")]   public var cursor:Class;
		
		[Embed(source="../data/homesScreen.jpeg")]   public var rawHomeScreen:Class;
		
		
		public function MenuState()
		{
			
		}
		
		override public function create():void
		{
			var homeScreenBackground:FlxSprite = new FlxSprite();
			homeScreenBackground.loadGraphic( rawHomeScreen );
			add( homeScreenBackground );
			
			FlxG.playMusic( rawOpenMenuMusic );
			FlxG.mouse.show( cursor );
			var startButton:FlxButton = new FlxButton( 150, 120 );
			
			add( startButton );
			startButton.loadGraphic( rawStartup );
			startButton.onDown = function():void
			{
				var sound:FlxSound = new FlxSound();
				sound.loadEmbedded( rawMenuClick );
				sound.play();
				
				FlxG.switchState( new PlayState() );
			};
		}
	}
}