package {

import be.devine.cp3.Application;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.utils.DisplayToTexture;

import flash.desktop.NativeApplication;

import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageDisplayState;
import flash.display.StageOrientation;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.geom.Rectangle;

import net.hires.debug.Stats;

import starling.core.Starling;

import starling.core.Starling;
import starling.events.ResizeEvent;
import starling.text.TextField;


[SWF(width="1024", height="768", frameRate=60)]


public class Main extends Sprite{

    private var starling:Starling;
    private var appModel:AppModel;

    private var displayToTexture:DisplayToTexture;


    public function Main()
    {


        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        this.appModel = AppModel.getInstance();

        //stage.displayState = StageDisplayState.FULL_SCREEN;
        starling = new Starling(Application,stage);
        starling.start();

        stage.addEventListener(ResizeEvent.RESIZE, resizeStage);
    }
    private function resizeStage(e:Event) {
        var viewPortRectangle:Rectangle = new Rectangle();
        viewPortRectangle.width = stage.stageWidth;
        viewPortRectangle.height = stage.stageHeight;
        Starling.current.viewPort = viewPortRectangle;

        starling.stage.stageWidth = stage.stageWidth;
        starling.stage.stageHeight = stage.stageHeight;
        appModel.stageWidth = stage.stageWidth;
        appModel.stageHeight = stage.stageHeight;

    }
}
}
