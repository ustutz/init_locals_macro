package;

/**
 * ...
 * @author Urs Stutz
 */
class Test {
	
	public var name:String;
	public var x:Float;
	public var y:Float;

	public function new( name:String, x:Float, y:Float ) {
		MyMacro.initLocals();
	}
	
}