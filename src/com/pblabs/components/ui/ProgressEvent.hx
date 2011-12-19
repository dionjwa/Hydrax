package com.pblabs.components.ui;

enum ProgressEvent {
	CLEAR_ALL_EVENTS;
	CLEAR_GROUP(taskGroup :String);
	/** Fired when a sub task is started. */
	TASK_STARTED(taskGroup :String, taskName :String);
	/** Fired when a sub task is complete. */
	TASK_COMPLETE(taskGroup :String, taskName :String);
	/** Manually set the progress of a task. */
	PROGRESS(taskId :String, text :String, fractionComplete :Float);
}

