/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 05/10/12
 * Time: 08:41
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.scrollBar {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

public class ScrollBar extends Sprite{

    private var track:Sprite =new Sprite();
    private var thumb:Sprite =new Sprite();
    private var up:Sprite =new Sprite();
    private var down:Sprite =new Sprite();
    private var _thumbPosition:Number = 0;
    private var w:Number = 20;
    private var h:Number = 300;

    private var triangleHeight:uint = 14;
    private var triangleShape:Shape = new Shape();
    private var triangleShape2:Shape = new Shape();

    public function ScrollBar() {

        track.graphics.beginFill(0x000000);
        track.graphics.drawRect(0,0,w,h);
        track.graphics.endFill();
        addChild(track);

        up.graphics.beginFill(0x000000);
        up.graphics.drawRect(0,-22,w,w);
        up.graphics.endFill();
        addChild(up);
        triangleShape.graphics.beginFill(0xCCCCCC);
        triangleShape.graphics.moveTo(triangleHeight/2, 5);
        triangleShape.graphics.lineTo(triangleHeight/2, 5);
        triangleShape.graphics.lineTo(triangleHeight, triangleHeight+5);
        triangleShape.graphics.lineTo(0, triangleHeight+5);
        triangleShape.x = 3;
        triangleShape.y = -25;
        up.addChild(triangleShape);

        down.graphics.beginFill(0x000000);
        down.graphics.drawRect(0,track.height+2,w,w);
        down.graphics.endFill();
        addChild(down);
        triangleShape2.graphics.beginFill(0xCCCCCC);
        triangleShape2.graphics.moveTo(triangleHeight/2, 5);
        triangleShape2.graphics.lineTo(triangleHeight/2, 5);
        triangleShape2.graphics.lineTo(triangleHeight, triangleHeight+5);
        triangleShape2.graphics.lineTo(0, triangleHeight+5);
        triangleShape2.x = 17;
        triangleShape2.y = track.height+25;
        triangleShape2.rotation = 180;
        down.addChild(triangleShape2);

        thumb.graphics.beginFill(0xCCCCCC);
        thumb.graphics.drawRect(0,0,w,w);
        thumb.graphics.endFill();
        thumb.x =0;
        thumb.y =0;
        addChild(thumb);
        thumb.addEventListener(MouseEvent.MOUSE_DOWN, downThumb);
        up.addEventListener(MouseEvent.CLICK, clickedUp);
        down.addEventListener(MouseEvent.CLICK, clickedDown);

    }

    private function clickedUp(event:MouseEvent):void {
        onDrag();
        thumbPosition = thumbPosition -.1;
        trace(thumbPosition + "is de thumbpos");
        if(thumbPosition<0){
            thumbPosition=0;
        }else{

        }
    }

    private function clickedDown(event:MouseEvent):void {
        onDrag();
        thumbPosition = thumbPosition +.1;
        trace(thumbPosition + "is de thumbpos");
        if(thumbPosition>1){
            thumbPosition=1;
        }else{

        }
    }

    private function upThumb(event:MouseEvent):void {
        thumb.stopDrag();
        stage.removeEventListener(MouseEvent.MOUSE_UP, upThumb);
        stage.removeEventListener(MouseEvent.MOUSE_UP, mouseMoveHandler);
    }

    private function downThumb(event:MouseEvent):void {
        stage.addEventListener(MouseEvent.MOUSE_UP, upThumb);
        stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoveHandler);
        thumb.startDrag(false, new Rectangle(0,0,0, h-w));
    }


    function mouseMoveHandler(event:MouseEvent)
    {
        onDrag();

    }

    private function onDrag():void {
        this.thumbPosition = thumb.y / (track.height-thumb.height);

    }


    public function get thumbPosition():Number {
        return _thumbPosition;
    }

    public function set thumbPosition(value:Number):void {
        if(_thumbPosition != value){
            _thumbPosition =value;
            thumb.y =_thumbPosition *(track.height -thumb.height);
            dispatchEvent(new Event(Event.CHANGE));

        }
    }
}
}
