/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 29/11/12
 * Time: 10:20
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.slideType {

import flash.display.Sprite;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.text.engine.FontLookup;

import starling.core.Starling;
import starling.display.Quad;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Content extends starling.display.Sprite{

    private var content:String;
    private var cWidth:int;
    private var cHeight:int;
    private var fontContainer:FontContainer;

    public function Content(contentText:String,contentWidth:int, contentHeight:int)
    {
        this.content = contentText;
        this.cWidth = contentWidth;
        this.cHeight = contentHeight;

        var q:Quad = new Quad(cWidth,cHeight,0x161616,true)
        q.alpha = 0.9;
        addChild(q);
        var textfield:starling.text.TextField = new starling.text.TextField(cWidth - 10,cHeight - 10,content,"Courier",18,0xffffff,false);
        textfield.vAlign = VAlign.TOP;
        textfield.x = 5;
        textfield.y = 5
        textfield.hAlign = HAlign.LEFT;
        addChild(textfield);



    }
}
}
