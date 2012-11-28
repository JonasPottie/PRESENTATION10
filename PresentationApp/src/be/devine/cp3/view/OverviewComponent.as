/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 26/11/12
 * Time: 11:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;

import flash.display.Shape;
import flash.display.Sprite;
import flash.text.TextField;

public class OverviewComponent extends Sprite{

    private var appModel:AppModel;
    private var overviewBackground:Shape;
    private var overzichtsTitel:TextField;
    private var xPos:int =0;

    private var minislide:Shape = new Shape();

    public function OverviewComponent() {

        appModel = AppModel.getInstance();

        overzichtsTitel = new TextField();

        overviewBackground = new Shape();
        overviewBackground.graphics.beginFill(0x999895,.5);
        overviewBackground.graphics.drawRect(0,0,1024,768);
        overviewBackground.graphics.endFill();
        addChild(overviewBackground);


        overzichtsTitel.text="De XML TITEL";
        addChild(overzichtsTitel);

        vooraantalSlides();
    }

    private function vooraantalSlides():void {
        xPos=60;

        for(var i:int=0 ; i<appModel.xmlSlides.length; i++){
            trace("ne sliddde!!");
            minislide = new Shape();
            minislide.graphics.beginFill(0xFF00FF,.5);
            minislide.graphics.drawRect(xPos,30,140,140);
            minislide.graphics.endFill();
            addChild(minislide);
            xPos+=160;
        }
    }
}
}
