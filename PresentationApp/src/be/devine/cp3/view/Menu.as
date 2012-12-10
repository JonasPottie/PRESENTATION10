/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 10/12/12
 * Time: 10:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {


import be.devine.cp3.model.AppModel;

import flash.display.StageDisplayState;
import flash.events.EventDispatcher;
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
    private var fontContainer:FontContainer;

    public function Menu()
    {
        appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.STAGE_SIZE_CHANGED, stageChangeHandler);

        menuBalk = new Quad(appModel.stageWidth,20,0X333333);
        menuBalk.alpha = 0.8;
        addChild(menuBalk);


        textfield = new TextField(100,15,"FULLSCREEN","DIN",14,0xffffff);
        textfield.hAlign = HAlign.LEFT;
        textfield.x =  appModel.stageWidth - textfield.width;
        textfield.y = 5;
        textfield.addEventListener(TouchEvent.TOUCH,touchHandler)
        addChild(textfield);



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
}
}
