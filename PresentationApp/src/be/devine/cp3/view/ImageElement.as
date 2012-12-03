/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:06
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.vo.ImageElementVO;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;

import starling.core.Starling;

import starling.display.DisplayObject;

public class ImageElement extends Element{

    private var deLoader:Loader;

    public function ImageElement(imageElementVO:ImageElementVO)
    {
        super(imageElementVO);

        deLoader = new Loader();
        deLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadedHandler);
        deLoader.load(new URLRequest(imageElementVO.url));
        trace("ADDCHILD IMAGE-ELEMENT" + imageElementVO.url);
    }

    private function imageLoadedHandler(e:Event):void {
        deLoader.x=(_elementVO as ImageElementVO).x;
        deLoader.y=(_elementVO as ImageElementVO).y;
        Starling.current.nativeOverlay.addChild(deLoader);


    }



}
}
