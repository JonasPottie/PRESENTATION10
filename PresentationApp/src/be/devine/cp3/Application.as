/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 23/11/12
 * Time: 12:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {

import be.devine.cp3.model.AppModel;
import be.devine.cp3.view.MenuComponent;
import be.devine.cp3.view.OverviewComponent;
import be.devine.cp3.view.SlideComponent;

import com.greensock.TweenLite;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

public class Application extends Sprite{

    private var appModel:AppModel;
    private var menuComponent:MenuComponent;
    private var overviewComponent:OverviewComponent;
    private var slideComponent:SlideComponent;

/*-------------------------------------------------------------------------//
//------------    APP / ADDEN VAN COMPONENTS      --------------//
//------------------------------------------------------------------------*/

    public function Application()
    {
        trace("[app CONSTRUCTED]");
        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

        appModel = AppModel.getInstance();

        menuComponent = new MenuComponent();
        //addchilden via starling?

        //AANMAKEN ALS HET GEVRAAGD WORDT : PAS WANNEER "SPACE" KLIKT
        //overviewComponent = new OverviewComponent();
        //addchilden via starling?

        slideComponent = new SlideComponent();
        //addchilden via starling?

        //LOAD XML!
        appModel.load("assets/xml/presentation.xml");

    }
/*-------------------------------------------------------------------------//
//------------    SWITCHEN TUSSEN SLIDES MET PIJLTJES     --------------//
//------------------------------------------------------------------------*/

    private function addedToStageHandler(event:Event):void
    {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
    }

    private function keyHandler(event:KeyboardEvent):void {
        switch (event.keyCode)
        {
            case Keyboard.LEFT:
                appModel.goToPreviousSlide();
            break;

            case Keyboard.RIGHT:
                appModel.goToNextSlide();
            break;

            case Keyboard.SPACE:
                showOverview();
                break;
        }
    }

    private function showOverview():void {

        if(overviewComponent==null){
            overviewComponent = new OverviewComponent();
            addChild(overviewComponent);
            overviewComponent.y = 768;
        }

        if(overviewComponent.y == 568){
            TweenLite.to(overviewComponent, 1, {y:768});
        }else{
            TweenLite.to(overviewComponent, 1, {y:568});
        }

    }


}
}
