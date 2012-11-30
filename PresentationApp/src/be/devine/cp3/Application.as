/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 23/11/12
 * Time: 12:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {

import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.MenuComponent;
import be.devine.cp3.view.OverviewComponent;
import be.devine.cp3.view.SlideComponent;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import starling.core.Starling;

import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Application extends starling.display.Sprite{

    private var appModel:AppModel;
    private var menuComponent:MenuComponent;
    private var overviewComponent:OverviewComponent;
    private var slideComponent:SlideComponent;

/*-------------------------------------------------------------------------//
//------------    APP / ADDEN VAN COMPONENTS      --------------//
//------------------------------------------------------------------------*/

    public function Application()
    {
        trace("[app CONSTRUCTED]");
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        this.appModel = AppModel.getInstance();
        appModel.load("assets/xml/presentation.xml");
        appModel.addEventListener(AppModel.XML_URL_LOADED, XmlLoadedHandler);
        appModel.addEventListener(AppModel.XML_URL_CHANGED, XmlLoadedHandler);


    }



    private function XmlLoadedHandler(event:flash.events.Event):void
    {

        menuComponent = new MenuComponent();


        slideComponent = new SlideComponent();
        addChild(slideComponent);



    }


/*-------------------------------------------------------------------------//
//------------    SWITCHEN TUSSEN SLIDES MET PIJLTJES     --------------//
//------------------------------------------------------------------------*/

    private function addedToStageHandler(event:starling.events.Event):void
    {
        this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
    }

    private function keyHandler(event:starling.events.KeyboardEvent):void {
        switch (event.keyCode)
        {
            case Keyboard.LEFT:
                appModel.goToPreviousSlide();
            break;

            case Keyboard.RIGHT:
                appModel.goToNextSlide();
            break;

            case Keyboard.SPACE:
                showOverview();
                break;
        }
    }

    private function showOverview():void
    {

        trace("SHOWOVERVIEW")

        if(overviewComponent==null)
        {
            overviewComponent = new OverviewComponent();
            addChild(overviewComponent);

            overviewComponent.y = 768;

            trace("CREATE(hide)")
        }

        if(overviewComponent.y == 568)
        {
            trace("HIDE")
            overviewComponent.y = 768
        }
        else
        {
            trace("DISPLAY")
            overviewComponent.y = 568
        }

    }


}
}
