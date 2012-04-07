package simple.controller
{
	import simple.service.IFileService;
	
	public class ChooseFileCommand
	{
		[Inject]
		public var fileService:IFileService;
		
		
		public function execute():void
		{
			fileService.promptToChooseFile();
		}
	}
}