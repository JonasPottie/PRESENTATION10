/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:02
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.factory.view.ElementViewFactory;
import be.devine.cp3.vo.ElementVO;
import be.devine.cp3.vo.PageVO;

import starling.display.Sprite;

public class Page extends Sprite{

    private var pageVO:PageVO;

    public function Page(pageVO:PageVO) {
        this.pageVO = pageVO;

        trace("PAGE VIEW OBJECT WITH THESE ELEMENTS: " + pageVO.elements);

        for each(var elementVO:ElementVO in pageVO.elements) {

            trace("ELEMENTVO: " + elementVO);
            var element:Element = ElementViewFactory.createFromVO(elementVO);
            addChild(element);
        }
    }
}
}
