package
{
	import flash.display.Sprite;
	
	import org.flixel.*;
	
	import org.flixel.FlxGame;
	
	[SWF(width="500", height="500", backgroundColor="#000000")]
	[Frame(FactoryClass="Preloader")]
	
	public class SacJam07 extends FlxGame
	{
		public function SacJam07()
		{
			super( 500, 500, MenuState );
		}
	}
}