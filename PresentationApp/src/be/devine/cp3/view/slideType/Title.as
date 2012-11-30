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

public class Title extends starling.display.Sprite{

    private var title:String;
    private var tWidth:int;
    private var tHeight:int;

    public function Title(titleText:String,titleWidth:int, titleHeight:int)
    {
        this.title = titleText;
        this.tWidth = titleWidth;
        this.tHeight = titleHeight;


        var textfield:starling.text.TextField = new starling.text.TextField(tWidth,tHeight,title,"Helvetica",48,0xa4a4a4)
        addChild(textfield);


    }
}
}
