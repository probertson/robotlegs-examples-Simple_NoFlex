package simple.controller
{
	import org.robotlegs.mvcs.Command;
	
	import simple.service.IFileService;
	
	public class ChooseFileCommand extends Command
	{
		[Inject]
		public var fileService:IFileService;
		
		
		override public function execute():void
		{
			fileService.promptToChooseFile();
		}
	}
}