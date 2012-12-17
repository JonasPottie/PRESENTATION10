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
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;

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

    public function CreateThumbs()
    {
        this.appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.XML_URL_LOADED, XmlLoadedHandler);
    }
    private function XmlLoadedHandler(event:flash.events.Event):void
    {
        thumbContainer = new Sprite();
        addChild(thumbContainer);

        trace("Create Thumbs");
        for each(var pageVO:PageVO in appModel.pages)
        {
           trace("make thumb");

           page = new Page(pageVO);
           trace(page);
           thumbContainer.addChild(page);
           takeScreenshot(pageVO.index.toString());
        }

        removeAllChildrenOf(thumbContainer);
        removeChild(thumbContainer,true);
    }


    public function takeScreenshot(slideNmr:String,directory:String = "assets"):void {

        this.theDirectory = directory;

        var support:RenderSupport = new RenderSupport();
        RenderSupport.clear(Starling.current.stage.color, 1.0);
        support.setOrthographicProjection(Starling.current.viewPort.width, Starling.current.viewPort.height);
        Starling.current.stage.render(support, 1.0);
        support.finishQuadBatch();

        var result:BitmapData = new BitmapData(Starling.current.viewPort.width, Starling.current.viewPort.height, true);
        Starling.context.drawToBitmapData(result);

        var pngBytes:ByteArray = PNGEncoder.encode(result);

        var file:File = File.desktopDirectory;
        file = file.resolvePath(theDirectory + '/' + slideNmr + '.png');

        var fileStream:FileStream = new FileStream();
        fileStream.open(file, FileMode.WRITE);
        fileStream.writeBytes(pngBytes);

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
