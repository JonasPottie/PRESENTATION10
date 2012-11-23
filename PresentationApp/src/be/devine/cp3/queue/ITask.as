package be.devine.cp3.queue
{
import flash.events.IEventDispatcher;

public interface ITask extends IEventDispatcher
	{
		function start():void;
	}
}