package {

import be.devine.cp3.Application;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.geom.Rectangle;

import net.hires.debug.Stats;

import starling.core.Starling;

import starling.core.Starling;
import starling.events.ResizeEvent;


[SWF(width="1024", height="768", frameRate=60)]


public class Main extends Sprite{

    private var starling:Starling;


    public function Main()
    {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        starling = new Starling(Application,stage);
        starling.start();

        //addChild(new Stats());
        //addChild(app);


    }
}
}
