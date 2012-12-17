/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 12:01
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.factory.vo {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.vo.ContentElementVO;
import be.devine.cp3.vo.ElementVO;
import be.devine.cp3.vo.ImageElementVO;
import be.devine.cp3.vo.ListElementVO;
import be.devine.cp3.vo.TitleElementVO;
import be.devine.cp3.vo.VideoElementVO;

public class ElementVOFactory {


    public static function createFromXML(elementXML:XML):ElementVO
    {


        switch("" + elementXML.@type)
        {
            case "title": return createTitleElementVO(elementXML);
            case "content": return createContentElementVO(elementXML);
            case "image": return createImageElementVo(elementXML);
            case "list": return createListElementVo(elementXML);
            case "video": return createVideoElementVo(elementXML);
        }
        return null;
    }

    public static function createTitleElementVO(elementXML:XML):TitleElementVO
    {
        var elementVO:TitleElementVO = new TitleElementVO();
        elementVO.text = elementXML;
        elementVO.width = elementXML.@width;
        elementVO.height = elementXML.@height;
        elementVO.x = elementXML.@x;
        elementVO.y = elementXML.@y;
        return elementVO;
    }

    public static function createContentElementVO(elementXML:XML):ContentElementVO
    {
        var elementVO:ContentElementVO = new ContentElementVO();
        elementVO.text = elementXML;
        elementVO.width = elementXML.@width;
        elementVO.height = elementXML.@height;
        elementVO.x = elementXML.@x;
        elementVO.y = elementXML.@y;
        return elementVO;
    }

    public static function createImageElementVo(elementXML:XML):ImageElementVO
    {
        var elementVO:ImageElementVO = new ImageElementVO();
        elementVO.url = elementXML;
        elementVO.x = elementXML.@x;
        elementVO.y = elementXML.@y;
        return elementVO;
    }

    public static function createListElementVo(elementXML:XML):ListElementVO
    {
        var elementVO:ListElementVO = new ListElementVO();
        elementVO.text = elementXML;
        elementVO.width = elementXML.@width;
        elementVO.height = elementXML.@height;
        elementVO.x = elementXML.@x;
        elementVO.y = elementXML.@y;
        return elementVO;
    }

    public static function createVideoElementVo(elementXML:XML):VideoElementVO
    {
        var elementVO:VideoElementVO = new VideoElementVO();
        elementVO.x = elementXML.@x;
        elementVO.y = elementXML.@y;
        elementVO.url = elementXML;
        return elementVO;
    }
}
}
