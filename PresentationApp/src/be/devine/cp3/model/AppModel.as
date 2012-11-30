/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 7/11/12
 * Time: 08:44
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model {
import flash.events.Event;
import flash.events.EventDispatcher;
import be.devine.cp3.queue.Queue;
import be.devine.cp3.queue.XMLTask;

public class AppModel extends EventDispatcher
    {
        public static const CURRENT_SLIDE_CHANGED:String = "CURRENT_SLIDE_CHANGED";
        public static const XML_URL_CHANGED:String = "XML_URL_CHANGED";
        public static const XML_URL_LOADED:String = "XML_URL_LOADED";

        private var _currentSlideIndex:int;
        private var _xmlUrl:String;
        private var _xmlSlides:Vector.<PageVo>;

        public var pageVo:PageVo;

        private var queue:Queue;
        private static var instance:AppModel;

/*-------------------------------------------------------------------------//
//--------------------------- SINGLETON ----------------------------//
//-------------------------------------------------------------------------*/

    public static function getInstance():AppModel {
        if(instance == null) {
            instance = new AppModel(new Enforcer());
        }
        return instance;
    }



    public function AppModel(e:Enforcer)
    {
        if(e == null) {
            throw new Error("model is a singleton, use getInstance() instead");
        }

        xmlSlides = new Vector.<PageVo>()
    }

/*-------------------------------------------------------------------------//
//--------------------------- LOAD XML ----------------------------//
//-------------------------------------------------------------------------*/

    public function load(url:String):void
    {
        xmlUrl = url;
    }

    private function xmlChangedHandler():void
    {
        queue = new Queue();
        queue.addEventListener( Event.COMPLETE, queueCompleteHandler );
        queue.add( new XMLTask("assets/xml/presentation.xml") );
        queue.start();
    }


    private function queueCompleteHandler( e:Event ):void
    {

        for each( var task:XMLTask in queue.completedItems )
        {
            var ingeladenXML:XML = new XML(task.data);

            // Onderstaande for lus moet nog herschreven worden zodat hij het aantal pages in de xml inlaat en je het nieuw manueel moet instellen.
            for (var pages:uint=0; pages<4; pages++)
            {
                // Elke page appart gaan opslaan in arrPage -> kan je makkelijk met indexen gaan werken...

                pageVo = new PageVo()
                pageVo.title = ingeladenXML.page[pages].contentTitle
                pageVo.titleProp = ingeladenXML.page[pages].@

                xmlSlides.push(pageVo);
            }

        }

        dispatchEvent(new Event(XML_URL_LOADED));

    }

    public function get xmlUrl():String {
        return _xmlUrl;
    }

    public function set xmlUrl(value:String):void
    {

        if(_xmlUrl != value)
        {
            _xmlUrl = value;
            trace("XML CHANGED")
            xmlChangedHandler();
            dispatchEvent(new Event(XML_URL_CHANGED));
        }
    }

/*-------------------------------------------------------------------------//
//------------    NEXT AND PREVIOUS SLIDE     --------------//
//------------------------------------------------------------------------*/

    public function goToPreviousSlide():void
    {
       // Functie om naar vorige slide te gaan
        trace("PREVIOUS SLIDE");
       currentSlideIndex --;
    }

    public function goToNextSlide():void
    {
       // Functie om naar volgende slide te gaan
        trace("NEXT SLIDE")
      currentSlideIndex ++;
    }

/*-------------------------------------------------------------------------//
//------------    SLIDE INDEX => CURRENTSLIDE   --------------//
//------------------------------------------------------------------------*/

    public function get currentSlideIndex():int
    {
        return _currentSlideIndex;
    }

    public function set currentSlideIndex(value:int):void
    {
        value = Math.max(0, Math.min(value, _xmlSlides.length - 1));
        if(_currentSlideIndex != value)
        {
            _currentSlideIndex = value;
            dispatchEvent(new Event(CURRENT_SLIDE_CHANGED));
        }
    }

/*-------------------------------------------------------------------------//
//-----------        SLIDES IN VECTOR [XML FORMAT]         ----------//
//-------------------------------------------------------------------------*/

    public function get xmlSlides():Vector.<PageVo> {
        return _xmlSlides;
    }

    public function set xmlSlides(value:Vector.<PageVo>):void
    {
        if(_xmlSlides != value)
        {
            _xmlSlides = value;
        }
    }
}
}

/*-------------------------------------------------------------------------//
 //-----------       SINGLETON INTERNE CLASS        ----------//
 //-------------------------------------------------------------------------*/

internal class Enforcer{};
