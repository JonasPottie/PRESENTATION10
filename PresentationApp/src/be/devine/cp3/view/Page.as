/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:02
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.factory.view.ElementViewFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.ElementVO;
import be.devine.cp3.vo.PageVO;

import starling.display.Quad;

import starling.display.Sprite;

public class Page extends Sprite{

    private var pageVO:PageVO;
    public var pageIndex:int;
    private var appModel:AppModel;

    public function Page(pageVO:PageVO) {
        this.pageVO = pageVO;
        pageIndex = pageVO.index;
        this.appModel = AppModel.getInstance();
        var q:Quad = new Quad(1024,758,0xea655c);
        addChild(q);
        trace("HASPHOTOFALSE")

        for each(var elementVO:ElementVO in pageVO.elements)
        {
            var element:Element = ElementViewFactory.createFromVO(elementVO);
            addChild(element);
        }


    }

}
}
