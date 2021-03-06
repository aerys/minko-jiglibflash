package aerys.minko.scene.node.group.jiglib
{
	import aerys.minko.ns.minko;
	import aerys.minko.scene.action.group.jiglib.PopPhysicsSkinAction;
	import aerys.minko.scene.action.group.jiglib.PushPhysicsSkinAction;
	import aerys.minko.scene.node.group.Group;
	
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	
	import jiglib.data.TriangleVertexIndices;
	import jiglib.physics.RigidBody;
	import jiglib.plugin.IPhysicsSkin;
	
	public class AbstractSkinGroup extends Group implements IPhysicsSkin
	{
		use namespace minko;
		
		private var _body		: RigidBody			= null;
		private var _matrix		: Matrix3D			= new Matrix3D();
		
		public function get rigidBody() : RigidBody							{ return _body; }
		public function get vertices()	: Vector.<Vector3D>					{ return null; }
		public function get indices()	: Vector.<TriangleVertexIndices>	{ return null; }
		
		public function set transform(matrix : Matrix3D) : void
		{
			_matrix = matrix;
		}
		
		public function get transform() : Matrix3D
		{
			return _matrix;
		}
		
		public function AbstractSkinGroup(rigidBody : RigidBody, ...children)
		{
			super(children);
			
			_body = rigidBody;
			
			actions.unshift(PushPhysicsSkinAction.pushPhysicsSkinAction);
			actions.push(PopPhysicsSkinAction.popPhysicsSkinAction);
		}
	}
}