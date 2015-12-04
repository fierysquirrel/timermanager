package;

class Task
{
	private var hasEnded : Bool;
	private var onRunning : Float -> Void;
	private var onComplete : Void -> Void;
	private var goal : Float;
	private var step : Float;
	private var curr : Float;
	private var dir : Float;
	
	/*
	 * Timer
	 * @duration: in milliseconds
	 */
	public function new(goal : Float = 0, ini : Float = 0, step : Float = 0,onComplete : Void -> Void = null,onRunning : Float -> Void = null) 
	{
		this.goal = goal;
		this.curr = ini;
		this.step = step;
		this.onRunning = onRunning;
		this.onComplete = onComplete;
		hasEnded = false;
		
		dir = goal > ini ? 1 : -1;
	}
	public function HasEnded() : Bool
	{
		return hasEnded;
	}
	
	public function Update(gameTime : Float) : Void
	{
		if (((dir > 0) && (curr >= goal)) || ((dir < 0) && (curr <= goal)))
		{
			hasEnded = true;
			if(onComplete != null)
				onComplete();
		}
		else
		{
			if(onRunning != null)
				onRunning(curr);
				
			curr += Math.abs(step) * dir;
		}
	}
}