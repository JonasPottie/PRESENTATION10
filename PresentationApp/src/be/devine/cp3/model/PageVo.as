/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 30/11/12
 * Time: 09:11
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model {
import starling.display.Sprite;

public class PageVo extends Sprite{

    public var title:String = new String();
    public var titleProp:Vector.<int> = Vector.<int>([]);
    public var titleTrans:Vector.<String> = Vector.<String>([]);
    public  var content:String = new String();
    public var contentProp:Vector.<int> = Vector.<int>([]);
    public var contentTrans:Vector.<String> = Vector.<String>([]);
    public var image:String = new String();
    public var imageProp:Vector.<int> = Vector.<int>([]);
    public var imageTrans:Vector.<String> = Vector.<String>([]);

    public function PageVo()
    {


    }
}
}
