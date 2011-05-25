package js.externs;
/**
  * Extern for node-user-agent
  * https://github.com/3rd-Eden/node-useragent
  */
typedef Browser = {
	var version :String;
	var webkit :Bool;
	var opera :Bool;
	var ie :Bool;
	var firefox :Bool;
	var chrome :Bool;
	var safari :Bool;
	var mobile_safari :Bool;
}

typedef Results = {
	var match :Bool;
	var family :String;
	var V1 :Dynamic;
	var V2 :Dynamic;
	var V3 :Dynamic;
}

typedef UserAgent = {
	function parser (s :String) :Results;
	function browser (s :String) :Browser;
}
