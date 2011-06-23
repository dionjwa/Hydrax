
package
{
import flash.display.Sprite;


/**
 * Holder class for embedded assets to create a swf that's downloaded by the main swf, instead
 * of having to download all the individual sounds.
 *
 */
[SWF( backgroundColor='0xFFFFFF', frameRate='30', width='200', height='200')] 
public class SWFResources extends Sprite
{

    [Embed(source="rsrc/face.png")]
    public static const FACE :Class;


	public function SWFResources()
	{
		super();

	}
}
}

