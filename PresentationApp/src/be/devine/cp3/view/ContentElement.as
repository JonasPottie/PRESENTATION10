/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.vo.ContentElementVO;

import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;

public class ContentElement extends Element{

    private var textfield:starling.text.TextField;
    private var content:Sprite;
    private var fontContainer:FontContainer;



    public function ContentElement(contentElementVO:ContentElementVO)
    {
        super(contentElementVO);

        content = new Sprite();
        content.x = contentElementVO.x;
        content.y = contentElementVO.y;
        content.height=50;
        addChild(content);

        var q:Quad = new Quad(contentElementVO.width,contentElementVO.height,0xffffff);
        q.alpha = 0.5;
        content.addChild(q);

        textfield = new TextField(contentElementVO.width,contentElementVO.height,contentElementVO.text,"Avenir", 16);
        textfield.color = 0x000000;
        textfield.hAlign = HAlign.LEFT;
        textfield.y = 5;
        textfield.x = 5;
        content.addChild(textfield);
    }
}
}
