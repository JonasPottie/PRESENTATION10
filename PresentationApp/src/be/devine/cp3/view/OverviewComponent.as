/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 26/11/12
 * Time: 11:37
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import flash.display.Shape;
import flash.display.Sprite;

public class OverviewComponent extends Sprite{

    private var overviewBackground:Shape;

    public function OverviewComponent() {

        overviewBackground = new Shape();
        overviewBackground.graphics.beginFill(0x999895,.5);
        overviewBackground.graphics.drawRect(0,0,1024,768);
        overviewBackground.graphics.endFill();
        addChild(overviewBackground);


    }
}
}
