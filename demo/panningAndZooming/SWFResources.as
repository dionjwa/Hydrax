
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

    [Embed(source="rsrc/clockwise.svg", mimeType="application/octet-stream")]
    public static const CLOCKWISE :Class;

    [Embed(source="rsrc/counterclockwise.svg", mimeType="application/octet-stream")]
    public static const COUNTERCLOCKWISE :Class;

    [Embed(source="rsrc/down.svg", mimeType="application/octet-stream")]
    public static const DOWN :Class;

    [Embed(source="rsrc/face.png")]
    public static const FACE :Class;

    [Embed(source="rsrc/left.svg", mimeType="application/octet-stream")]
    public static const LEFT :Class;

    [Embed(source="rsrc/right.svg", mimeType="application/octet-stream")]
    public static const RIGHT :Class;

    [Embed(source="rsrc/up.svg", mimeType="application/octet-stream")]
    public static const UP :Class;

    [Embed(source="rsrc/zoomin.svg", mimeType="application/octet-stream")]
    public static const ZOOMIN :Class;

    [Embed(source="rsrc/zoomout.svg", mimeType="application/octet-stream")]
    public static const ZOOMOUT :Class;


	public function SWFResources()
	{
		super();

	}
}
}

