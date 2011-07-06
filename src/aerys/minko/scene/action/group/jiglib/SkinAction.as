package aerys.minko.scene.action.group.jiglib
{
	import aerys.minko.render.renderer.IRenderer;
	import aerys.minko.scene.action.ActionType;
	import aerys.minko.scene.action.IAction;
	import aerys.minko.scene.node.IScene;
	import aerys.minko.scene.visitor.ISceneVisitor;
	import aerys.minko.type.math.Matrix4x4;
	
	import jiglib.plugin.ISkin3D;
	
	public class SkinAction implements IAction
	{
		private static const TYPE		: uint				= ActionType.UPDATE_LOCAL_DATA;
		private static const TMP_VECTOR	: Vector.<Number>	= new Vector.<Number>(16);
		private static const TMP_MATRIX	: Matrix4x4			= new Matrix4x4();
		
		public function get type() : uint		{ return TYPE; }
		
		public function prefix(scene : IScene, visitor : ISceneVisitor, renderer : IRenderer) : Boolean
		{
			var skin : ISkin3D = scene as ISkin3D;
			
			skin.transform.copyRawDataTo(TMP_VECTOR);
			TMP_MATRIX.setRawData(TMP_VECTOR);
			
			visitor.localData.world.push()
								   .multiply(TMP_MATRIX);
			
			return true;
		}
		
		public function infix(scene : IScene, visitor : ISceneVisitor, renderer : IRenderer) : Boolean
		{
			return true;
		}
		
		public function postfix(scene : IScene, visitor : ISceneVisitor, renderer : IRenderer) : Boolean
		{
			visitor.localData.world.pop();
			
			return true;
		}
	}
}