package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	/*import robotlegs.bender.framework.context.api.IContext;
	import robotlegs.bender.framework.context.impl.Context;*/
	
	import simple.SimpleConfig;
	import simple.view.ButtonContainer;
	import simple.view.TextContainer;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import robotlegs.bender.extensions.contextView.ContextView;
	
	public class RobotlegsSimple extends Sprite
	{
		private var _buttonContainer:ButtonContainer;
		private var _textContainer:TextContainer;

		//private var _context:IContext;
		
		private var _context:IContext;
		
		
		public function RobotlegsSimple()
		{
			_initialize();
		}
		
		
		/*private function _initialize():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_context = new Context()
				.extend(MVCSBundle)
				.configure(SimpleConfig, this);
			
			addEventListener(Event.ADDED_TO_STAGE, _onApplication_AddedToStageHandler);
		}*/
		
		
		private function _initialize():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_context = new Context()
				.install(MVCSBundle)
				.configure(SimpleConfig, new ContextView(this));
			
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