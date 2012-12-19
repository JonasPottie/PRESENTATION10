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
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Menu extends Sprite{

    private var menuBalk:Quad;
    private var appModel:AppModel;
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

        menuBalk.alpha = 1;
        addChild(menuBalk);


        fullScreenContainer.x = appModel.stageWidth-200;
        exitFullScreenContainer.x = appModel.stageWidth-200;

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
                        exitFullScreenContainer.alpha =1;
                        fullScreenContainer.alpha =0;
                        Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                    }
                    else
                    {
                        appModel.fullScreen = false;
                        exitFullScreenContainer.alpha =0;
                        fullScreenContainer.alpha =1;
                        Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
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
