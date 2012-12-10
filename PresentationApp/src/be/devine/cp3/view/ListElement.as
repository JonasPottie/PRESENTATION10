/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.vo.ContentElementVO;
import be.devine.cp3.vo.ListElementVO;

import flash.text.Font;

import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;

public class ListElement extends Element{

    private var textfield:TextField;
    private var content:Sprite;
    private var fontContainer:FontContainer;


    public function ListElement(listElementVO:ListElementVO)
    {
        super(listElementVO);

        content = new Sprite();
        content.x = listElementVO.x;
        content.y = listElementVO.y;
        addChild(content);

        var q:Quad = new Quad(listElementVO.width,listElementVO.height,0xffffff);
        q.alpha = 0.5;
        content.addChild(q);


        var allesSamen:String = listElementVO.text;
        var ListArray:Array = allesSamen.split(".");
        var yPosItem:int = 0;


        for(var i:int;i<ListArray.length; i++){

            textfield = new TextField(200,50,ListArray[i],"Avenir", 16);
            textfield.color = 0x000000;
            textfield.hAlign = HAlign.LEFT;
            textfield.x = 30;
            textfield.y = yPosItem;
            content.addChild(textfield);


            var bullet:Quad = new Quad(5,5,0x000);
            bullet.x = 15;
            bullet.y = yPosItem+23;
            content.addChild(bullet);
            yPosItem+=35;
        }

        //listArray.push(listElementVO.text.split("?"));

    }
}
}
