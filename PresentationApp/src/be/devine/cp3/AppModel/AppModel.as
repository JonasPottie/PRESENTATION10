/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 7/11/12
 * Time: 08:44
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.AppModel {
import flash.events.Event;
import flash.events.EventDispatcher;

public class AppModel extends EventDispatcher
    {
        public static const CURRENT_SLIDE_CHANGED:String = "CURRENT_SLIDE_CHANGED";
        public static const XML_URL_CHANGED:String = "XML_URL_CHANGED";

        private var _currentSlideIndex:int;
        private var _xmlUrl:String;
        private var _xmlSlides:Vector.<XML>;




    public function AppModel()
    {

    }

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


    public function get currentSlideIndex():int {

        // currentSlideIndex
        return _currentSlideIndex;
        trace("SELECTED_IMAGE_INDEX_GET: " + _currentSlideIndex)
    }

    public function set currentSlideIndex(value:int):void {

        value = Math.max(0, Math.min(value, _xmlSlides.length - 1));
        if(_currentSlideIndex != value)
        {
            _currentSlideIndex = value;
            trace("SELECTED_SLIDE_INDEX_SET: " + _currentSlideIndex)
            dispatchEvent(new Event(CURRENT_SLIDE_CHANGED));
        }
    }

    public function get xmlSlides():Vector.<XML> {
        return _xmlSlides;
    }

    public function set xmlSlides(value:Vector.<XML>):void
    {
        //xmlSlide's in appmodel opslaan voor navigatie
        if(_xmlSlides != value)
        {
            _xmlSlides = value;
        }
    }

    public function get xmlUrl():String {
        return _xmlUrl;
    }

    public function set xmlUrl(value:String):void {

        // Kijken of er nieuwe xml wordt ingeladen
        if(_xmlUrl != value)
        {
            _xmlUrl = value;
            trace("XML CHANGED: " + _xmlSlides)
            dispatchEvent(new Event(XML_URL_CHANGED));
        }
    }
}
}
