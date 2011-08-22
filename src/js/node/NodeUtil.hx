package js.node;

import com.pblabs.util.StringUtil;

import js.Node;

import js.node.Mime;

using Lambda;

using StringTools;

using com.pblabs.util.StringUtil;

class NodeUtil
{
	static var cd = "crossdomain.xml";
	
	public static function handleFileServed (filename :String, res :NodeHttpServerResp, ?encoding :String = "utf8") :Void
	{
		var mime :Mime = Node.require('mime');
		if (filename.startsWith('/')) {
			filename = filename.substr(1);
		}
		
		if (filename.isBlank()) {
			filename = "index.xhtml";
		}
		
		var headers = {};
		
		encoding = mime.lookup(filename);
		
		if (filename.endsWith(".svg")) {
			encoding = "text/plain";
		}
		
		//Without this, you get this error:
		//XMLHttpRequest cannot load http://localhost:8005/rsrc/anchors.svg. Origin null is not allowed by Access-Control-Allow-Origin.
		//http://stackoverflow.com/questions/3076414/ways-to-circumvent-the-same-origin-policy
		Reflect.setField(headers, "Access-Control-Allow-Origin", "*");
		
		Reflect.setField(headers, "Content-Type", encoding);
		// com.pblabs.util.Log.info(Date.now() + " handleFileServed=" + filename + "=>" + filename + ", Content-Type=" + Reflect.field(headers, "Content-Type"));
		Node.path.exists(filename, function(exists) {
			if(!exists) {
				com.pblabs.util.Log.error("file not found: " + filename);
				Reflect.setField(headers, "Content-Type", "text/plain");
				res.writeHead(404, headers);  
				res.write("404 Not Found\n");  
				res.end();  
				return;  
			} else {
				// com.pblabs.util.Log.info(" file found " + filename + " : " + encoding);
				Node.fs.readFile(filename,  function(err, file) {
					if (err != null) {
						Reflect.setField(headers, "Content-Type", "text/plain");
						res.writeHead(500, headers);  
						res.write(err + "\n");  
						res.end();  
						return;  
					}
					res.writeHead(200, headers);
					res.write(file, encoding);  
					res.end();  
				});
				#if debug
				Node.fs.stat(filename, function (err, stats) :Void {
					if (err != null) {
						com.pblabs.util.Log.error("Error stat'ing " + err);
					} else {
						// trace("mtime=" + stats.mtime);
						// trace("size=" + stats.size);
					}
				});
				#end
				
			}
		});
	}
	
	public static function handleCrossDomainRequest (req :NodeHttpServerReq, res :NodeHttpServerResp, ?crossDomainFilePath :String) :Bool
	{
		if (!req.url.endsWith(cd)) {
			return false;
		}
		crossDomainFilePath = crossDomainFilePath == null ? cd : crossDomainFilePath;
		com.pblabs.util.Log.debug("handle " + cd + " request");
		Node.path.exists(crossDomainFilePath, function(exists) {
			var headers = {};
			if(!exists) {
				com.pblabs.util.Log.error(crossDomainFilePath + " file not found");
				Reflect.setField(headers, "Content-Type", "text/plain");
				res.writeHead(404, headers);  
				res.write("404 Not Found\n");  
				res.end();  
				return;  
			} else {
				com.pblabs.util.Log.debug(crossDomainFilePath + " found");
				Reflect.setField(headers, "Content-Type", "text/x-cross-domain-policy");
				//Get the length.  Is this necesary?
				Node.fs.stat(crossDomainFilePath, function (err, stats :Stat) :Void {
					Reflect.setField(headers, "Content-Length", "" + stats.size);
					Node.fs.readFile(crossDomainFilePath, "utf8", function(err, file) {  
						if (err != null) {  
							res.writeHead(500, headers);  
							res.write(err + "\n");  
							res.end();  
							return;  
						} else {
							res.writeHead(200, headers);  
							res.write(file, "utf8");  
							res.end();
						}
					});
				});
			}
		});
		return true;
	}
	
	public static function getFileDataAsStringSync (path :String) :String
	{
		try {
			var fd = Node.fs.openSync(path, "r");
			var xml = Node.fs.readFileSync(path, "utf8");
			Node.fs.closeSync(fd);
			// trace("File " + path + " data:" + xml.substr(0, 10));
			return xml;
			
		} catch (e :Dynamic) {
			trace("Error reading file: " + path);
		}
		return "";
	}
	
	public static function saveFileDataSync (path :String, data :String) :Void
	{
		com.pblabs.util.Log.debug(["", "path", path, "data", data.substr(0, 10)]);
		var fs = Node.fs;
		try {
			var fd = Node.fs.openSync(path, "w");
			Node.fs.writeFileSync(path, data);
			Node.fs.closeSync(fd);
			
		} catch (e :Dynamic) {
			trace("Error writing file: " + path);
		}
	}
	
	public static function appendIfMissing (path :String, toAppend :String) :Void
	{
		com.pblabs.util.Log.debug(["", "path", path, "data", toAppend.substr(0, 10)]);
		var fs = Node.fs;
		try {
			var data :String = fs.readFileSync(path, "utf8");
			if (data.indexOf(toAppend) == -1) {
				data = data + "\n" + toAppend;
			}
			
			var fd = Node.fs.openSync(path, "w");
			Node.fs.writeFileSync(path, data);
			Node.fs.closeSync(fd);
			
		} catch (e :Dynamic) {
			trace("Error writing file: " + path);
		}
	}
	
	public static function traceMemory () :Void
	{
		var mem = Node.process.memoryUsage();
		trace("heap used (mb)=" + (mem.heapUsed / 1000000));
	}
	
	public static function mkdirs (path :String, mode :Int) :Void
	{
	    
	}
	
	public static function addLibraryPath () :Void
	{
	    var paths :Array<Dynamic> = untyped __js__("require.paths");
		//Add both the local and parent lib path, for production (former) and local debug (latter)
		for (pathToAdd in ["/usr/local/lib/node_modules", "lib/node_modules", "../lib/node_modules", "../../lib/node_modules"]) {
			if (!Lambda.has(paths, pathToAdd)) {
				paths.push(pathToAdd);
			}
		}
		trace(paths);
	}
	
	public static function removeFiles (files :Array<String>, cb :Dynamic->Void) :Void
	{
		files = files.copy();
		var delete = null; 
		delete = function () :Void {
			if (files.length == 0) {
				cb(true);
				return;
			}
			var file = files.pop();
			Node.path.exists(file, function (exists :Bool) :Void {
				if (exists) {
					Node.fs.unlinkSync(file);
				}
				delete();
			});
		}
		delete();
	}
	
	public static function justPrintExecErrors (error :Dynamic, stdout:Dynamic, stderr:Dynamic) :Void
	{
		if (error != null) {
			com.pblabs.util.Log.error(StringUtil.stringify(error));
		}
	}
}
