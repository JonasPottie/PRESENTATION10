/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 26/11/12
 * Time: 11:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.model.PageVo;
import be.devine.cp3.view.slideType.Content;
import be.devine.cp3.view.slideType.Media;
import be.devine.cp3.view.slideType.Title;
import flash.display.Sprite;
import flash.events.Event;

import starling.display.Sprite;

public class SlideComponent extends starling.display.Sprite{

    private var appModel:AppModel;
    private var pageVO:PageVo;

    private var itemContainer:Sprite;

    private var title:Title;
    private var content:Content;
    private var media:Media;


    private var explicitWidth:Number;
    private var explicitHeight:Number;

    public function SlideComponent()
    {
        this.appModel = AppModel.getInstance();
        appModel.addEventListener(AppModel.CURRENT_SLIDE_CHANGED, check);
        createItems();
    }


    private function check(event:Event):void
    {
        trace("HELLLO");
        removeChild(itemContainer, false);
        createItems();


    }

    private function createItems():void
    {
        trace("HELLLO2");

        itemContainer = new Sprite();

        pageVO = new PageVo();
        var slide:PageVo =  appModel.pages[appModel.currentSlideIndex];

                title = new Title(slide.title,slide.titleProp[2],slide.titleProp[3],slide.titleProp[4]);
                title.x = (slide.titleProp[0]);
                title.y = (slide.titleProp[1]);
                itemContainer.addChild(title);

                content = new Content(slide.content, slide.contentProp[2], slide.contentProp[3]);
                content.x = slide.contentProp[0];
                content.y = slide.contentProp[1];
                itemContainer.addChild(content);

                media = new Media(slide.image, 450, 600);
                media.x = slide.imageProp[0];
                media.y = slide.imageProp[1];
                itemContainer.addChild(media);


        addChild(itemContainer);
    }




}
}
