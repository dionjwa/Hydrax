/*******************************************************************************
 * Hydrax: haXe port of the PushButton Engine
 * Copyright (C) 2010 Dion Amago
 * For more information see http://github.com/dionjwa/Hydrax
 *
 * This file was derived from the equivalent actionscript PushButton Engine 
 * source file:
 * http://code.google.com/p/pushbuttonengine/
 *
 * This file is licensed under the terms of the MIT license, which is included
 * in the License.html file at the root directory of this SDK.
 ******************************************************************************/
package com.pblabs.engine.debug;

#if profiler
import com.pblabs.util.Assert;
import com.pblabs.util.MathUtil;
import com.pblabs.util.Sprintf;
import com.pblabs.util.ds.Map;
import com.pblabs.util.ds.Maps;
using com.pblabs.util.NumberUtil;

/**
 * Modified version of the PBE Profiler to fit OOO logging.
 *
 * Simple, static hierarchical block profiler.
 *
 * Currently it is hardwired to start measuring when you press P, and dump
 * results to the log when you let go of P. Eventually something more
 * Intelligent will be appropriate.
 *
 * Use it by calling Profiler.enter("CodeSectionName"); before the code you
 * wish to measure, and Profiler.exit("CodeSectionName"); afterwards. Note
 * that Enter/Exit calls must be matched - and if there are any branches, like
 * an early return; statement, you will need to add a call to Profiler.exit()
 * before the return.
 *
 * Min/Max/Average times are reported in milliseconds, while total and non-sub
 * times (times including children and excluding children respectively) are
 * reported in percentages of total observed time.
 */
 
class Profiler
{
	public static var indentAmount :Int = 3;
	public static var nameFieldWidth :Int = 80;
	
	/**
	 * Call this outside of all Enter/Exit calls to make sure that things
	 * have not gotten unbalanced. If all enter'ed blocks haven't been
	 * exit'ed when this function has been called, it will give an error.
	 *
	 * Useful for ensuring that profiler statements aren't mismatched.
	 */
	public static function ensureAtRoot () :Void
	{
		if (_stackDepth > 0)
			throw "Not at root!";
	}

	/**
	 * Indicate we are entering a named execution block.
	 */
	public static function enter (blockName :String) :Void
	{
		if (_currentNode == null) {
			_rootNode = new ProfileInfo("Root");
			_currentNode = _rootNode;
		}

		// If we're at the root then we can update our Internal enabled state.
		if (_stackDepth == 0) {

			if (_wantWipe) {
				doWipe();
			}

			if (_wantReport) {
				doReport();
			}
		}

		// Update stack depth and early out.
		_stackDepth++;

		// Look for child; create if absent.
		var newNode :ProfileInfo = _currentNode.children.get(blockName);
		if (newNode == null) {
			newNode = new ProfileInfo(blockName, _currentNode);
			_currentNode.children.set(blockName, newNode);
		}

		// Push onto stack.
		_currentNode = newNode;

		// Start timing the child node. Too bad you can't QPC from Flash. ;)
		_currentNode.startTime = Std.int(haxe.Timer.stamp() * 1000);//flash.Lib.getTimer();
	}

	/**
	 * Indicate we are exiting a named exection block.
	 */
	public static function exit (blockName :String) :Void
	{
		// Update stack depth and early out.
		_stackDepth--;

		if (blockName != _currentNode.name){
			throw "Mismatched Profiler.enter/Profiler.exit calls, got '" + _currentNode.name + "' but was expecting '" + blockName + "'";
		}

		// Update stats for this node.
		var elapsedTime :Int = Std.int(haxe.Timer.stamp() * 1000) - _currentNode.startTime;
		_currentNode.activations++;
		_currentNode.totalTime += elapsedTime;
		if (elapsedTime > _currentNode.maxTime) {
			_currentNode.maxTime = elapsedTime;
		}
		if (elapsedTime < _currentNode.minTime) {
			_currentNode.minTime = elapsedTime;
		}

		// Pop the stack.
		_currentNode = _currentNode.parent;
	}

	/**
	 * Dumps statistics to the log next time we reach bottom of stack.
	 */
	public static function report () :Void
	{
		if (_stackDepth != 0) {
			_wantReport = true;
			return;
		}

		doReport();
	}

	/**
	 * Reset all statistics to zero.
	 */
	public static function wipe () :Void
	{
		if (_stackDepth != 0) {
			_wantWipe = true;
			return;
		}

		doWipe();
	}

	static function doReport () :Void
	{
		_wantReport = false;
		Assert.isNotNull(_rootNode);
		var header = "\n" + Sprintf.format("%-" + nameFieldWidth + "s%-8s%-8s%-8s%-8s%-8s%-8s", ["name",
		"Calls", "Total%", "NonSub%", "AvgMs", "MinMs", "MaxMs"]);
		
		var report = header + report_R(_rootNode, 0);
		trace(report);
		_wantWipe = true;
	}

