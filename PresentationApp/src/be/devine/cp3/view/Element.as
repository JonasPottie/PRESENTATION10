/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 11:53
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.vo.ElementVO;

import starling.display.Sprite;

    public class Element extends Sprite{

        protected var _elementVO:ElementVO;

        public function Element(elementVO:ElementVO) {
            _elementVO = elementVO;
        }
    }


}
