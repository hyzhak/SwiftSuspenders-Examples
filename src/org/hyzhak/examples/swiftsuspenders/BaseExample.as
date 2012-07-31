package org.hyzhak.examples.swiftsuspenders
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.swiftsuspenders.Injector;

	/**
	 * Examples by Till Schneidereit https://github.com/tschneidereit/SwiftSuspenders 
	 *  
	 * @author Eugene-Krevenets
	 * 
	 */
	public class BaseExample
	{
		public function BaseExample()
		{
			var injector : Injector = new Injector;
			
			//create a basic mapping:
			injector.map(Sprite); //will instantiate a new Sprite for each request for Sprite
			
			trace("injector.map(Sprite) => " + injector.getInstance(Sprite));
			trace();
			
			//map to another class:
			injector.map(Sprite).toType(BetterSprite); //will instantiate a new BetterSprite for each request for Sprite
			
			trace("injector.map(Sprite).toType(BetterSprite) => " + injector.getInstance(Sprite));
			trace();
			
			//map as a singleton:
			injector.map(EventDispatcher).asSingleton(); //will lazily create an instance and return it for each consecutive request
						
			trace("injector.map(EventDispatcher).asSingleton() => " + injector.getInstance(EventDispatcher));
			trace();
			//map an interface to a singleton:
			try
			{
				injector.map(IEventDispatcher).toSingleton(EventDispatcher);
				trace("injector.map(IEventDispatcher).toSingleton(EventDispatcher) => " + injector.getInstance(IEventDispatcher));
				trace();
			}
			catch(e : Error)
			{
				trace("injector.map(IEventDispatcher).toSingleton(EventDispatcher). doesn't work. because cyclic dependency in constructor.");
				trace();
			}
			
			injector.unmap(IEventDispatcher);
			
			//work
			injector.map(IEventDispatcher).toSingleton(MyEventDispatcher);
			
			trace("injector.map(IEventDispatcher).toSingleton(MyEventDispatcher) => " + injector.getInstance(IEventDispatcher));
			trace();
			
			injector.unmap(IEventDispatcher);
			
			//work also
			
			injector.map(IEventDispatcher).toValue(new EventDispatcher());
			
			trace("injector.map(IEventDispatcher).toValue(new EventDispatcher()) => " + injector.getInstance(IEventDispatcher));			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public.Methods
		//
		//--------------------------------------------------------------------------
		
	}
}