package simple.controller
{
	import org.robotlegs.mvcs.Command;
	
	import simple.events.FileResultEvent;
	import simple.model.SimpleModel;
	
	public class SetSelectedFileCommand extends Command
	{
		[Inject]
		public var event:FileResultEvent;
		
		[Inject]
		public var simpleModel:SimpleModel;
		
		
		override public function execute():void
		{
			simpleModel.fileName = event.fileName;
			simpleModel.filePath = event.filePath;
		}
	}
}