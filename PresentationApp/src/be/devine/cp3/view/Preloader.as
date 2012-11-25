package be.devine.cp3.view
{
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class Preloader extends Sprite
	{
		
		private var _progress:Number = 0;

		public function get progress():Number
		{
			return _progress;
		}

		public function set progress(value:Number):void
		{
			if(_progress != value)
			{
				_progress = value;
				balk.scaleX = _progress;
				percentageField.x = balk.width + 2;
				percentageField.text = Math.floor(_progress * 100) + "%";
				dispatchEvent(new Event(Event.CHANGE));
			}
		}
		
		private var balk:Shape;
		private var percentageField:TextField;
		
		public function Preloader()
		{
			balk = new Shape();
			balk.scaleX = _progress;
			balk.graphics.beginFill(0xFFFFFF);
			balk.graphics.drawRect(0, 0, 1, 2);
			balk.graphics.endFill();
			addChild(balk);
			
			percentageField = new TextField();
			percentageField.defaultTextFormat = new TextFormat("Helvetica Neue", 12, 0xFFFFFF);
			percentageField.embedFonts = true;
			percentageField.autoSize = TextFieldAutoSize.LEFT;
			percentageField.selectable = false;
			percentageField.x = balk.width + 2;
			percentageField.text = Math.floor(_progress * 100) + "%";
			addChild(percentageField);
			
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		private function addedToStageHandler(event:Event):void
		{
			stage.addEventListener(Event.RESIZE, drawBalk);
			drawBalk();
		}
		
		private function drawBalk(event:Event = null):void
		{
			balk.graphics.beginFill(0xFFFFFF);
			balk.graphics.drawRect(0, 0, stage.stageWidth, 2);
			balk.graphics.endFill();
		}
	}
}