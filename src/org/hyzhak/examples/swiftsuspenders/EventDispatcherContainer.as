package org.hyzhak.examples.swiftsuspenders
{
	import flash.events.IEventDispatcher;

	public class EventDispatcherContainer
	{
		private var _dispatcher : IEventDispatcher;
		
		[Inject]
		public function get dispatcher():IEventDispatcher
		{
			return _dispatcher;
		}

		public function set dispatcher(value:IEventDispatcher):void
		{
			_dispatcher = value;
		}

	}
}