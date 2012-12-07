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
import be.devine.cp3.vo.PageVO;

import flash.events.Event;

import flash.events.TouchEvent;

import starling.animation.Transitions;

import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Quad;

import starling.display.Sprite;


public class OverviewComponent extends Sprite{

    private var appModel:AppModel;
    private var scrollbar:ScrollBar;
    private var pageContainer:Sprite;
    private var page:Page;

    private var overviewBackground:Quad;

    private var tween:Tween;

    public function OverviewComponent() {

        appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);

        overviewBackground = new Quad(appModel.stageWidth,200, 0X333333);
        addChild(overviewBackground);

        scrollbar = new ScrollBar();
        scrollbar.x = 0;
        scrollbar.y = 0;
        addChild(scrollbar);

        pageContainer = new Sprite();
        addChild(pageContainer);
        overzichtTonen();

    }



    private function overzichtTonen():void 
    {
        var xPos:int=0;

        pageContainer.alpha=.8;
        pageContainer.x = 50;
        pageContainer.y = 15;

        for each(var pageVO:PageVO in appModel.pages)
        {
            var q:Quad = new Quad(220,160,0xea655c);
            q.x = xPos;
            pageContainer.addChild(q);

            page = new Page(pageVO);
            page.x = xPos;
            page.scaleX = 0.2;
            page.scaleY = 0.2;
            pageContainer.addChild(page);
            xPos += 250;
        }

            pageContainer.addEventListener(TouchEvent.TOUCH_BEGIN, clickHandler);
            appModel.addEventListener(AppModel.THUMB_POS_CHANGED, thumbDragHandler);

    }

    private function clickHandler(event:TouchEvent):void {

    }

    private function thumbDragHandler(event:Event):void
    {
        pageContainer.x = -appModel.thumbPosition*(pageContainer.width - appModel.stageWidth);


    }

    private function stageChangeHandler(event:Event):void
    {
      overviewBackground.width = appModel.stageWidth;
    }
}
}
