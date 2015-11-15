package;

class Timer
{
	private var duration : Float;
	private var hasEnded : Bool;
	private var timer : Float;
	private var onRunning : Float -> Void;
	private var onComplete : Void -> Void;
	
	/*
	 * Timer
	 * @duration: in milliseconds
	 */
	public function new(duration : Float, onComplete : Void -> Void,onRunning : Float -> Void = null) 
	{
		this.duration = duration;
		this.onRunning = onRunning;
		this.onComplete = onComplete;
		hasEnded = false;
		timer = 0;
	}
	public function HasEnded() : Bool
	{
		return hasEnded;
	}
	
	public function GetDuration() : Float
	{
		return duration;
	}
	
	public function Update(gameTime : Float) : Void
	{
		if (timer >= duration)
		{
			hasEnded = true;
			onComplete();
		}
		else
		{
			if(onRunning != null)
				onRunning(timer);
				
			timer += gameTime;
		}
	}
}