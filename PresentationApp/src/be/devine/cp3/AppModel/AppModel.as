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
        private var _xmlChangedHandler:String;
        private var _imageUrls:Vector.<String>;




    public function AppModel()
    {

    }

    public function goToPreviousImage():void
    {
       // Functie om naar vorige slide te gaan
       currentSlideIndex --;
    }

    public function goToNextImage():void
    {
       // Functie om naar volgende slide te gaan
      currentSlideIndex ++;
    }


    public function get currentSlideIndex():int {

        // currentSlideIndex
        return _currentSlideIndex;
        trace("SELECTED_IMAGE_INDEX_GET: " + _currentSlideIndex)
    }

    public function set currentSlideIndex(value:int):void {

        // currentSlideIndex
        value = Math.max(0, Math.min(value, _imageUrls.length - 1));
        if(_currentSlideIndex != value)
        {
            _currentSlideIndex = value;
            trace("SELECTED_SLIDE_INDEX_SET: " + _currentSlideIndex)
            dispatchEvent(new Event(CURRENT_SLIDE_CHANGED));
        }
    }

    public function get xmlChangedHandler():String {
        return _xmlChangedHandler;
    }

    public function set xmlChangedHandler(value:String):void
    {
        // Kijken of er nieuwe xml wordt ingeladen
        if(_xmlChangedHandler != value)
        {
            _xmlChangedHandler = value;
            trace("XML CHANGED: " + _xmlChangedHandler)
            dispatchEvent(new Event(XML_URL_CHANGED));
        }
    }


}
}
