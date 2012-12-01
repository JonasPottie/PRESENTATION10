/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 26/11/12
 * Time: 11:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.model.PageVo;
import be.devine.cp3.scrollBar.ScrollBar;
import be.devine.cp3.view.slideType.Title;

import flash.display.Shape;
import flash.events.MouseEvent;
import flash.text.TextField;

import starling.animation.Transitions;

import starling.animation.Tween;

import starling.display.Quad;

import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class OverviewComponent extends starling.display.Sprite{

    private var appModel:AppModel;
    private var scrollbar:ScrollBar;
    private var slidesContainer:Quad;
    private var xPosScroll:Number;
    private var scrollTween:Tween;
    private var pageVO:PageVo;


    public function OverviewComponent() {

        appModel = AppModel.getInstance();

        var overviewBackground:Quad = new Quad(1024,200, 0x000000);
        overviewBackground.alpha = 0.9;
        addChild(overviewBackground);

        scrollbar = new ScrollBar();
        scrollbar.x = 0;
        scrollbar.y = 0;
        addChild(scrollbar);

        slidesContainer = new Quad(504,100,0xFF00FF);
        overzichtTonen();

    }



    private function overzichtTonen():void {
        var xPos=10;

        for(var i:int=0 ; i<appModel.pages.length; i++)
        {
            var miniSlide:Quad = new Quad(215,160, 0x4a4a4a);
            miniSlide.x = xPos;
            miniSlide.y = 10;
            addChild(miniSlide);

            trace("slide is: "+appModel.pages[i].title);

            pageVO = new PageVo();
            var title:Title;

            var minislideContainer:Sprite = new Sprite();
            addChild(minislideContainer);
            minislideContainer.scaleX=.4;
            minislideContainer.scaleY=.4;
            minislideContainer.alpha=.7;
            minislideContainer.x = xPos+5;
            minislideContainer.y = 15;

            var slide:PageVo =  appModel.pages[i];

            title = new Title(slide.title,slide.titleProp[2],slide.titleProp[3],slide.titleProp[4]);
            minislideContainer.addChild(title);

            xPos+= miniSlide.width + 20;

            minislideContainer.addEventListener(TouchEvent.TOUCH, clickHandler);
        }


    }

    private function clickHandler(e:TouchEvent):void {
        //trace("clicked on a minislideContianer.."+ (e.target.));
        //currentImage = _images.indexOf(event.currentTarget,0);
    }

    public function VersleepTextContainer():void
    {

        /*scrollTween = new Tween(slidesContainer,.5,Transitions.EASE_IN_OUT);
        scrollTween.animate("y",xPosScroll);
        Starling.juggler.add(scrollTween);*/
    }

}
}
