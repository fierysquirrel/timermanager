package;

class Timer extends Task
{
	/*
	 * Timer
	 * @duration: in milliseconds
	 */
	public function new(duration : Float, onComplete : Void -> Void,onRunning : Float -> Void = null) 
	{
		super(duration, 0, 0, onComplete, onRunning);
	}
	
	public function GetDuration() : Float
	{
		return goal;
	}
	
	override public function Update(gameTime:Float):Void 
	{
		step = gameTime;
		
		super.Update(gameTime);
	}
}