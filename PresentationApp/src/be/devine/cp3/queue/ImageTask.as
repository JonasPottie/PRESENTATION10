package be.devine.cp3.queue
{
import flash.display.Bitmap;
import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.net.URLRequest;

public class ImageTask extends Loader implements ITask{
		// variabelen
		private var url:String;
		private var loadedImage:Bitmap;
		
		// constructor
		public function ImageTask(url:String){
			
			this.url = url;
			
		}
		// functions
		public function start():void{
			this.contentLoaderInfo.addEventListener( Event.COMPLETE, ldrCompleteHandler);
			this.load( new URLRequest(url) );
		}
		
		private function ldrCompleteHandler(e:Event):void{
			var ldrInfo:LoaderInfo = e.currentTarget as LoaderInfo
			loadedImage = Bitmap(ldrInfo.content);
			dispatchEvent( new Event(Event.COMPLETE) );
		}
		
		// getters and setters
	}
	
	
}