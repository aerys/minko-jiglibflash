package aerys.minko.scene.node.group.jiglib
{
	import jiglib.geometry.JBox;
	import jiglib.physics.RigidBody;
	
	public class BoxSkinGroup extends AbstractSkinGroup
	{
		public function get box() : JBox	{ return rigidBody as JBox; }
		
		public function BoxSkinGroup(width 	: Number,
								  	 depth 	: Number,
								 	 height : Number,
								  	 ...children)
		{
			super(new JBox(this, width, depth, height), children);
		}
	}
}