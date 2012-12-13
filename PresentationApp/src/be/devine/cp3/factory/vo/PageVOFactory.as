/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 10:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.vo {
import be.devine.cp3.vo.PageVO;

public class PageVOFactory {



    public function PageVOFactory()
    {

    }

    public function createPageVOFromXML(pageXML:XML):PageVO
    {
        trace("pageXML CREATED");
        var pageVO:PageVO = new PageVO();
        for each (var elementXML:XML in pageXML.pageElement)
        {
            pageVO.elements.push(ElementVOFactory.createFromXML(elementXML));

        }
        pageVO.index = pageXML.@label;
        return pageVO;
    }
}
}
