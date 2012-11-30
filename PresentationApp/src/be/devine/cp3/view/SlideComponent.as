/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 26/11/12
 * Time: 11:36
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.model.AppModel;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.model.PageVo;
import be.devine.cp3.view.slideType.Content;
import be.devine.cp3.view.slideType.Media;
import be.devine.cp3.view.slideType.Title;

import flash.display.MovieClip;

import flash.display.Sprite;
import flash.events.Event;

public class SlideComponent extends Sprite{

    private var appModel:AppModel;
    private var pageVO:PageVo;

    private var itemContainer:Sprite;

    private var title:Title;
    private var content:Content;
    private var media:Media;
    private var bg:TheBackground;

    public function SlideComponent()
    {
        this.appModel = AppModel.getInstance();
        this.addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        this.addEventListener(AppModel.CURRENT_SLIDE_CHANGED, createItems);

    }

    private function addedToStageHandler(event:Event):void
    {
        createItems();
    }

    private function createItems():void
    {

        //EM KOMT HIER ALTIJD IN ACHTER DAT DE SLIDEINDEX IS GESET, MAAR EM WILT NIET IN DIE IF LUS GAAN... EN KHEB HET AL OP DUUUST MANIEREN
        //GEBROBEERT OM DIE ITEMCONTAINER EERST LEEG TE MAKEN EN DAN WEER TE VULLEN, WANT NU ZET EM DE SLIDES OP ELKAAR... ENIG IDEE?
        if(itemContainer != null && itemContainer.parent != null)
        {
            itemContainer.parent.removeChild(itemContainer);
        }
        itemContainer = new Sprite();

        pageVO = new PageVo();
        var slide:PageVo =  appModel.pages[appModel.currentSlideIndex];



                bg = new TheBackground();
                bg.x = stage.stageWidth/2;
                bg.y = stage.stageHeight/2;
                bg.gotoAndStop(2);
                addChild(bg);

                title = new Title(slide.title);
                title.x = (slide.titleProp[0]);
                title.y = (slide.titleProp[1]);
                itemContainer.addChild(title);

                content = new Content(slide.content, slide.contentProp[2], slide.contentProp[3]);
                content.x = slide.contentProp[0]
                content.y = slide.contentProp[1]
                itemContainer.addChild(content);

                media = new Media(slide.image, 450, 600);
                media.x = slide.imageProp[0];
                media.y = slide.imageProp[1];
                itemContainer.addChild(media);


        addChild(itemContainer);
    }




}
}
