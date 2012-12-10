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
import be.devine.cp3.view.Menu;
import be.devine.cp3.view.OverviewComponent;


import flash.events.Event;

import starling.display.Quad;
import starling.extensions.pixelmask.PixelMaskDisplayObject;


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
    private var menu:Menu;


    private var tween:Tween;

    private var displayToTexture:DisplayToTexture;
    private var pixelMask:PixelMaskDisplayObject;

    private var bg:Quad;
    private var mask:Quad;



    /*-------------------------------------------------------------------------//
    //------------    APP / ADDEN VAN COMPONENTS      --------------//
    //------------------------------------------------------------------------*/

    public function Application()
    {
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        displayToTexture = new DisplayToTexture();
        this.appModel = AppModel.getInstance();

        bg= new Quad(appModel.stageWidth,appModel.stageHeight,0xea655c);
        addChild(bg);

        pageContainer = new Sprite();
        mask = new Quad(1024,768,0x0);

        pixelMask = new PixelMaskDisplayObject();
        pixelMask.addChild(pageContainer);

        pixelMask.mask = mask;
        addChild(pixelMask);


        appModel.load("assets/xml/presentation.xml");
        appModel.addEventListener(AppModel.XML_URL_LOADED, XmlLoadedHandler);
        appModel.addEventListener(AppModel.XML_URL_CHANGED, XmlLoadedHandler);
        appModel.addEventListener(AppModel.CURRENT_SLIDE_CHANGED, pageChangeHandler);
        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);
    }

    private function stageChangeHandler(event:flash.events.Event):void
    {
        bg.width = appModel.stageWidth;
        bg.height = appModel.stageHeight;
        pixelMask.x =  ((appModel.stageWidth - 1024)/2);
        pageContainer.x = (appModel.currentSlideIndex *-1024) - ((appModel.stageWidth - 1024)/2);

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
        tween = new Tween(pageContainer,.5,Transitions.EASE_IN_OUT);
        tween.animate("x",(appModel.currentSlideIndex *-1024) - ((appModel.stageWidth - 1024)/2));
        Starling.juggler.add(tween);
    }



    private function XmlLoadedHandler(event:flash.events.Event):void
    {
        var xPos:uint = 0;
        for each(var pageVO:PageVO in appModel.pages) {
            page = new Page(pageVO);
            page.x = xPos;
            pageContainer.addChild(page);
            xPos += appModel.stageWidth;
        }
    }


/*-------------------------------------------------------------------------//
//------------    SWITCHEN TUSSEN SLIDES MET PIJLTJES & OVERVIEW     --------------//
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

            menu = new Menu();
            addChild(menu);

            overviewComponent.y = appModel.stageHeight;
            menu.y = -menu.height;

            tween = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
            tween.animate("y",appModel.stageHeight -200);
            Starling.juggler.add(tween);

            tween = new Tween(menu,.5,Transitions.EASE_IN_OUT);
            tween.animate("y",0);
            Starling.juggler.add(tween);

            appModel.overViewActive = true;
        }
        else
        {

            if(appModel.overViewActive == true)
            {
                tween = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
                tween.animate("y",appModel.stageHeight);
                Starling.juggler.add(tween);

                tween = new Tween(menu,.5,Transitions.EASE_IN_OUT);
                tween.animate("y",-menu.height);
                Starling.juggler.add(tween);

                appModel.overViewActive = false;
            }
            else
            {
                tween = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
                tween.animate("y",appModel.stageHeight -200);
                Starling.juggler.add(tween);

                tween = new Tween(menu,.5,Transitions.EASE_IN_OUT);
                tween.animate("y",0);
                Starling.juggler.add(tween);

                appModel.overViewActive = true;
            }
        }

    }
}
}
