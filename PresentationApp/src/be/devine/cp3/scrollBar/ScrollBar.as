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
import flash.events.Event;
import flash.geom.Point;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchPhase;


public class ScrollBar extends starling.display.Sprite{

    public static const THUMB_POS_CHANGED:String = "THUMB_POS_CHANGED";
    private var track:Quad;
    private var thumb:Quad;
    private var up:Quad;
    private var down:Quad;
    private var _thumbPosition:Number = 0;
    private var w:Number = 960;
    private var h:Number = 20;
    private var ovc:OverviewComponent;

    private var triangleHeight:uint = 14;
    private var triangleShape:Shape = new Shape();
    //private var triangleShape2:Shape = new Shape();

    public function ScrollBar() {

        track = new Quad(w,h,0x000000);
        track.x = 32;
        track.y = 180;
        addChild(track);

        up = new Quad(h,h,0xCCC);
        up.x =  6;
        up.y =  180;
        addChild(up);

        down = new Quad(h, h,0x00FF00);
        down.x =  998;
        down.y =  180;
        addChild(down);

        /*triangleShape.graphics.beginFill(0xCCCCCC);
        triangleShape.graphics.moveTo(triangleHeight/2, 5);
        triangleShape.graphics.lineTo(triangleHeight/2, 5);
        triangleShape.graphics.lineTo(triangleHeight, triangleHeight+5);
        triangleShape.graphics.lineTo(0, triangleHeight+5);
        triangleShape.x = 3;
        triangleShape.y = -25;
        addChild(triangleShape);


        triangleShape2.graphics.beginFill(0xCCCCCC);
        triangleShape2.graphics.moveTo(triangleHeight/2, 5);
        triangleShape2.graphics.lineTo(triangleHeight/2, 5);
        triangleShape2.graphics.lineTo(triangleHeight, triangleHeight+5);
        triangleShape2.graphics.lineTo(0, triangleHeight+5);
        triangleShape2.x = 17;
        triangleShape2.y = track.height+25;
        triangleShape2.rotation = 180;
        down.addChild(triangleShape2);*/

        thumb = new Quad(20,20,0xFF0000);
        thumb.x = 32;
        thumb.y = 180;
        addChild(thumb);

        //thumb.addEventListener(MouseEvent.MOUSE_DOWN, downThumb);
        /*up.addEventListener(MouseEvent.CLICK, clickedUp);
        down.addEventListener(MouseEvent.CLICK, clickedDown);*/
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
            if(thumb.x < 32)
            {
                thumb.x = 32;
            }
            if(thumb.x > 972)
            {
                thumb.x = 972;
            }

            thumb.y=180;
        }
    }



    public function get thumbPosition():Number {
        return _thumbPosition;
    }

    public function set thumbPosition(value:Number):void {
        if(_thumbPosition != value){
            _thumbPosition =value;
            thumb.x =_thumbPosition *(track.height -thumb.height);
            ovc = new OverviewComponent();
            ovc.VersleepTextContainer(_thumbPosition);
            //dispatchEvent(new Event(Event.CHANGE));
            }
    }
}
}
