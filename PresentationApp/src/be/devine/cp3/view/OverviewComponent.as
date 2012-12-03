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

import flash.events.TouchEvent;

import starling.animation.Tween;
import starling.display.Quad;

import starling.display.Sprite;


public class OverviewComponent extends Sprite{

    private var appModel:AppModel;
    private var scrollbar:ScrollBar;
    private var pageContainer:Sprite;
    private var page:Page;
    
    private var xPosScroll:Number;
    private var scrollTween:Tween;
    private var pageVO:PageVO;


    public function OverviewComponent() {

        appModel = AppModel.getInstance();

        var overviewBackground:Quad = new Quad(1024,200, 0x000000);
        overviewBackground.alpha = 0.9;
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
        var xPos=0;

        pageContainer.alpha=.7;
        pageContainer.x = 50;
        pageContainer.y = 15;

        for each(var pageVO:PageVO in appModel.pages)
        {
            var q:Quad = new Quad(220,150,0xaaaaaa)
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

    }

    private function clickHandler(event:TouchEvent):void {

    }
}
}
