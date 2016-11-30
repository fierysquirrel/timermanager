package;

/**
 * ...
 * @author Fiery Squirrel
 */
class TimerManager
{
	private var tasks : Array<Task>;
	/*
	 * Constructor
	 */
	public function new() 
	{
		tasks = new Array<Task>();
	}
	
	public function Update(gameTime : Float) : Void
	{
		for (t in tasks)
		{
			t.Update(gameTime);
			if (t.HasEnded())
				tasks.remove(t);
		}
	}
	
	/*
	 * duration in milliseconds
	 * */
	public function StartTimerTask(duration : Float, onComplete : Void -> Void, onRunning : Float -> Void = null) : Void
	{
		var timer : Timer;
		
		timer = new Timer(duration,Timer.TimerType.Forward, onComplete, onRunning);
		tasks.push(timer);
	}
	
	/*
	 * duration in milliseconds
	 * */
	public function StartTask(goal : Float,ini : Float, step : Float, onComplete : Void -> Void, onRunning : Float -> Void = null) : Void
	{
		var task : Task;
		
		task = new Task(goal, ini, step, onComplete, onRunning,true);
		tasks.push(task);
	}
	
	public function Clean() : Void
	{
		while (tasks.length > 0)
			tasks.pop().Stop();
	}
}