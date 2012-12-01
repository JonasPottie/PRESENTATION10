/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 1/12/12
 * Time: 12:07
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.utils {
import flash.display.BitmapData;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.geom.Matrix;
import flash.geom.Rectangle;

import starling.display.Image;

import starling.display.Sprite;
import starling.textures.Texture;

public class DisplayToTexture extends Sprite{

    public function DisplayToTexture()
    {

    }

    public function imageFromSprite(sprite:DisplayObject):Image
    {
        var rect:Rectangle = sprite.getBounds(sprite);

        var image:Image = new Image(textureFromSprite(sprite));
        image.x = rect.x;
        image.y = rect.y;

        return image;
    }

    public static function textureFromSprite(sprite:DisplayObject):Texture
    {
        var rect:Rectangle = sprite.getBounds(sprite);

        if ( rect.width > 2048 ) {
            rect.width = 2048;
            trace("Bitmap too big, shrinking");
        }
        if ( rect.height > 2048 ) {
            rect.height = 2048;
            trace("Bitmap too big, shrinking");
        }

        //red box means invalid texture
        if ( rect.width <= 2 || rect.height <= 2 ) {
            var tempSprite:flash.display.Sprite = new flash.display.Sprite();
            tempSprite.graphics.beginFill(0xFF0000);
            tempSprite.graphics.drawRect(0, 0, 50, 50);
            sprite = tempSprite;
            rect = sprite.getBounds(sprite);
        }

        var bmd:BitmapData = new BitmapData(
                rect.width, rect.height, true, 0x0000000000);
        var matrix:Matrix = new Matrix();
        matrix.translate( -rect.x, -rect.y);

        // draw the shape on the bitmap
        bmd.draw(sprite, matrix);

        var texture:Texture = Texture.fromBitmapData(bmd);

        return texture;
    }
}

}
