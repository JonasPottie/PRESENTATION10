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

import flash.display.Shape;
import flash.text.TextField;

import starling.animation.Transitions;

import starling.animation.Tween;

import starling.display.Quad;

import starling.display.Sprite;

public class OverviewComponent extends starling.display.Sprite{

    private var appModel:AppModel;
    private var scrollbar:ScrollBar;
    private var slidesContainer:Quad;
    private var xPosScroll:Number;
    private var scrollTween:Tween;


    public function OverviewComponent() {

        appModel = AppModel.getInstance();


        var overviewBackground:Quad = new Quad(1024,200, 0x343434);
        addChild(overviewBackground);

        scrollbar = new ScrollBar();
        scrollbar.x = 0;
        scrollbar.y = 0;
        addChild(scrollbar);

        slidesContainer = new Quad(504,100,0xFF00FF);
        //addChild(slidesContainer);
        overzichtTonen();

    }

    private function overzichtTonen():void {
        var xPos=60;

        for(var i:int=0 ; i<10; i++)
        {
            var miniSlide:Quad = new Quad(80,80, 0x4a4a4a);
            miniSlide.x = xPos;
            miniSlide.y = 30;
            addChild(miniSlide);
            xPos+=160;
        }

    }

    public function VersleepTextContainer():void
    {

        /*scrollTween = new Tween(slidesContainer,.5,Transitions.EASE_IN_OUT);
        scrollTween.animate("y",xPosScroll);
        Starling.juggler.add(scrollTween);*/
    }

}
}
