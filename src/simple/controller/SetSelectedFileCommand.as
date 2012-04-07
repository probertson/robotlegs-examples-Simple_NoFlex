package simple.controller
{
	import simple.events.FileResultEvent;
	import simple.model.SimpleModel;
	
	public class SetSelectedFileCommand
	{
		[Inject]
		public var event:FileResultEvent;
		
		[Inject]
		public var simpleModel:SimpleModel;
		
		
		public function execute():void
		{
			simpleModel.fileName = event.fileName;
			simpleModel.filePath = event.filePath;
		}
	}
}