	static function doWipe (pi :ProfileInfo = null) :Void
	{
		_wantWipe = false;

		if (pi == null) {
			doWipe(_rootNode);
			return;
		}

		pi.wipe();
		for (childPi in pi.children)
			doWipe(childPi);
	}

	static function report_R (pi :ProfileInfo, indent :Int) :String
	{
		Assert.isNotNull(pi);
		var s = "";
		// Figure our display values.
		var selfTime :Float = pi.totalTime;
		// Assert.isTrue(!Math.isNaN(selfTime));
		var hasKids = false;
		var totalTime :Float = 0;
		for (childPi in pi.children) {
			hasKids = true;
			selfTime -= childPi.totalTime;
			totalTime += childPi.totalTime;
		}
		// Fake it if we're root.
		if (pi.name == "Root") {
			pi.totalTime = Std.int(totalTime);
		}

		var displayTime = -1.0;
		if (pi.parent != null) {
			displayTime = (pi.totalTime * 1.0) / _rootNode.totalTime * 100;
		}
		var displayNonSubTime = -1.0;
		if (pi.parent != null) {
			displayNonSubTime = selfTime / _rootNode.totalTime * 100;
		}
		// PrInt us.
		var entry :String =
		if (indent == 0) {
			"\n+Root";
		} else {
			"\n" + Sprintf.format("%-" + (indent * indentAmount) + "s%-" + (nameFieldWidth - indent *
				indentAmount) + "s%-8i%-8.2f%-8.2f%-8.2f%-8.2f%-8.2f", ["", (hasKids ? "+" : "-") + pi.name,
				pi.activations, displayTime, displayNonSubTime,
				pi.totalTime / pi.activations, pi.minTime, pi.maxTime]);
		}
		s += entry;

		// Sort and draw our kids.
		var tmpArray = new Array<ProfileInfo>();
		for (childPi in pi.children) {
			tmpArray.push(childPi);
		}
		
		tmpArray.sort(function (p1 :ProfileInfo, p2 :ProfileInfo) :Int {
			return p1.totalTime > p2.totalTime ? -1 : 1;
		});
		for (childPi in tmpArray) {
			s += report_R(childPi, indent + 1);
		}
		
		return s;
	}

	public static function bindToKey () :Void
	{
		#if (flash || cpp)
		if (!_bound) {
			_bound = true;
			flash.Lib.current.stage.addEventListener(flash.events.KeyboardEvent.KEY_DOWN, function (keyEvent :flash.events.KeyboardEvent) :Void {
				if (keyEvent.keyCode == com.pblabs.engine.input.InputKey.P.keyCode) {
					trace("calling report");
					Profiler.report();
				}
			});
		}
		#end    
	}
	
	
	static var _currentNode :ProfileInfo;
	static var _rootNode :ProfileInfo;
	static var _stackDepth :Int = 0;
	static var _wantReport :Bool = false;
	static var _wantWipe :Bool = false;
	
	static var _bound :Bool = false;
}

class ProfileInfo
{
	public var children :Map<String, ProfileInfo>;
	public var maxTime :Int;
	public var minTime :Int;
	public var name :String;
	public var parent :ProfileInfo;

	public var startTime :Int; 
	public var totalTime :Int;
	public var activations :Int;

	public function new (n :String, ?p :ProfileInfo)
	{
		children = Maps.newHashMap(String);
		name = n;
		parent = p;
		wipe();
	}
	
	public function wipe () :Void
	{
		startTime = totalTime = activations = 0;
		maxTime = MathUtil.INT32_MIN;
		minTime = MathUtil.INT32_MAX;
	}
	
	public function print (indent :Int) :Void
	{
		var s = "";
		for (i in 0...indent) {
			s += " ";
		}
		s += name;
		for (c in children) {
			c.print(indent + 1);
		}
	}
}

#else
#if !cpp extern #end 
class Profiler
{
	public static var indentAmount :Int = 3;
	public static var nameFieldWidth :Int = 70;

	/**
	 * Call this outside of all Enter/Exit calls to make sure that things
	 * have not gotten unbalanced. If all enter'ed blocks haven't been
	 * exit'ed when this function has been called, it will give an error.
	 *
	 * Useful for ensuring that profiler statements aren't mismatched.
	 */
	inline public static function ensureAtRoot () :Void {}

	/**
	 * Indicate we are entering a named execution block.
	 */
	inline public static function enter (blockName :String) :Void {}

	/**
	 * Indicate we are exiting a named exection block.
	 */
	inline public static function exit (blockName :String) :Void {}

	/**
	 * Dumps statistics to the log next time we reach bottom of stack.
	 */
	inline public static function report () :Void {}

	/**
	 * Reset all statistics to zero.
	 */
	inline public static function wipe () :Void {}
	
	inline public static function bindToKey () :Void {}
	
}
#end
