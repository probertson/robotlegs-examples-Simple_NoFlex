package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import simple.SimpleContext;
	import simple.view.ButtonContainer;
	import simple.view.TextContainer;
	
	public class RobotlegsSimple extends Sprite
	{
		private var _buttonContainer:ButtonContainer;
		private var _textContainer:TextContainer;

		private var _context:SimpleContext;
		
		
		public function RobotlegsSimple()
		{
			_initialize();
		}
		
		
		private function _initialize():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_context = new SimpleContext();
			_context.contextView = this;
			
			addEventListener(Event.ADDED_TO_STAGE, _onApplication_AddedToStageHandler);
		}
		
		
		private function _onApplication_AddedToStageHandler(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, _onApplication_AddedToStageHandler);
			
			_createChildren();
			stage.nativeWindow.visible = true;
		}
		
		
		private function _createChildren():void
		{
			_buttonContainer = new ButtonContainer();
			_buttonContainer.x = 30;
			_buttonContainer.y = 50;
			addChild(_buttonContainer);
			
			_textContainer = new TextContainer();
			_textContainer.x = 30;
			_textContainer.y = 90;
			addChild(_textContainer);
		}
	}
}