package {

import be.devine.cp3.Application;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import net.hires.debug.Stats;



[SWF(backgroundColor="#ffffff", width="1024", height="768", frameRate=60)]


public class Main extends Sprite {

    private var app:Application;
    //private var starling:Starling;


    public function Main() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        app = new Application();
        addChild(app);

        //addChild(new Stats());
        //addChild(app);

        //starling = new Starling(Application, stage);
        //starling.start();




    }
}
}
