package {

import be.devine.cp3.Application;
import flash.display.MovieClip;
import flash.display.StageAlign;
import flash.display.StageScaleMode;


[SWF(backgroundColor="#ffffff", width="1024", height="768", frameRate=60)]


public class Main extends MovieClip {

    private var app:Application = new Application();

    public function Main() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        addChild(app);

    }
}
}
