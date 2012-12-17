/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:06
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.utils.DisplayToTexture;
import be.devine.cp3.vo.ImageElementVO;

import flash.display.Loader;
import flash.events.Event;
import flash.net.URLRequest;
import starling.display.Sprite;

public class ImageElement extends Element{

    private var deLoader:Loader;
    private var image:Sprite;
    private var displayToTexture:DisplayToTexture;

    public function ImageElement(imageElementVO:ImageElementVO)
    {
        super(imageElementVO);

        displayToTexture = new DisplayToTexture();

        image = new Sprite();
        image.x = imageElementVO.x;
        image.y = imageElementVO.y;
        addChild(image);

        deLoader = new Loader();
        deLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, imageLoadedHandler);
        deLoader.load(new URLRequest(imageElementVO.url));
        //trace("ADDCHILD IMAGE-ELEMENT" + imageElementVO.url);
    }

    private function imageLoadedHandler(e:Event):void
    {
        image.addChild(displayToTexture.imageFromSprite(deLoader));
    }



}
}
