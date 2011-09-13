package aerys.minko.scene.action.group.jiglib
{
	import aerys.minko.render.renderer.IRenderer;
	import aerys.minko.scene.action.ActionType;
	import aerys.minko.scene.action.IAction;
	import aerys.minko.scene.node.IScene;
	import aerys.minko.scene.visitor.ISceneVisitor;
	import aerys.minko.type.math.Matrix3D;
	
	import jiglib.plugin.IPhysicsSkin;
	
	public final class PushPhysicsSkinAction implements IAction
	{
		private static const TYPE		: uint				= ActionType.UPDATE_TRANSFORM_DATA;
		private static const TMP_VECTOR	: Vector.<Number>	= new Vector.<Number>(16);
		private static const TMP_MATRIX	: Matrix3D			= new Matrix3D();
		
		private static var _instance	: PushPhysicsSkinAction	= null;
		
		public static function get pushPhysicsSkinAction() : PushPhysicsSkinAction
		{
			return _instance || (_instance = new PushPhysicsSkinAction());
		}
		
		public function get type() : uint		{ return TYPE; }
		
		public function run(scene		: IScene,
							visitor		: ISceneVisitor,
							renderer	: IRenderer) : Boolean
		{
			var skin : IPhysicsSkin = IPhysicsSkin(scene);
			
			skin.transform.copyRawDataTo(TMP_VECTOR);
			TMP_MATRIX.setRawData(TMP_VECTOR);
			
			visitor.transformData.world.push()
							 .prepend(TMP_MATRIX);
			
			return true;
		}
	}
}