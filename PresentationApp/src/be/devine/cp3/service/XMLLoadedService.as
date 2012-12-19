/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 11/12/12
 * Time: 16:17
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.service {

import be.devine.cp3.factory.vo.PageVOFactory;
import be.devine.cp3.model.AppModel;
import be.devine.cp3.queue.Queue;
import be.devine.cp3.queue.XMLTask;
import be.devine.cp3.view.OverviewComponent;
import flash.events.Event;
import flash.events.FileListEvent;
import flash.filesystem.File;
import flash.net.FileFilter;

public class XMLLoadedService extends File{

    private var q:Queue;
    private var appModel:AppModel;
    private var pageVOFactory:PageVOFactory;
    private var ovc:OverviewComponent;


    public static const WRONG_FILETYPE:String = "wrong filetype";


    public function XMLLoadedService()
    {
        this.appModel = AppModel.getInstance();
        this.browseForOpenMultiple('Selecteer XML-Bestand.', [new FileFilter('Xml', '*.xml')]);
        this.addEventListener(FileListEvent.SELECT_MULTIPLE, selectHandler);
    }

    private function selectHandler(e:FileListEvent):void
    {
        var currentXML:String = e.files[0].name.toString();
        currentXML = currentXML.split(".xml").join("");
       appModel.currentXML =  currentXML;



        q = new Queue();
        q.addEventListener(Event.COMPLETE, qCompleteHandler);

        for(var i:uint = 0; i<e.files.length; i++){
            q.add(new XMLTask(e.files[i].url));
        }
        q.start();
    }


    private function qCompleteHandler(e:Event):void
    {
        pageVOFactory = new PageVOFactory();
        appModel = AppModel.getInstance();

        for each( var task:XMLTask in q.completedItems )
        {
            var ingeladenXML:XML = new XML(task.data);
            appModel.pages.splice(0, appModel.pages.length);
            appModel.currentSlideIndex =0;

            for each(var page:XML in ingeladenXML.page)
            {
                appModel.pages.push(pageVOFactory.createPageVOFromXML(page));
            }
            appModel.xmlChanged();
        }
        dispatchEvent(new Event(Event.COMPLETE));
    }
    }
}
