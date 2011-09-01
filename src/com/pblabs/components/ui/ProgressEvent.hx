package com.pblabs.components.ui;

enum ProgressEvent {
	CLEAR_ALL_EVENTS;
	CLEAR_GROUP(taskGroup :String);
	TASK_STARTED(taskGroup :String, taskName :String);
	TASK_COMPLETE(taskGroup :String, taskName :String);
}
