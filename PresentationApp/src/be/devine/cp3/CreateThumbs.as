/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 17/12/12
 * Time: 17:49
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.service.PNGEncoder;
import be.devine.cp3.view.Page;
import be.devine.cp3.vo.PageVO;

import flash.display.BitmapData;

import flash.events.Event;
import flash.events.TimerEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;
import flash.utils.Timer;

import starling.core.RenderSupport;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.DisplayObjectContainer;

import starling.display.Sprite;

public class CreateThumbs extends Sprite{

    private var appModel:AppModel;
    private var theDirectory:String;
    private var page:Page;
    private var thumbContainer:Sprite;
    private var timer:Timer;
    private var slideToLoad:int;

    public function CreateThumbs()
    {
        this.appModel = AppModel.getInstance();

        thumbContainer = new Sprite();
        addChild(thumbContainer);

        page = new Page(appModel.pages[slideToLoad]);
        thumbContainer.addChild(page);
        timer =  new Timer(500,appModel.pages.length)
        timer.addEventListener(TimerEvent.TIMER, timerTickHandler);
        timer.start();

    }

    private function timerTickHandler(event:TimerEvent):void
    {
        trace("TIMERTICKHANDLER");
        takeScreenshot(slideToLoad.toString());

        slideToLoad ++;

        if(slideToLoad == appModel.pages.length)
        {
            trace("complete");
            removeAllChildrenOf(thumbContainer);
            removeChild(thumbContainer,true);
            appModel.thumbsCreated = true;
        }
        else
        {
            page = new Page(appModel.pages[slideToLoad]);
            thumbContainer.addChild(page);
        }

    }



    public function takeScreenshot(slideNmr:String,directory:String = "assets"):void {

        this.theDirectory = directory;

        var support:RenderSupport = new RenderSupport();
        RenderSupport.clear(Starling.current.stage.color, 1.0);
        support.setOrthographicProjection(Starling.current.viewPort.width*(Starling.current.viewPort.width/200), Starling.current.viewPort.height*(Starling.current.viewPort.width/200));

        Starling.current.stage.render(support, 1.0);
        support.finishQuadBatch();

        var result:BitmapData = new BitmapData(200,150);
        Starling.context.drawToBitmapData(result);

        var pngBytes:ByteArray = PNGEncoder.encode(result);

        var file:File = File.desktopDirectory;
        file = file.resolvePath(theDirectory + '/' + slideNmr + '.png');

        var fileStream:FileStream = new FileStream();
        fileStream.open(file, FileMode.WRITE);
        fileStream.writeBytes(pngBytes);
        removeAllChildrenOf(thumbContainer);
        trace("thumb created");
    }

    private function removeAllChildrenOf(container:DisplayObjectContainer):void
    {
        while( container.numChildren > 0 )
        {
            var child:DisplayObject = container.removeChildAt(0, true);
            if( child is DisplayObjectContainer )
                removeAllChildrenOf(child as DisplayObjectContainer);
        }
    }


}
}
