/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 30/11/12
 * Time: 09:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.vo {

public class PageVO {

    public var elements:Vector.<ElementVO>;
    public var index:int;

    public function PageVO()
    {
        elements = new Vector.<ElementVO>();
        index = new int();

    }
}
}
