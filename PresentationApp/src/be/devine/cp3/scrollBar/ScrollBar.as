/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 05/10/12
 * Time: 08:41
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.scrollBar {

import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.OverviewComponent;

import flash.display.Shape;
import flash.events.Event;
import flash.geom.Point;
import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class ScrollBar extends Sprite{

    private var track:Quad;
    private var thumb:Quad;
    private var _thumbPosition:Number = 0;
    private var appModel:AppModel;

    //private var triangleShape2:Shape = new Shape();

    public function ScrollBar() {

        this.appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);

        track = new Quad(appModel.stageWidth,15,0xffffff);
        track.y = 185;
        addChild(track);


        thumb = new Quad(60,15,0xa468a9);
        thumb.x = 32;
        thumb.y = 185;
        addChild(thumb);
        thumb.addEventListener(TouchEvent.TOUCH, touchHandler);

    }

    private function touchHandler(e :TouchEvent) : void
    {
        var touch:Touch = e.getTouch(stage);
        var position:Point = touch.getLocation(stage);
        var target:Quad = e.target as Quad;

        if(touch.phase == TouchPhase.MOVED ){
            appModel.thumbPosition= thumb.x / (track.width-thumb.width);
            thumb.x= position.x;
            if(thumb.x < 0)
            {
                thumb.x = 0;
            }
            if(thumb.x > appModel.stageWidth - thumb.width)
            {
                thumb.x = appModel.stageWidth - thumb.width;
            }

            thumb.y=185;
        }
    }


    private function stageChangeHandler(event:flash.events.Event):void
    {
        track.width = appModel.stageWidth;
        thumb.x = 0;
    }
}
}
