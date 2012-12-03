/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 05/10/12
 * Time: 08:41
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.scrollBar {

import be.devine.cp3.view.OverviewComponent;

import flash.display.Shape;
import flash.events.Event;
import flash.geom.Point;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchPhase;

public class ScrollBar extends starling.display.Sprite{

    private var track:Quad;
    private var thumb:Quad;
    private var _thumbPosition:Number = 0;
    private var w:Number = 1024;
    private var h:Number = 15;

    //private var triangleShape2:Shape = new Shape();

    public function ScrollBar() {

        track = new Quad(w,h,0xffffff);
        track.y = 185;
        addChild(track);


        thumb = new Quad(60,15,0xa468a9);
        thumb.x = 32;
        thumb.y = 185;
        addChild(thumb);
        thumb.addEventListener(starling.events.TouchEvent.TOUCH, touchHandler);

    }

    private function touchHandler(e :starling.events.TouchEvent) : void
    {
        var touch:Touch = e.getTouch(stage);
        var position:Point = touch.getLocation(stage);
        var target:Quad = e.target as Quad;

        if(touch.phase == TouchPhase.MOVED ){
            this.thumbPosition = thumb.x / (track.width-thumb.width);
            thumb.x= position.x;
            if(thumb.x < 0)
            {
                thumb.x = 0;
            }
            if(thumb.x > 1024 - thumb.width)
            {
                thumb.x = 1024 - thumb.width;
            }

            thumb.y=185;
        }
    }



    public function get thumbPosition():Number {
        return _thumbPosition;
    }

    public function set thumbPosition(value:Number):void {
        if(_thumbPosition != value){
            _thumbPosition =value;
            thumb.x =_thumbPosition *(track.height -thumb.height);
            }
    }
}
}
