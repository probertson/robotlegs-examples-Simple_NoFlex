package simple.model
{
	import org.robotlegs.mvcs.Actor;
	
	public class SimpleModel extends Actor
	{
		private var _fileName:String;
		public function get fileName():String
		{
			return _fileName;
		}
		public function set fileName(value:String):void
		{
			_fileName = value;
		}

		
		private var _filePath:String;
		public function get filePath():String
		{
			return _filePath;
		}
		public function set filePath(value:String):void
		{
			_filePath = value;
		}
	}
}