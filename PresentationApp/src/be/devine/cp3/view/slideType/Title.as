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
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;

public class Title extends Sprite{

    private var content:String;
    private var title:TextField;
    private var fontContainer:FontContainer;
    private var overviewBackground:Sprite;

    public function Title(titleText:String)
    {
        this.content = titleText;

        // Create a new instance of the Textformat class.
        var textformat:TextFormat = new TextFormat();
        textformat.font = "Helvetica Neue";
        textformat.size = 48;
        textformat.color = 0x000000;

        var textfield:TextField = new TextField();

        textfield.defaultTextFormat = textformat;
        textfield.embedFonts = true;
        textfield.text = content;
        textfield.autoSize = TextFieldAutoSize.LEFT;
        addChild(textfield);


    }
}
}
