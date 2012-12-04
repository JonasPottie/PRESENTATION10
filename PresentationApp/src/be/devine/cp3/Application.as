/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 23/11/12
 * Time: 12:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {

import be.devine.cp3.model.AppModel;
import be.devine.cp3.utils.DisplayToTexture;
import be.devine.cp3.view.OverviewComponent;

import flash.events.Event;

//import be.devine.cp3.view.OverviewComponent;
import be.devine.cp3.view.Page;
import be.devine.cp3.vo.PageVO;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import starling.animation.Transitions;
import starling.animation.Tween;

import starling.core.Starling;
import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Application extends Sprite{

    private var appModel:AppModel;

    //private var overviewComponent:OverviewComponent;

    private var pageContainer:Sprite;
    private var page:Page;
    private var overviewComponent:OverviewComponent;


    private var tweenUp:Tween;
    private var tweenDown:Tween;

    private var displayToTexture:DisplayToTexture;

    private var bg:AbstractBG;



    /*-------------------------------------------------------------------------//
    //------------    APP / ADDEN VAN COMPONENTS      --------------//
    //------------------------------------------------------------------------*/

    public function Application()
    {
        trace("[app CONSTRUCTED]");
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);


        displayToTexture = new DisplayToTexture();

        bg = new AbstractBG();
        addChild(displayToTexture.imageFromSprite(bg));

        pageContainer = new Sprite();
        addChild(pageContainer);




        this.appModel = AppModel.getInstance();
        appModel.load("assets/xml/presentation.xml");
        appModel.addEventListener(AppModel.XML_URL_LOADED, XmlLoadedHandler);
        appModel.addEventListener(AppModel.XML_URL_CHANGED, XmlLoadedHandler);
        appModel.addEventListener(AppModel.CURRENT_SLIDE_CHANGED, pageChangeHandler);
        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);

    }

    private function stageChangeHandler(event:flash.events.Event):void
    {
        ("change!")
        pageContainer.scaleX = appModel.stageWidth/1024;
        pageContainer.scaleY = appModel.stageWidth/1024;

        if(overviewComponent!=null)
        {
            if(appModel.overViewActive == true)
            {
                overviewComponent.y = appModel.stageHeight - 200;
            }
            else
            {
                overviewComponent.y = appModel.stageHeight;
            }
        }

    }

    private function pageChangeHandler(event:flash.events.Event):void
    {
        pageContainer.x = appModel.currentSlideIndex * -appModel.stageWidth;

    }



    private function XmlLoadedHandler(event:flash.events.Event):void
    {
        var xPos:uint = 0;
        for each(var pageVO:PageVO in appModel.pages) {
            page = new Page(pageVO);
            page.x = xPos;
            pageContainer.addChild(page);
            xPos += 1024;
        }
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

        if(overviewComponent==null)
        {
            overviewComponent = new OverviewComponent();
            addChild(overviewComponent);
            overviewComponent.y = appModel.stageHeight;

            tweenUp = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
            trace("GO UP");
            tweenUp.animate("y",appModel.stageHeight -200);
            Starling.juggler.add(tweenUp);
            appModel.overViewActive = true;


        }
        else
        {

            if(appModel.overViewActive == true)
            {
                trace("GO FUCING DOWN");
                tweenDown = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
                tweenDown.animate("y",appModel.stageHeight);
                Starling.juggler.add(tweenDown);
                appModel.overViewActive = false;
            }
            else
            {
                trace("GO FUCING UP");
                tweenUp = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
                tweenUp.animate("y",appModel.stageHeight -200);
                Starling.juggler.add(tweenUp);
                appModel.overViewActive = true;
            }
        }

    }
}
}
