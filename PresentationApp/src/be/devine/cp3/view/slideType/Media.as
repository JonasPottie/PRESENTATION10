/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 29/11/12
 * Time: 10:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.slideType {

import be.devine.cp3.queue.ImageTask;
import be.devine.cp3.queue.Queue;

import flash.display.Bitmap;
import flash.events.Event;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;


public class Media extends starling.display.Sprite{

    private var media:String;
    private var mWidth:int;
    private var mHeight:int;

    private var queue:Queue

    public function Media(mediaUrl:String,mediaWidth:int, mediaHeight:int)
    {
        this.media = mediaUrl;
        this.mWidth = mediaWidth;
        this.mHeight = mediaHeight;

        queue = new Queue();
        queue.addEventListener( Event.COMPLETE, queueCompleteHandler );
        queue.add( new ImageTask(media));
        queue.start();



    }

    private function queueCompleteHandler(event:Event):void
    {
        for each (var task:ImageTask in queue.completedItems)
        {
            var image:Image = new Image(Texture.fromBitmap(task.content as Bitmap));

        }
    }
}
}
