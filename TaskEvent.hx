package;

/**
 * ...
 * @author Fiery Squirrel
 */
class TaskEvent extends GameEvent
{
	public static var TYPE : String = "TASK_EVENT";
	
	public var goal : Float;
	public var ini : Float;
	public var step : Float;
	public var onComplete : Void -> Void;
	public var onRunning : Float -> Void;
	
	/*
	 * duration in milliseconds
	 * */
	public function new(source:String,goal : Float = 0,ini : Float = 0,step : Float = 0, onComplete : Void -> Void = null, onRunning : Float -> Void = null, bubbles:Bool=false, cancelable:Bool=false) 
	{
		super(TYPE, source, bubbles, cancelable);
		
		this.goal = goal;
		this.ini = ini;
		this.step = step;
		this.onComplete = onComplete;
		this.onRunning = onRunning;
	}
}