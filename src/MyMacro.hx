package;
import haxe.macro.Context;
import haxe.macro.Expr;

class MyMacro {

	macro static public function initLocals():Expr {
		
		// Grab the variables accessible in the context the macro was called.
		var locals = Context.getLocalVars();
		var fields = Context.getLocalClass().get().fields.get();
		
		var exprs:Array<Expr> = [];
		for ( local in locals.keys()) {
			
			var isFound = false;
			
			for ( field in fields ) {
				if ( field.name == local ) {
					exprs.push( macro this.$local = $i{ local });
					trace( "created this." + field.name + " = " + local );
					isFound = true;
					break;
				}
			}
			
			if( !isFound ) {
				throw new Error( Context.getLocalClass() + " has no field " + local, Context.currentPos());
			}
		}
		// Generates a block expression from the given expression array
		return macro $b{ exprs };
	}
}