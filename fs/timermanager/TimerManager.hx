package fs.timermanager;

/**
 * ...
 * @author Fiery Squirrel
 */
class TimerManager
{
	private var timers : Array<Timer>;
	/*
	 * Constructor
	 */
	public function new() 
	{
		timers = new Array<Timer>();
	}
	
	public function Update(gameTime : Float) : Void
	{
		for (t in timers)
		{
			t.Update(gameTime);
			if (t.HasEnded())
				timers.remove(t);
		}
	}
	/*
	 * duration in milliseconds
	 * */
	public function StartTimerTask(duration : Float, onComplete : Void -> Void, onRunning : Float -> Void = null) : Void
	{
		var timer : Timer;
		
		timer = new Timer(duration, onComplete, onRunning);
		timers.push(timer);
	}
}