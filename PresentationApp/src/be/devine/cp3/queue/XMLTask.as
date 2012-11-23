package be.devine.cp3.queue
{
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLTask extends URLLoader implements ITask{
		// variabelen
		private var url:String;
		private var urlLoad:URLLoader;
		private var xmlLoad:XML;
			
		// constructor
		public function XMLTask(url:String){
			
			this.url = url;
			
		}
		// functions
		public function start():void{
			
			urlLoad = new URLLoader();
			urlLoad.addEventListener( Event.COMPLETE, ldrCompleteHandler);
			urlLoad.load(new URLRequest( url ));
		}
		
		private function ldrCompleteHandler(e:Event):void{
			xmlLoad = new XML(e.target.data);
			trace(xmlLoad.image.url[0]);
		}
		
		// getters and setters
	}
	
	
}