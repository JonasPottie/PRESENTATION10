/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 23/11/12
 * Time: 12:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import be.devine.cp3.queue.ITask;
import be.devine.cp3.queue.ImageTask;
import be.devine.cp3.queue.Queue;
import be.devine.cp3.queue.XMLTask;

import com.greensock.TweenLite;

import flash.display.DisplayObject;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.text.TextField;

[SWF(backgroundColor="#00FF00")]


public class Application extends Sprite{

    private var q:Queue;

    public function Application() {

        trace("[appl CONSTRUCTED]");
        q = new Queue();

        q.addEventListener( ProgressEvent.PROGRESS, queueProgressHandler );
        q.addEventListener( Event.COMPLETE, queueCompleteHandler );
        q.add( new XMLTask("assets/xml/presentation.xml") );
        //q.add( new ImageTask("assets/images/1.JPG") );
        //q.add( new ImageTask("assets/images/2.JPG") );
        q.start();

    }


    private function queueProgressHandler( e:ProgressEvent ):void{
        trace("loaded " + e.bytesLoaded + " files from " + e.bytesTotal );
    }

    private function queueCompleteHandler( e:Event ):void{
        trace("queue complete");
        trace(q.completedItems);
        for each( var task:ITask in q.completedItems ){
            if( task is ImageTask ){
                var image:DisplayObject = DisplayObject( task );
                TweenLite.to( image, 2, { scaleX:0.5, scaleY:0.5, x:Math.random()*stage.stageWidth/2, y:Math.random()*stage.stageHeight/2 } );
                addChild( image );
                trace("add image");
            }
            if( task is XMLTask ){
                var xmlimage:DisplayObject = DisplayObject(task);
                addChild(xmlimage);
                var txtfield:TextField = new TextField();
                txtfield.text="hallo";
                addChild(txtfield);
                trace("[TASK trace]");

            }
        }
    }

}
}
