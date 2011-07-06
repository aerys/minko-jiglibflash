package aerys.minko.scene.node.group.jiglib
{
	import jiglib.geometry.JSphere;
	import jiglib.physics.RigidBody;
	
	public class SphereSkinGroup extends AbstractSkinGroup
	{
		public function SphereSkinGroup(radius : Number, ...children)
		{
			super(new JSphere(this, radius), children);
		}
	}
}