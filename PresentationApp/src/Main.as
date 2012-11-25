package {

import be.devine.cp3.view.Preloader;
import com.greensock.TweenLite;
import com.greensock.easing.Back;
import flash.display.DisplayObject;
import flash.display.MovieClip;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.ProgressEvent;
import flash.utils.getDefinitionByName;

[SWF(backgroundColor="#fff", width="1024", height="768")]


public class Main extends MovieClip {

    private var preloader:Preloader;
    private var app:DisplayObject;


    public function Main() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        stage.color = 0x00000;

        preloader = new Preloader();
        preloader.progress = 0;
        preloader.addEventListener(Event.CHANGE, preloaderChangeHandler);
        addChild(preloader);

        if(loaderInfo.bytesLoaded == loaderInfo.bytesTotal)
        {
            completeHandler(null);
        }
        else
        {
            loaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            loaderInfo.addEventListener(Event.COMPLETE, completeHandler);
        }

        stage.addEventListener(Event.RESIZE, layout);
        layout(null);
    }


    private function progressHandler(event:ProgressEvent):void
    {
        TweenLite.to(preloader, 0.5, {progress: (event.bytesLoaded / event.bytesTotal)});
    }

    private function completeHandler(event:Event):void
    {
        gotoAndPlay("start");
        TweenLite.to(preloader, 0.5, {progress: 1});
    }

    private function preloaderChangeHandler(event:Event):void
    {
        if(preloader.progress == 1)
        {
            TweenLite.to(preloader, 0.5, {y: -50, ease: Back.easeIn, onComplete: showApplication});
        }
    }

    private function showApplication():void
    {
        var appClass:* = getDefinitionByName("be.devine.cp3.Application");
        app = new appClass();
        TweenLite.from(app, 1, {alpha: 0});
        stage.color = 0xffffff;
        addChild(app);
        layout(null);
    }

    private function layout(event:Event):void
    {
        if(preloader.progress < 1)
        {
            preloader.y = stage.stageHeight * 0.5;
        }
        if(app != null)
        {
            /*app.x = (stage.stageWidth - app.width) * 0.5;
             app.y = (stage.stageHeight - app.height) * 0.5;*/
        }
    }

}
}
