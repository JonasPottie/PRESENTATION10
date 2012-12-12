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

import flash.display.StageDisplayState;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;
import flash.net.FileReference;
import flash.ui.Mouse;
import flash.ui.MouseCursor;

import starling.core.Starling;
import starling.display.DisplayObject;
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

    public function Menu()
    {
        appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);

        menuBalk = new Quad(appModel.stageWidth,20,0X333333);
        menuBalk.alpha = 0.8;
        addChild(menuBalk);


        textfield = new TextField(100,15,"FULLSCREEN","Arvo_regular",12,0xffffff);
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
        addChild(textfield2);
    }

    private function stageChangeHandler(event:flash.events.Event):void
    {
        menuBalk.width = appModel.stageWidth;
        textfield.x = appModel.stageWidth - textfield.width;
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
                        Starling.current.nativeStage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
                        textfield.width = 150;
                        textfield.x -= 50;
                        textfield.text = "EXIT FULLSCREEN";

                        textfield2.width = 150;
                        textfield2.x = 10;
                    }
                    else
                    {
                        appModel.fullScreen = false;
                        Starling.current.nativeStage.displayState = StageDisplayState.NORMAL;
                        textfield.width = 100;
                        textfield.x +=50;
                        textfield.text = "FULLSCREEN";
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
                addChild(xmlloaded);
            }
        }
        else
        {
            Mouse.cursor = MouseCursor.ARROW;
        }
    }



}
}
