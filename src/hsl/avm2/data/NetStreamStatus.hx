package hsl.avm2.data;

/**
 * The status of a net stream.
 */
enum NetStreamStatus {
	/**
	 * Data is not being received quickly enough to fill the buffer. Data flow will be interrupted until the buffer refills, at
	 * which time a streamBufferFull message will be sent and the stream will begin playing again.
	 */
	streamBufferEmpty;
	/**
	 * The buffer is full and the stream will begin playing.
	 */
	streamBufferFull;
	/**
	 * Data has finished streaming, and the remaining buffer will be emptied.
	 */
	streamBufferFlush;
	/**
	 * Publish was successful.
	 */
	streamPublishStart;
	/**
	 * The publisher of the stream is idle and not transmitting data.
	 */
	streamPublishIdle;
	/**
	 * The unpublish operation was successfuul.
	 */
	streamUnpublishSuccess;
	/**
	 * Playback has started.
	 */
	streamPlayStart;
	/**
	 * Playback has stopped.
	 */
	streamPlayStop;
	/**
	 * Caused by a play list reset.
	 */
	streamPlayReset;
	/**
	 * The initial publish to a stream is sent to all subscribers.
	 */
	streamPlayPublishNotify;
	/**
	 * An unpublish from a stream is sent to all subscribers.
	 */
	streamPlayUnpublishNotify;
	/**
	 * The stream is paused.
	 */
	streamPauseNotify;
	/**
	 * The stream is resumed.
	 */
	streamUnpauseNotify;
	/**
	 * Recording has started.
	 */
	streamRecordStart;
	/**
	 * Recording stopped.
	 */
	streamRecordStop;
	/**
	 * The seek operation is complete.
	 */
	streamSeekNotify;
	/**
	 * The connection was closed successfully.
	 */
	connectionConnectClosed;
	/**
	 * The connection attempt succeeded.
	 */
	connectionConnectSuccess;
	/**
	 * The "pending" status is resolved and the SharedObject.flush() call succeeded.
	 */
	sharedObjectFlushSuccess;
}