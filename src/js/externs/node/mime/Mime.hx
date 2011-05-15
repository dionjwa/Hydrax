package js.externs.node.mime;
/**
  * Extern for node-mime
  * https://github.com/bentomas/node-mime
  */

typedef Mime = {
	function lookup (filename :String) :String;
	function extension (mimeType :String) :String;
}
