/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 17/12/12
 * Time: 19:44
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {

import be.devine.cp3.model.AppModel;
import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;
import starling.display.Image;
import starling.display.Sprite;

public class ThumbNail extends Sprite{

    private var deLoader:Loader;
    private var slideInt:int;
    public var slideIndex:int;
    private var appModel:AppModel;


    public function ThumbNail(slideInd:int)
    {
        this.slideInt = slideInd;
        this.appModel = AppModel.getInstance();

        deLoader = new Loader();
        deLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadedHandler);
        deLoader.load(new URLRequest('assets/thumbs/' + appModel.currentXML +"/" +slideInt + '.png'));
    }

    private function imageLoadedHandler(event:Event):void
    {
        var thumbNail:Image = Image.fromBitmap(deLoader.content as Bitmap);
        thumbNail.width = 200;
        thumbNail.height = 150;
        slideIndex = slideInt;
        addChild(thumbNail);
    }
}
}
