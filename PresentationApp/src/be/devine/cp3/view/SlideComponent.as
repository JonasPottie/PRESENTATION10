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
import be.devine.cp3.view.slideType.Content;
import be.devine.cp3.view.slideType.Media;
import be.devine.cp3.view.slideType.Title;

import flash.display.MovieClip;

import flash.display.Sprite;
import flash.events.Event;

public class SlideComponent extends Sprite{

    private var appModel:AppModel;

    private var itemContainer:Sprite;

    private var title:Title;
    private var content:Content;
    private var media:Media;

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

        var slide:XML =  appModel.xmlSlides[appModel.currentSlideIndex];
        var slidetype:String = slide.@slideType;

        switch (slidetype)
        {
            case "TCM":

                title = new Title(slide.contentTitle);
                title.x = (stage.stageWidth/2) - (title.width/2);
                itemContainer.addChild(title);

                content = new Content(slide.contentText, 450, 600);
                content.x = 40;
                content.y = 60;
                itemContainer.addChild(content);

                media = new Media(slide.contentMedia, 450, 600);
                media.x = 534;
                media.y = 60;
                itemContainer.addChild(media);

                break;
        }

        addChild(itemContainer);
    }




}
}
