package be.devine.cp3.queue
{
import flash.events.Event;
import flash.events.EventDispatcher;

public class Queue extends EventDispatcher{
		// variabelen
		public var items:Array;
		public var completedItems:Array;
		
		private var loadedItemsCount:uint;
		private var totalItemsCount:uint;

		// constructor
		public function Queue(){
			items = new Array();
			completedItems = new Array();
			
			loadedItemsCount = 0;
			totalItemsCount = 0;
		}
		
		// functions
		public function add( pathToLoad:EventDispatcher ):void{
			items.push(pathToLoad);
			trace("Itempath (array): " + items );
			totalItemsCount++;
		}
		
		public function start():void{
			if(items.length>0){
				var task:ITask = items.shift();
				task.addEventListener( Event.COMPLETE, taskCompleteHandler );
				task.start();
				completedItems.push( task );
			}else{
			}
		}
		
		private function taskCompleteHandler(e:Event):void{
			dispatchEvent( new Event( Event.COMPLETE ) );
			start();
		}
		
		// getters and setters
	}
	
	
}