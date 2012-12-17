/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 14/12/12
 * Time: 09:38
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.service {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.utils.DisplayToTexture;
import be.devine.cp3.view.Page;
import be.devine.cp3.vo.PageVO;

import flash.display.Bitmap;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.IBitmapDrawable;
import flash.display.MovieClip;
import flash.display.MovieClip;
import flash.display.Sprite;
import flash.display.Sprite;
import flash.display3D.Context3D;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.geom.Matrix;
import flash.geom.Rectangle;
import flash.geom.Vector3D;
import flash.net.FileReference;
import flash.text.TextField;
import flash.utils.ByteArray;

import starling.core.RenderSupport;
import starling.core.Starling;
import starling.display.Quad;

import starling.display.Sprite;


public class MakePNGThumbs extends starling.display.Sprite{

    private var sprite:Movieclipke = new Movieclipke();
    private var appModel:AppModel;
    private var slideInde:int = 0;
    private var page:Page;
    private var displayToTexture:DisplayToTexture;


    public function MakePNGThumbs() {
        appModel = AppModel.getInstance();
        displayToTexture = new DisplayToTexture();

        /*for each(var pageVO:PageVO in appModel.pages)
        {
            page = new Page(pageVO);
            //makePng();
            //saveLocalPNG(page);
        }*/

    }

    private function makePng():void
    {
        var nBox:Quad = new Quad(100,100,0xFF00FF);

        var support:RenderSupport = new RenderSupport();
        RenderSupport.clear(stage.color, 1.0);
        support.setOrthographicProjection(width, height);
        stage.render(support, 1.0);
        support.finishQuadBatch();

        var result:BitmapData = new BitmapData(width, height, true);
        Starling.context.drawToBitmapData(result);

        //var ba:ByteArray = new ByteArray(result);
    }

    private function saveLocalPNG(page):void
    {
        slideInde++;
        var ba:ByteArray = getMovieClipAsByteArrayPNG(page);

        //DEZE CODE WORDT GEBRUIKT OM ALLE FILES AUTOMATISCH TE SAVEN, NIET DOOR NOG EENS "SAVE" TE KLIKKEN
        //WERKT ENKEL MET AIR
        var fs : FileStream = new FileStream();
        var targetFile : File = File.desktopDirectory.resolvePath("slideNumber"+slideInde+".png");
        fs.open(targetFile, FileMode.WRITE);
        fs.writeBytes(ba);
        fs.close();
    }


    private function getMovieClipAsByteArrayPNG(page):ByteArray
    {
        var data:Bitmap = getMovieClipAsBitmap(page);
        var ba:ByteArray = PNGEncoder.encode(data.bitmapData);
        return ba;
    }

    private function getMovieClipAsBitmap(page):Bitmap
    {
        var bounds:Rectangle = sprite.getBounds(sprite);
        var theBitmap:Bitmap = new Bitmap(new BitmapData(bounds.width/2, bounds.height/2, true, 0x0));
        var m:Matrix = new Matrix(1, 0, 0, 1, -bounds.x, -bounds.y);
        m.scale(.5,.5);

        trace(theBitmap+" the bitmap");
        theBitmap.bitmapData.draw(sprite, m, null, null, null, true);

        return theBitmap;
    }



}
}
