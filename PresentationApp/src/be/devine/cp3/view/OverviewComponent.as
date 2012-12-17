/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 26/11/12
 * Time: 11:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.scrollBar.ScrollBar;
import flash.events.Event;
import flash.ui.Mouse;
import flash.ui.MouseCursor;
import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;


public class OverviewComponent extends Sprite{

    private var appModel:AppModel;
    private var ovc:OverviewComponent;
    private var scrollbar:ScrollBar;
    public var pageContainer:Sprite;
    private var page:Page;
    private var overviewBackground:Quad;
    private var tween:Tween;
    private var thumbNail:ThumbNail;

    public function OverviewComponent() {

        appModel = AppModel.getInstance();

        overviewBackground = new Quad(appModel.stageWidth,200, 0X1e4a5b);
        overviewBackground.alpha = 1;
        addChild(overviewBackground);

        scrollbar = new ScrollBar();
        scrollbar.x = 0;
        scrollbar.y = 0;
        addChild(scrollbar);


        overzichtTonen();

        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);
        appModel.addEventListener(AppModel.CURRENT_SLIDE_CHANGED, slideChangeHandler);



    }


    public function overzichtTonen():void
    {
        pageContainer = new Sprite();
        addChild(pageContainer);

        var xPos:int=0;

        pageContainer.alpha=.8;
        pageContainer.x = ((appModel.stageWidth/2) - 125) + (appModel.currentSlideIndex * -235);
        pageContainer.y = 15;

        for (var i:uint = 0; i < appModel.pages.length; i++) {
            thumbNail = new ThumbNail(i);
            thumbNail.x = xPos;
            thumbNail.addEventListener(starling.events.TouchEvent.TOUCH,thumbNailHandler);
            pageContainer.addChild(thumbNail);

            xPos += 235;
        }
            appModel.addEventListener(AppModel.THUMB_POS_CHANGED, thumbDragHandler);

    }



    private function thumbDragHandler(event:Event):void
    {
        tween = new Tween(pageContainer,.1,Transitions.EASE_IN_OUT);
        tween.animate("x",-appModel.thumbPosition*(pageContainer.width - appModel.stageWidth));
        Starling.juggler.add(tween);

    }

    private function stageChangeHandler(event:Event):void
    {
      overviewBackground.width = appModel.stageWidth;
    }

    private function slideChangeHandler(event:Event):void
    {
        tween = new Tween(pageContainer,.5,Transitions.EASE_IN_OUT);
        tween.animate("x",((appModel.stageWidth/2) - 125) + (appModel.currentSlideIndex * -235));
        Starling.juggler.add(tween);
    }


    private function thumbNailHandler(event:starling.events.TouchEvent):void
    {
        var touch:Touch = event.getTouch(event.currentTarget as ThumbNail);


        if(touch != null)
        {
            Mouse.cursor = MouseCursor.BUTTON;

            switch (touch.phase)
            {
                case TouchPhase.ENDED:

                    var currentPage:ThumbNail = event.currentTarget as ThumbNail;
                    var previousSlideIndex:int = appModel.currentSlideIndex;

                    if(previousSlideIndex<currentPage.slideIndex)
                    {
                      appModel.slideDirection = "right"
                    }
                    else
                    {
                        appModel.slideDirection = "left"
                    }
                    appModel.currentSlideIndex = currentPage.slideIndex;

                break;
            }
        }
        else
        {
            Mouse.cursor = MouseCursor.ARROW;
        }
    }

}
}
