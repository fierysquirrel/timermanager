package;

enum TimerType
{
	Forward;
	Backward;
}

class Timer extends Task
{
	private var type : TimerType;
	private var duration : Float;
	
	/*
	 * Timer
	 * @duration: in milliseconds
	 */
	public function new(duration : Float,type : TimerType = null, onComplete : Void -> Void,onRunning : Float -> Void = null) 
	{
		var goal, ini : Float;
		
		this.type = type == null ? TimerType.Backward : type;
		
		this.duration = duration;
		goal = 0.0;
		ini = 0.0;
		switch(type)
		{
			case TimerType.Forward:
				goal = duration;
				ini = 0;
			case TimerType.Backward:
				goal = 0;
				ini = duration;
		}
		super(goal,ini, 0, onComplete, onRunning,true);
	}
	
	public function GetDuration() : Float
	{
		return duration;
	}
	
	override public function Update(gameTime:Float):Void 
	{
		step = gameTime;
		
		super.Update(gameTime);
	}
}