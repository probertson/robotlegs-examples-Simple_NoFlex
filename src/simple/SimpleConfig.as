package simple
{
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	
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
	
	public class SimpleConfig
	{
		[Inject]
		public var injector:Injector
		
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[PostConstruct]
		public function startup():void
		{
			commandMap.map(SimpleAppEvent.CHOOSE_FILE, SimpleAppEvent).toCommand(ChooseFileCommand);
			commandMap.map(FileResultEvent.FILE_RESULT, FileResultEvent).toCommand(SetSelectedFileCommand);
			
			injector.map(IFileService).toSingleton(FileService);
			
			injector.map(SimpleModel).asSingleton();
			
			mediatorMap.mapView(ButtonContainer).toMediator(ButtonContainerMediator);
			mediatorMap.mapView(TextContainer).toMediator(TextContainerMediator);
		}
	}
}