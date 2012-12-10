/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 09:57
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.service {
import be.devine.cp3.factory.vo.PageVOFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.queue.Queue;
import be.devine.cp3.queue.XMLTask;

import flash.events.Event;
import flash.events.EventDispatcher;

public class XmlService extends EventDispatcher{

    private var queue:Queue;
    private var pageVOFactory:PageVOFactory
    private var xmlPath:String;

    private var appModel:AppModel;

    public function XmlService()
    {

    }

    public function load(xml:String):void
    {
        this.xmlPath = xml;
        queue = new Queue();
        queue.addEventListener( Event.COMPLETE, queueCompleteHandler );
        queue.add( new XMLTask(xmlPath));
        queue.start();
    }

    private function queueCompleteHandler(event:Event):void
    {
        pageVOFactory = new PageVOFactory();
        appModel = AppModel.getInstance();

        for each( var task:XMLTask in queue.completedItems )
        {
            var ingeladenXML:XML = new XML(task.data);

            for each(var page:XML in ingeladenXML.page)
            {
               appModel.pages.push(pageVOFactory.createPageVOFromXML(page));
            }

            appModel.xmlLoaded();
        }
    }
}
}
