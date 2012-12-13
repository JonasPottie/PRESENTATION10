/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 7/11/12
 * Time: 08:44
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.model {
import be.devine.cp3.service.XmlService;
import be.devine.cp3.vo.PageVO;
import flash.events.Event;
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher
    {
        public static const CURRENT_SLIDE_CHANGED:String = "CURRENT_SLIDE_CHANGED";
        public static const XML_URL_CHANGED:String = "XML_URL_CHANGED";
        public static const XML_URL_LOADED:String = "XML_URL_LOADED";
        public static const THUMB_POS_CHANGED:String = "THUMB_POS_CHANGED";
        public static const STAGE_SIZE_CHANGED:String = "STAGE_SIZE_CHANGED";


        private var _currentSlideIndex:int;
        private var _xmlUrl:String;
        private var _pages:Vector.<PageVO>;
        private var _stageWidth:Number;
        private var _stageHeight:Number;


        public var overViewActive:Boolean;
        public var fullScreen:Boolean;


        private var _thumbPosition:Number;
        private var xmlService:XmlService;

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

        pages = new Vector.<PageVO>();
        xmlService = new XmlService();
    }

/*-------------------------------------------------------------------------//
//--------------------------- LOAD XML ----------------------------//
//-------------------------------------------------------------------------*/

   public function load(xmlPath:String)
   {
        xmlUrl = xmlPath;
   }

    public function get xmlUrl():String
    {
        return _xmlUrl;
    }

    public function set xmlUrl(value:String):void
    {
        if(_xmlUrl != value)
        {
            _xmlUrl = value;
            xmlService.load(value);
        }
    }

    public function xmlLoaded():void
    {
        trace("[APPMODEL] XMLloaded func");
        dispatchEvent(new Event(XML_URL_LOADED));
    }


    public function xmlChanged():void
    {
        trace("[APPMODEL] XMLCanged func");
        dispatchEvent(new Event(XML_URL_CHANGED));
    }
/*-------------------------------------------------------------------------//
//------------    NEXT AND PREVIOUS SLIDE     --------------//
//------------------------------------------------------------------------*/

    public function goToPreviousSlide():void
    {
       currentSlideIndex --;
    }

    public function goToNextSlide():void
    {
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
        value = Math.max(0, Math.min(value, pages.length - 1));
        if(_currentSlideIndex != value)
        {
            _currentSlideIndex = value;
            dispatchEvent(new flash.events.Event(CURRENT_SLIDE_CHANGED));
        }
    }

/*-------------------------------------------------------------------------//
//-----------        SLIDES IN VECTOR [XML FORMAT]         ----------//
//-------------------------------------------------------------------------*/

    public function get pages():Vector.<PageVO> {
        return _pages;
    }

    public function set pages(value:Vector.<PageVO>):void
    {
        if(_pages != value)
        {
            _pages = value;
        }
    }

/*-------------------------------------------------------------------------//
//-----------       SINGLETON INTERNE CLASS        ----------//
//-------------------------------------------------------------------------*/

    public function get stageWidth():Number {
        return _stageWidth;
    }

    public function set stageWidth(value:Number):void {
        if(_stageWidth != value)
        {
            _stageWidth = value;
        }
        dispatchEvent(new Event(STAGE_SIZE_CHANGED));
    }

    public function get stageHeight():Number {
        return _stageHeight;
    }

    public function set stageHeight(value:Number):void {
        if(_stageHeight != value)
        {
            _stageHeight = value;
        }

        dispatchEvent(new Event(STAGE_SIZE_CHANGED));
    }

    public function get thumbPosition():Number {
        return _thumbPosition;
    }

    public function set thumbPosition(value:Number):void {
        if(_thumbPosition != value)
        {
            _thumbPosition = value;
        }
        dispatchEvent(new Event(THUMB_POS_CHANGED));

    }
}
}

internal class Enforcer{};
