/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 23/11/12
 * Time: 12:09
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3 {
import be.devine.cp3.AppModel.AppModel;
import be.devine.cp3.queue.Queue;
import be.devine.cp3.queue.XMLTask;


import flash.display.Sprite;
import flash.events.Event;



public class Application extends Sprite{

    private var queue:Queue;
    private var appModel:AppModel;
    private var arrPages:Vector.<XML>;

    public function Application()
    {
        appModel = new AppModel();
        appModel.addEventListener(AppModel.XML_URL_CHANGED, xmlChangedHandler);
        appModel.xmlChangedHandler = "assets/xml/presentation.xml";
    }

    private function xmlChangedHandler(event:Event):void
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

            for (var pages:uint=0; pages<2; pages++)
            {
                // Elke page appart gaan opslaan in arrPage -> kan je makkelijk met indexen gaan werken...
                arrPages = new Vector.<XML>();
                arrPages.push(ingeladenXML.page[pages]);
                trace("[SLIDE " + pages + "]: " + arrPages);
            }

        }

        // kijken of we in bepaalde page content kan gaan ophalen -> WERKT!
        trace("[ACCESTEST]:" + arrPages[0].contentTitle);

    }
}
}
