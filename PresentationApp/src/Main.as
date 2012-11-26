package {

import be.devine.cp3.Application;

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

    private var appl:Application = new Application();
    private var bg:TheBackground = new TheBackground();

    public function Main() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        stage.color = 0x00000;

        bg.x = stage.stageWidth/2;
        bg.y = stage.stageHeight/2;
        addChild(bg);
        addChild(appl);

    }




}
}
