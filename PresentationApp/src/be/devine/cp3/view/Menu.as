/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 10/12/12
 * Time: 10:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {


import be.devine.cp3.model.AppModel;
import be.devine.cp3.service.XMLLoadedService;
import be.devine.cp3.utils.DisplayToTexture;

import flash.display.Loader;

import flash.display.StageDisplayState;
import flash.events.Event;
import flash.net.URLRequest;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.MovieClip;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.utils.HAlign;


public class Menu extends Sprite{

    private var menuBalk:Quad;
    private var appModel:AppModel;
    private var textfield:TextField;
    private var textfield2:TextField;
    private var displayToTexture:DisplayToTexture;
    private var uploadLoader:Loader;
    private var fullScreenLoader:Loader;
    private var exitFullScreenLoader:Loader;
    private var uploadContainer:Sprite = new Sprite();
    private var fullScreenContainer:Sprite = new Sprite();
    private var exitFullScreenContainer:Sprite = new Sprite();


    public function Menu()
    {
        displayToTexture = new DisplayToTexture();

        appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);

        menuBalk = new Quad(appModel.stageWidth,60,0X1e4a5b);
        menuBalk.addEventListener(TouchEvent.TOUCH,clickedBrows);

        menuBalk.alpha = 1;
        addChild(menuBalk);


        fullScreenContainer.x = appModel.stageWidth-200;
        exitFullScreenContainer.x = appModel.stageWidth-200;

        /*textfield = new TextField(100,15,"FULLSCREEN","Arvo_regular",12,0xffffff);
        textfield.hAlign = HAlign.LEFT;
        textfield.x =  appModel.stageWidth - textfield.width;
        textfield.y = 2;
        textfield.addEventListener(TouchEvent.TOUCH,touchHandler);
        addChild(textfield);

        textfield2 = new TextField(100,15,"LOAD XML","Arvo_regular",12,0xffffff);
        textfield2.hAlign = HAlign.LEFT;
        textfield2.x = 10;
        textfield2.y = 2;
        textfield2.addEventListener(TouchEvent.TOUCH,clickedBrows);
        addChild(textfield2);*/


        uploadLoader = new Loader();
        uploadLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, uploadLoadedHandler);
        uploadLoader.load(new URLRequest("assets/backgrounds/BtnUpload.png"));

        fullScreenLoader = new Loader();
        fullScreenLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, fullScreenLoadedHandler);
        fullScreenLoader.load(new URLRequest("assets/backgrounds/BtnFullScreen.png"));

        exitFullScreenLoader = new Loader();
        exitFullScreenLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, exitLoadedHandler);
        exitFullScreenLoader.load(new URLRequest("assets/backgrounds/BtnExit.png"));

        exitFullScreenContainer.alpha=0;
    }

    private function uploadLoadedHandler(e:Event):void
    {
        addChild(uploadContainer);
        uploadContainer.addChild(displayToTexture.imageFromSprite(uploadLoader));
        uploadLoader.mouseChildren=false;
        uploadContainer.addEventListener(TouchEvent.TOUCH,clickedBrows);

    }
    private function fullScreenLoadedHandler(e:Event):void
    {
        addChild(fullScreenContainer);
        fullScreenContainer.addChild(displayToTexture.imageFromSprite(fullScreenLoader));
        fullScreenLoader.mouseChildren=false;
        fullScreenContainer.addEventListener(TouchEvent.TOUCH,touchHandler);

    }
    private function exitLoadedHandler(e:Event):void
    {
        addChild(exitFullScreenContainer);
        exitFullScreenContainer.addChild(displayToTexture.imageFromSprite(exitFullScreenLoader));
        exitFullScreenLoader.mouseChildren=false;
        exitFullScreenContainer.addEventListener(TouchEvent.TOUCH,touchHandler);

    }

    private function stageChangeHandler(event:flash.events.Event):void
    {
        menuBalk.width = appModel.stageWidth;
        //textfield.x = appModel.stageWidth - textfield.width;
        fullScreenContainer.x = appModel.stageWidth-200;
        exitFullScreenContainer.x = appModel.stageWidth-200;

    }

     private function touchHandler(event:TouchEvent):void
    {


        var touch:Touch = event.getTouch(event.currentTarget as DisplayObject);
        if(touch != null)
        {
            Mouse.cursor = MouseCursor.BUTTON;

            switch (touch.phase)
            {
                case TouchPhase.ENDED:

                    if(appModel.fullScreen == false)
                    {

                        appModel.fullScreen = true;
                        trace("boolean "+appModel.fullScreen);
                        exitFullScreenContainer.alpha =1;
                        fullScreenContainer.alpha =0;
                        Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                        /*textfield.width = 150;
                        textfield.x -= 50;
                        textfield.text = "EXIT FULLSCREEN";

                        textfield2.width = 150;
                        textfield2.x = 10;*/
                    }
                    else
                    {
                        appModel.fullScreen = false;
                        trace("boolean "+appModel.fullScreen);
                        exitFullScreenContainer.alpha =0;
                        fullScreenContainer.alpha =1;
                        Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
                        /*textfield.width = 100;
                        textfield.x +=50;
                        textfield.text = "FULLSCREEN";*/
                    }

                break;
            }
        }
        else
        {
            Mouse.cursor = MouseCursor.ARROW;
        }

    }


    function clickedBrows(event:TouchEvent):void
    {
        var touch:Touch = event.getTouch(event.currentTarget as DisplayObject);
        if(touch != null)
        {
            Mouse.cursor = MouseCursor.BUTTON;

            switch (touch.phase)
            {
                case TouchPhase.ENDED:
                var xmlloaded:XMLLoadedService = new XMLLoadedService();
            }
        }
        else
        {
            Mouse.cursor = MouseCursor.ARROW;
        }
    }



}
}
