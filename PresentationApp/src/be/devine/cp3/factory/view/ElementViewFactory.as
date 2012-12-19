/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 11:31
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.view {

import be.devine.cp3.view.ContentElement;
import be.devine.cp3.view.Element;
import be.devine.cp3.view.ImageElement;
import be.devine.cp3.view.ListElement;
import be.devine.cp3.view.TitleElement;
import be.devine.cp3.vo.ContentElementVO;
import be.devine.cp3.vo.ElementVO;
import be.devine.cp3.vo.ImageElementVO;
import be.devine.cp3.vo.ListElementVO;
import be.devine.cp3.vo.TitleElementVO;

public class ElementViewFactory {
    public static function createFromVO(elementVO:ElementVO):Element
    {
        if(elementVO is TitleElementVO)
            return new TitleElement(elementVO as TitleElementVO);

        if(elementVO is ContentElementVO)
            return new ContentElement(elementVO as ContentElementVO);

        if(elementVO is ImageElementVO)
            return new ImageElement(elementVO as ImageElementVO);

        if(elementVO is ListElementVO)
            return new ListElement(elementVO as ListElementVO);

        return new Element(elementVO);
    }
}
}
