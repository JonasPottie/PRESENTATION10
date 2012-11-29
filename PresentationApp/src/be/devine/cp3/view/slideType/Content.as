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

public class Content extends Sprite{

    private var content:String;
    private var cWidth:int;
    private var cHeight:int;
    private var fonts:Array = Font.enumerateFonts();

    public function Content(contentText:String,contentWidth:int, contentHeight:int)
    {
        this.content = contentText;
        this.cWidth = contentWidth;
        this.cHeight = contentHeight;

        trace("het font is" + fonts);
        for each(var font:Font in fonts){
            trace(font.fontName,font.fontStyle,font.fontType);
        }

        // Create a new instance of the Textformat class.
        var textformat:TextFormat = new TextFormat();
        textformat.font = "Helvetica Neue";
        //textformat.font = "Avenir";
        textformat.size = 24;
        textformat.color = 0x000000;

        var textfield:TextField = new TextField();

        textfield.defaultTextFormat = textformat;
        textfield.embedFonts = true;
        textfield.text = "wat content";
        textfield.text = content;
        textfield.width = cWidth;
        textfield.height = cHeight;
        textfield.wordWrap = true;
        addChild(textfield);

    }
}
}
