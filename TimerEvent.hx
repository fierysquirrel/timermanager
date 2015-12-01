package;

/**
 * ...
 * @author Fiery Squirrel
 */
class TimerEvent extends GameEvent
{
	public static var TYPE : String;
	
	public var duration : Float;
	public var onComplete : Void -> Void;
	public var onRunning : Float -> Void;
	
	/*
	 * duration in milliseconds
	 * */
	public function new(source:String,duration : Float = 0, onComplete : Void -> Void = null, onRunning : Float -> Void = null, bubbles:Bool=false, cancelable:Bool=false) 
	{
		super(TYPE, source, bubbles, cancelable);
		
		this.duration = duration;
		this.onComplete = onComplete;
		this.onRunning = onRunning;
	}
}