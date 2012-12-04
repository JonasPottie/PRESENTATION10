/**
 * Created with IntelliJ IDEA.
 * User: laurensdhondt
 * Date: 3/12/12
 * Time: 13:14
 * To change this template use File | Settings | File Templates.
 */
package be.devine.cp3.view {
import be.devine.cp3.utils.DisplayToTexture;
import be.devine.cp3.vo.ContentElementVO;
import be.devine.cp3.vo.VideoElementVO;

import flash.media.Video;

import flash.net.NetConnection;
import flash.net.NetStream;

import starling.core.Starling;

import starling.display.Quad;
import starling.display.Sprite;
import starling.text.TextField;
import starling.utils.HAlign;

public class VideoElement extends Element{

    private var textfield:TextField;
    private var content:Sprite;
    private var fontContainer:FontContainer;
    private var video:Video;
    private var displayToTexture:DisplayToTexture;


    public function VideoElement(videoElementVO:VideoElementVO)
    {
        super(videoElementVO);

        content = new Sprite();
        content.x = videoElementVO.x;
        content.y = videoElementVO.y;
        addChild(content);


        var nc:NetConnection = new NetConnection();
        nc.connect(null);
        var ns:NetStream = new NetStream(nc);
        ns.client = {
            onMetaData: function (...rest):void{}
        };

        video = new Video(videoElementVO.x, videoElementVO.y);
        video.attachNetStream(ns);
        //content.add(video);
        //ns.play(videoElementVO.url);

    }
}
}
