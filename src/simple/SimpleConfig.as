package simple
{
	import org.robotlegs.core.ICommandMap;
	import org.robotlegs.core.IMediatorMap;
	import org.swiftsuspenders.Injector;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	
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
		public var rl1CommandMap:ICommandMap;
		
		[Inject]
		public var commandMap:IEventCommandMap;
		
		[PostConstruct]
		public function startup():void
		{
//			rl1CommandMap.mapEvent(SimpleAppEvent.CHOOSE_FILE, ChooseFileCommand, SimpleAppEvent);
			commandMap.map(SimpleAppEvent.CHOOSE_FILE, SimpleAppEvent).toCommand(ChooseFileCommand);
			rl1CommandMap.mapEvent(FileResultEvent.FILE_RESULT, SetSelectedFileCommand, FileResultEvent);
			
//			rl1Injector.mapSingletonOf(IFileService, FileService);
			injector.map(IFileService).toSingleton(FileService);
			
//			rl1Injector.mapSingleton(SimpleModel);
			injector.map(SimpleModel).asSingleton();
			
			mediatorMap.mapView(ButtonContainer, ButtonContainerMediator);
			mediatorMap.mapView(TextContainer, TextContainerMediator);
		}
	}
}