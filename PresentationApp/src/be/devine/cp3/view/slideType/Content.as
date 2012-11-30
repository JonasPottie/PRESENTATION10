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

import starling.display.Sprite;
import starling.text.TextField;

public class Content extends starling.display.Sprite{

    private var content:String;
    private var cWidth:int;
    private var cHeight:int;
    private var fonts:Array = Font.enumerateFonts();

    public function Content(contentText:String,contentWidth:int, contentHeight:int)
    {
        this.content = contentText;
        this.cWidth = contentWidth;
        this.cHeight = contentHeight;

        var textfield:starling.text.TextField = new starling.text.TextField(cWidth,cHeight,content,"Avenir LT Std 45 Book",22,0xc8c6c6)
        addChild(textfield);



    }
}
}
