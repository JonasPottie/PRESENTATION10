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

import starling.display.Quad;

import starling.display.Sprite;

public class OverviewComponent extends starling.display.Sprite{

    private var appModel:AppModel;

    //private var scrollbar:ScrollBar;


    public function OverviewComponent() {

        appModel = AppModel.getInstance();

        var overviewBackground:Quad = new Quad(1024,200, 0x343434);
        addChild(overviewBackground);

        /*
        overzichtsTitel = new TextField();
        overzichtsTitel.text="De XML TITEL";
        //overzichtsTitel.text=appModel.xmlSlides;
        addChild(overzichtsTitel);
         */


        vooraantalSlides();
         /*
        scrollbar = new ScrollBar();
        scrollbar.x = 0;
        scrollbar.y = 100;
        addChild(scrollbar);
        */

    }

    private function vooraantalSlides():void {
        var xPos=60;

        for(var i:int=0 ; i<10; i++){

            var miniSlide:Quad = new Quad(80,80, 0x4a4a4a);
            miniSlide.x = xPos;
            miniSlide.y = 30;
            addChild(miniSlide);

            xPos+=160;


        }

    }
}
}
