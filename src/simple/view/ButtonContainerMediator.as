package simple.view
{
	import org.robotlegs.mvcs.Mediator;
	
	import simple.events.SimpleAppEvent;
	
	public class ButtonContainerMediator extends Mediator
	{
		override public function onRegister():void
		{
			addViewListener(SimpleAppEvent.CHOOSE_FILE, dispatch, SimpleAppEvent);
		}
	}
}