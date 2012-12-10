package be.devine.cp3.queue
{
import flash.events.Event;
import flash.net.URLLoader;
import flash.net.URLRequest;

public class XMLTask extends URLLoader implements ITask
    {
        private var _path:String;

        public function XMLTask(path:String)
        {
            _path = path;
        }

        public function start():void {
            this.load(new URLRequest(_path));
        }
    }
}