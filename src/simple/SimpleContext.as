package simple
{
	import org.robotlegs.base.EventMap;
	import org.robotlegs.mvcs.Context;
	
	import simple.controller.ChooseFileCommand;
	import simple.controller.SetSelectedFileCommand;
	import simple.events.FileResultEvent;
	import simple.events.SimpleAppEvent;
	import simple.model.SimpleModel;
	import simple.service.FileService;
	import simple.service.IFileService;
	import simple.view.ButtonContainer;
	import simple.view.ButtonContainerMediator;
	import simple.view.TextContainer;
	import simple.view.TextContainerMediator;
	
	public class SimpleContext extends Context
	{
		override public function startup():void
		{
			commandMap.mapEvent(SimpleAppEvent.CHOOSE_FILE, ChooseFileCommand, SimpleAppEvent);
			commandMap.mapEvent(FileResultEvent.FILE_RESULT, SetSelectedFileCommand, FileResultEvent);
			
			injector.mapSingletonOf(IFileService, FileService);
			
			injector.mapSingleton(SimpleModel);
			
			mediatorMap.mapView(ButtonContainer, ButtonContainerMediator);
			mediatorMap.mapView(TextContainer, TextContainerMediator);
		}
	}
}