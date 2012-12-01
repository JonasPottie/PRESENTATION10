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
import be.devine.cp3.view.MenuComponent;
import be.devine.cp3.view.OverviewComponent;
import be.devine.cp3.view.SlideComponent;

import flash.display.Bitmap;

import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

//import mx.effects.easing.Back;

import starling.animation.Transitions;

import starling.animation.Tween;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.MovieClip;

import starling.display.Sprite;
import starling.events.Event;
import starling.textures.Texture;

public class Application extends starling.display.Sprite{

    private var appModel:AppModel;
    private var menuComponent:MenuComponent;
    private var overviewComponent:OverviewComponent;
    private var slideComponent:SlideComponent;
    private var tweenUp:Tween;
    private var tweenDown:Tween;

    private var displayToTexture:DisplayToTexture;
    //private var backGround:BackGround;



    /*-------------------------------------------------------------------------//
    //------------    APP / ADDEN VAN COMPONENTS      --------------//
    //------------------------------------------------------------------------*/

    public function Application()
    {
        trace("[app CONSTRUCTED]");
        this.addEventListener(starling.events.Event.ADDED_TO_STAGE, addedToStageHandler);

        //backGround = new BackGround();
        displayToTexture = new DisplayToTexture();
        //addChild(displayToTexture.imageFromSprite(backGround));



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

        if(overviewComponent==null)
        {
            overviewComponent = new OverviewComponent();
            addChild(overviewComponent);
            overviewComponent.y = 768;

            tweenUp = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
            tweenUp.animate("y",568);
            Starling.juggler.add(tweenUp);
        }

        if(overviewComponent.y == 568)
        {
            tweenDown = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
            tweenDown.animate("y",768);
            Starling.juggler.add(tweenDown);
        }
        else
        {
            tweenUp = new Tween(overviewComponent,.5,Transitions.EASE_IN_OUT);
            tweenUp.animate("y",568);
            Starling.juggler.add(tweenUp);
        }

    }


}
}
