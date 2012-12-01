/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 29/11/12
 * Time: 10:19
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view.slideType {
import flash.display.Sprite;
import flash.text.AntiAliasType;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

import starling.display.Sprite;
import starling.text.TextField;
import starling.display.Quad;

import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;
import starling.utils.VAlign;

public class Title extends starling.display.Sprite{

    private var title:String;
    private var tWidth:int;
    private var tWidthTwo:int;
    private var tHeight:int;
    private var fontContainer:FontContainer;

    public function Title(titleText:String,titleWidth:int, titleHeight:int,titleWidhtTwo:int)
    {
        this.title = titleText;
        this.tWidth = titleWidth;
        this.tWidthTwo = titleWidhtTwo;
        this.tHeight = titleHeight;


        var q:Quad = new Quad(tWidth,(tHeight/4),0xffffff,true)
        addChild(q);
        var qt:Quad = new Quad(tWidthTwo,tHeight/6,0xffffff,true)
        qt.y = tHeight/4;
        addChild(qt);
        var textfield:starling.text.TextField = new starling.text.TextField(tWidth - 10,tHeight - 10,title,"Courier",48,0x000000,false);
        textfield.vAlign = VAlign.TOP;
        textfield.x = 5;
        textfield.y = 5
        textfield.hAlign = HAlign.LEFT;
        addChild(textfield);

    }
}
}
