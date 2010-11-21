/**
 * Copyright (c) 2009-2010, The HSL Contributors.
 *
 * This file is part of HSL. HSL, pronounced "hustle", stands for haXe Signaling Library.
 *
 * HSL is free software. Redistribution and use in source and binary forms, with or without modification, are permitted
 * provided that the following conditions are met:
 *
 *   * Redistributions of source code must retain the above copyright notice, this list of conditions and the following
 *     disclaimer.
 *   * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following
 *     disclaimer in the documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HSL CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE HSL
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 * End of conditions.
 * 
 * The license of this software might change in the future, most likely to match the license of the haXe core libraries. In
 * such event, you may use this version of this software under either the terms above or under the terms of the new license of
 * this software.
 */
package hsl.avm2.plugins;
import flash.events.NetStatusEvent;
import flash.net.NetStream;
import flash.utils.TypedDictionary;
import hsl.avm2.data.NetStreamStatus;
import hsl.haxe.data.mathematics.Point;
import hsl.haxe.DirectSignaler;
import hsl.haxe.Signaler;

/**
 * Shortcuts for net streams.
 */
class NetStreamShortcuts {
	private static var clientVault:NetStreamClientVault;
	/**
	 * Gets a signaler that dispatches a signal when the dimensions of a video stream is determined. The dispatched signals
	 * contain the dimensions of the video stream. This method either creates a new signaler, or uses an existing one,
	 * depending on whether this method has been called before. If you call this method twice on the same object, the same
	 * signaler instance will be returned.
	 */
	public static inline function getDimensionsReceivedSignaler(nativeDispatcher:NetStream):Signaler<Point> {
		if (null == clientVault) {
			clientVault = new NetStreamClientVault();
		}
		return clientVault.getClient(nativeDispatcher).dimensionsReceivedSignaler;
	}
	/**
	 * Gets a signaler that dispatches signals when duration of a video stream is determined. The dispatched signals contain the
	 * duration in seconds. This method either creates a new signaler, or uses an existing one, depending on whether this method
	 * has been called before. If you call this method twice on the same object, the same signaler instance will be returned.
	 */
	public static inline function getDurationReceivedSignaler(nativeDispatcher:NetStream):Signaler<Float> {
		if (null == clientVault) {
			clientVault = new NetStreamClientVault();
		}
		return clientVault.getClient(nativeDispatcher).durationReceivedSignaler;
	}
	/**
	 * Gets a signaler that dispatches signals when a status has been reported by net stream is determined. The dispatched
	 * signals contain the associated status. This method either creates a new signaler, or uses an existing one, depending on
	 * whether this method has been called before. If you call this method twice on the same object, the same signaler instance
	 * will be returned.
	 */
	public static inline function getStatusReportedSignaler(nativeDispatch:NetStream):Signaler<NetStreamStatus> {
		if (null == clientVault) {
			clientVault = new NetStreamClientVault();
		}
		return clientVault.getClient(nativeDispatch).statusReportedSignaler;
	}
}
class NetStreamClientVault {
	private var clients:TypedDictionary<NetStream, NetStreamClient>;
	/**
	 * Creates a new net stream client vault.
	 */
	public function new():Void {
		clients = new TypedDictionary(false);
	}
	/**
	 * Gets a client for the passed native dispatcher. This method creates a new client if it cannot find one that has been
	 * created earlier.
	 */
	public function getClient(nativeDispatcher:NetStream):NetStreamClient {
		return
			// If a client for this native dispatcher already exists, return it.
			// This line should use the "exists" method, rather then the "get" method. However, "exists" in haXe 2.06 - which is the
			// latest stable haXe release - is buggy. It will be fixed in the next version, and the line below will be changed back
			// as soon as that version is released.
			if (null != clients.get(nativeDispatcher)) {
				clients.get(nativeDispatcher);
			// If there is no client for this native dispatcher, create it, add it and return it.
			} else {
				var result:NetStreamClient = new NetStreamClient(nativeDispatcher);
				// If the net stream already has a custom client defined, don't overwrite it. Use a double net stream client, so the
				// existing client is preserved.
				if (nativeDispatcher.client != nativeDispatcher || Reflect.hasField(nativeDispatcher.client, "onMetaData") || Reflect.hasField(nativeDispatcher.client, "onCuePoint")) {
					nativeDispatcher.client = new DoubleNetStreamClient(result, nativeDispatcher.client);
				} else {
					nativeDispatcher.client = result;
				}
				clients.set(nativeDispatcher, result);
				result;
			}
	}
}
class NetStreamClient {
	public var dimensionsReceivedSignaler(default, null):Signaler<Point>;
	public var durationReceivedSignaler(default, null):Signaler<Float>;
	//public var errorOccurredSignaler(default, null):Signaler<String>;
	private var netStream:NetStream;
	public var statusReportedSignaler(default, null):Signaler<NetStreamStatus>;
	public function new(netStream:NetStream):Void {
		dimensionsReceivedSignaler = new DirectSignaler(this);
		durationReceivedSignaler = new DirectSignaler(this);
		//errorOccurredSignaler = new DirectSignaler(this);
		statusReportedSignaler = new DirectSignaler(this);
		this.netStream = netStream;
		netStream.addEventListener(NetStatusEvent.NET_STATUS, translateNetStatusEvent);
	}
	public inline function onCuePoint(informationObject:Dynamic):Void {
	}
	public inline function onMetaData(informationObject:Dynamic):Void {
		if (null != informationObject.duration) {
			durationReceivedSignaler.dispatch(informationObject.duration, netStream);
		}
		if (null != informationObject.width && null != informationObject.height) {
			dimensionsReceivedSignaler.dispatch(new Point(informationObject.width, informationObject.height));
		}
	}
	private function translateNetStatusEvent(event:NetStatusEvent):Void {
		switch (event.info.level) {
			case "status":
			var status:NetStreamStatus =
				switch (event.info.code) {
					case "NetStream.Buffer.Empty":
					streamBufferEmpty;
					case "NetStream.Buffer.Full":
					streamBufferFull;
					case "NetStream.Buffer.Flush":
					streamBufferFlush;
					case "NetStream.Publish.Start":
					streamPublishStart;
					case "NetStream.Publish.Idle":
					streamPublishIdle;
					case "NetStream.Unpublish.Success":
					streamUnpublishSuccess;
					case "NetStream.Play.Start":
					streamPlayStart;
					case "NetStream.Play.Stop":
					streamPlayStop;
					case "NetStream.Play.Reset":
					streamPlayReset;
					case "NetStream.Play.PublishNotify":
					streamPlayPublishNotify;
					case "NetStream.Play.UnpublishNotify":
					streamPlayUnpublishNotify;
					case "NetStream.Pause.Notify":
					streamPauseNotify;
					case "NetStream.Unpause.Notify":
					streamUnpauseNotify;
					case "NetStream.Record.Start":
					streamRecordStart;
					case "NetStream.Record.Stop":
					streamRecordStop;
					case "NetStream.Seek.Notify":
					streamSeekNotify;
					case "NetConnection.Connect.Closed":
					connectionConnectClosed;
					case "NetConnection.Connect.Success":
					connectionConnectSuccess;
					case "SharedObject.Flush.Success":
					sharedObjectFlushSuccess;
				}
			statusReportedSignaler.dispatch(status, netStream);
			//case "error":
			//var error:NetStreamError =
				//switch (event.info.code) {
					//case "NetStream.Publish.BadName":
					//case "NetStream.Play.Failed":
					//case "NetStream.Play.StreamNotFound":
					//case "NetStream.Play.FileStructureInvalid":
					//case "NetStream.Play.NoSupportedTrackFound":
					//case "NetStream.Record.NoAccess":
					//case "NetStream.Record.Failed":
					//case "NetStream.Seek.Failed":
					//case "NetStream.Seek.InvalidTime":
					//case "NetConnection.Call.BadVersion":
					//case "NetConnection.Call.Failed":
					//case "NetConnection.Call.Prohibited":
					//case "NetConnection.Connect.Failed":
					//case "NetConnection.Connect.Rejected":
					//case "NetConnection.Connect.AppShutdown":
					//case "NetConnection.Connect.InvalidApp":
					//case "SharedObject.Flush.Failed":
					//case "SharedObject.BadPersistence":
					//case "SharedObject.UriMismatch":
				//}
			//statusReportedSignaler.dispatch(error, netStream);
		}
	}
}
/**
 * A special client used when another client is already defined, to make sure these shortcuts aren't breaking something.
 */
class DoubleNetStreamClient {
	private var firstClient:NetStreamClient;
	private var secondClient:Dynamic;
	public function new(firstClient:NetStreamClient, secondClient:Dynamic):Void {
		this.firstClient = firstClient;
		this.secondClient = secondClient;
	}
	public function onCuePoint(informationObject:Dynamic):Void {
		firstClient.onCuePoint(informationObject);
		secondClient.onCuePoint(informationObject);
	}
	public function onMetaData(informationObject:Dynamic):Void {
		firstClient.onMetaData(informationObject);
		secondClient.onMetaData(informationObject);
	}
}