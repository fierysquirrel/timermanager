package;

class Task
{
	private var hasEnded : Bool;
	private var onRunningMethods : Array<Float -> Void>;
	private var onCompleteMethods : Array<Void -> Void>;
	private var goal : Float;
	private var step : Float;
	private var curr : Float;
	private var dir : Float;
	private var isRunning : Bool;
	
	/*
	 * Timer
	 * @duration: in milliseconds
	 */
	public function new(goal : Float = 0, ini : Float = 0, step : Float = 0,onComplete : Void -> Void = null,onRunning : Float -> Void = null, isRunning : Bool = false) 
	{
		this.goal = goal;
		this.curr = ini;
		this.step = step;
		this.onRunningMethods = new Array<Float -> Void>();
		this.onCompleteMethods = new Array<Void -> Void>();
		this.isRunning = isRunning;
		hasEnded = false;
		
		dir = goal > ini ? 1 : -1;
		
		if (onComplete != null)
			AddOnCompleteMethod(onComplete);
			
		if (onRunning != null)
			AddOnRunningMethod(onRunning);
	}
	
	public function AddOnCompleteMethod(method : Void -> Void) : Void
	{
		onCompleteMethods.push(method);
	}
	
	public function AddOnRunningMethod(method : Float -> Void) : Void
	{
		onRunningMethods.push(method);
	}
	
	public function HasEnded() : Bool
	{
		return hasEnded;
	}
	
	public function GetCurrentTime() : Float
	{
		return curr;
	}
	
	public function Update(gameTime : Float) : Void
	{
		if (isRunning)
		{
			if (((dir > 0) && (curr >= goal)) || ((dir < 0) && (curr <= goal)))
			{
				hasEnded = true;
				for(method in onCompleteMethods)
					method();
			}
			else
			{
				for(method in onRunningMethods)
					method(curr);
					
				curr += Math.abs(step) * dir;
			}
		}
	}
	
	public function Run() : Void
	{
		isRunning = true;
	}
	
	public function Stop() : Void
	{
		isRunning = false;
	}
	
	public function IsRunning() : Bool
	{
		return isRunning;
	}
}