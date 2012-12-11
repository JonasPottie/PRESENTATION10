/**
 * Created with IntelliJ IDEA.
 * User: jonas
 * Date: 11/12/12
 * Time: 16:17
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.service {
import be.devine.cp3.utils.DisplayToTexture;

import flash.display.DisplayObject;
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.DataEvent;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.net.FileFilter;
import flash.net.FileReference;
import flash.net.URLRequest;
import flash.net.URLRequestMethod;
import flash.utils.ByteArray;

import starling.display.Quad;


public class XMLLoadedService extends starling.display.Sprite{

    private var mFileReference:FileReference;
    private var container:Sprite;
    private var displayToTexture:DisplayToTexture;



    public function XMLLoadedService()
    {
        displayToTexture = new DisplayToTexture();


        trace("[XMLLOADEDSERVICE] IMPORTED");
        mFileReference=new FileReference();
        mFileReference.addEventListener(Event.SELECT, onFileSelected);
        var swfTypeFilter:FileFilter = new FileFilter("SWF/JPG/PNG Files","*.jpeg; *.jpg;*.gif;*.png");
        var allTypeFilter:FileFilter = new FileFilter("All Files (*.*)","*.*");
        mFileReference.browse([swfTypeFilter, allTypeFilter]);


        container = new flash.display.Sprite();
        container.alpha=.3;
    }

    function onFileSelected(event:Event):void
    {
        trace("onFileSelected");
        // This callback will be called when the file is uploaded and ready to use
        mFileReference.addEventListener(Event.COMPLETE, onFileLoaded);
        // This callback will be called if there's error during uploading
        mFileReference.addEventListener(IOErrorEvent.IO_ERROR, onFileLoadError);
        mFileReference.addEventListener(ProgressEvent.PROGRESS, onProgress);
        mFileReference.load();
    }

    function onProgress(event:ProgressEvent):void
    {
        var percentLoaded:Number=event.bytesLoaded/event.bytesTotal*100;
        trace("loaded: "+percentLoaded+"%");
    }

    function onFileLoaded(event:Event):void
    {
        var fileReference:FileReference=event.target as FileReference;
        var data:ByteArray=fileReference["data"];
        trace("File loaded");
        var movieClipLoader:Loader=new Loader();
        movieClipLoader.loadBytes(data);
        movieClipLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onMovieClipLoaderComplete);
        mFileReference.removeEventListener(Event.COMPLETE, onFileLoaded);
        mFileReference.removeEventListener(IOErrorEvent.IO_ERROR, onFileLoadError);
        mFileReference.removeEventListener(ProgressEvent.PROGRESS, onProgress);
    }

    function onFileLoadError(event:Event):void
    {

    }

    function onMovieClipLoaderComplete(event:Event):void
    {
        var loadedContent:DisplayObject=event.target.content;
        var loader:Loader=event.target.loader as Loader;
        trace("loadedContent.width="+loadedContent.width);
        trace("loadedContent.scaleX="+loadedContent.scaleX);
        trace("loader= "+loader);
        var filename:String=mFileReference.name;
        trace("filename " +filename);
        container.addChild(loader);
        var urlRequest:URLRequest = new URLRequest("http://student.howest.be/jonas.pottie/20122013/CPIII/phpxml/upload.php");
        urlRequest.method = URLRequestMethod.POST;
        mFileReference.addEventListener(ProgressEvent.PROGRESS, onProgress);
        mFileReference.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,onUploadComplete);
        mFileReference.upload(urlRequest);
    }

    function onUploadComplete(event:Event):void
    {
        trace("complete");
        mFileReference.removeEventListener(ProgressEvent.PROGRESS, onProgress);
        mFileReference.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA,onUploadComplete);
    }







    }
}
