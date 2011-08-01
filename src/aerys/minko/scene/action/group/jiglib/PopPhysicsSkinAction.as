package aerys.minko.scene.action.group.jiglib
{
	import aerys.minko.render.renderer.IRenderer;
	import aerys.minko.scene.action.ActionType;
	import aerys.minko.scene.action.IAction;
	import aerys.minko.scene.node.IScene;
	import aerys.minko.scene.visitor.ISceneVisitor;
	
	public class PopPhysicsSkinAction implements IAction
	{
		private static const TYPE	: uint	= ActionType.UPDATE_LOCAL_DATA;
		
		private static var _instance	: PopPhysicsSkinAction	= null;
		
		public static function get popPhysicsSkinAction() : PopPhysicsSkinAction
		{
			return _instance || (_instance = new PopPhysicsSkinAction());
		}
		
		public function get type() : uint		{ return TYPE; }
		
		public function run(scene		: IScene,
							visitor		: ISceneVisitor,
							renderer	: IRenderer) : Boolean
		{
			visitor.localData.world.pop();
			
			return true;
		}
	}
}