import UnityEngine

[CustomEditor(typeof(RageMagnet))]
public class RageMagnetEditor (RageToolsEditor):

	private static _magnet as RageMagnet
	
	protected override def OnDrawInspectorHeaderLine():
		_magnet = target if _magnet == null

		if GUILayout.Button("Off", MinHeight()):
        	EasyUndo "RageMagnet: Off", _magnet.enabled, 	false

        if GUILayout.Button("Rest/On", MinHeight()):
        	EasyUndo "RageMagnet: Rest/On", _magnet.enabled, true
			//Do Something Here	


	protected override def OnDrawInspectorGUI():
		Separator()	
		
		EasySettings:
			EasyRow:
				EasyVector3Field "Rest Position", _magnet.RestPosition
	
			EasyRow:
				EasyFloatField "Inner Radius", _magnet.MinRadius

			EasyRow:
				LookLikeControls(90f,20f)
				EasyToggle "Show Gizmo", _magnet.GizmoVisible, MaxWidth(100f), MinWidth(100f)
				EasyFloatField "Update Delay", _magnet.UpdateDelay