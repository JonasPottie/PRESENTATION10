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
import be.devine.cp3.service.XMLLoadedService;
import be.devine.cp3.vo.PageVO;
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
    private var xmlloadedSer:XMLLoadedService;
    private var scrollbar:ScrollBar;
    public var pageContainer:Sprite;
    private var page:Page;
    private var overviewBackground:Quad;
    private var tween:Tween;

    public function OverviewComponent() {

        appModel = AppModel.getInstance();
        overviewBackground = new Quad(appModel.stageWidth,200, 0X333333);
        overviewBackground.alpha = .8;
        addChild(overviewBackground);

        scrollbar = new ScrollBar();
        scrollbar.x = 0;
        scrollbar.y = 0;
        addChild(scrollbar);

        pageContainer = new Sprite();
        addChild(pageContainer);
        overzichtTonen();

        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);
        appModel.addEventListener(AppModel.CURRENT_SLIDE_CHANGED, slideChangeHandler);


    }


    public function overzichtTonen():void
    {
        var xPos:int=0;

        pageContainer.alpha=.8;
        pageContainer.x = ((appModel.stageWidth/2) - 125) + (appModel.currentSlideIndex * -235);
        pageContainer.y = 15;

        for each(var pageVO:PageVO in appModel.pages)
        {
            page = new Page(pageVO);
            page.x = xPos;
            page.scaleX = 0.2;
            page.scaleY = 0.2;
            page.addEventListener(starling.events.TouchEvent.TOUCH,thumbNailHandler);
            pageContainer.addChild(page);
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

    public function verwijderInhoud():void{
        trace("verijwder inhoud");
    }

    private function thumbNailHandler(event:starling.events.TouchEvent):void
    {
        var touch:Touch = event.getTouch(event.currentTarget as Page);


        if(touch != null)
        {
            Mouse.cursor = MouseCursor.BUTTON;

            switch (touch.phase)
            {
                case TouchPhase.ENDED:

                    var currentPage:Page = event.currentTarget as Page;
                    appModel.currentSlideIndex = currentPage.pageIndex;

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
