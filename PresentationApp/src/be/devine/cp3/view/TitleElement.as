/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:10
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.vo.TitleElementVO;

import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;

public class TitleElement extends Element{

    private var textfield:starling.text.TextField;
    private var title:Sprite;
    private var fontContainer:FontContainer;

    public function TitleElement(titleElementVO:TitleElementVO)
    {
        super(titleElementVO);

        title = new Sprite();
        title.x = titleElementVO.x;
        title.y = titleElementVO.y;
        addChild(title);

        var q:Quad = new Quad(titleElementVO.width,titleElementVO.height/4,0xffffff);
        title.addChild(q);

        var qTwo:Quad = new Quad(titleElementVO.widthTwo,titleElementVO.height/4,0xffffff);
        qTwo.y = titleElementVO.height/6;
        title.addChild(qTwo);

        textfield = new TextField(titleElementVO.width,titleElementVO.height,titleElementVO.text,"Courier", 48);
        textfield.hAlign = HAlign.LEFT;
        textfield.y =  -5 -titleElementVO.height/4;
        textfield.x = 5;
        title.addChild(textfield);

        trace("ADDCHILD TITLE");
    }
}
}
