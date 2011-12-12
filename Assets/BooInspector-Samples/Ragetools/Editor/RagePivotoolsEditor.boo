import UnityEngine

[CustomEditor(typeof (RagePivotools))]
public class RagePivotoolsEditor (RageToolsEditor): 

	private _pivotools as RagePivotools

	protected override def OnDrawInspectorHeaderLine():
		_pivotools = target if _pivotools == null
		EasyToggle "In Place", _pivotools.InPlace, MaxWidth(65f), MinHeight()
		
		if GUILayout.Button("Center", MinHeight()):
			Undo.RegisterSceneUndo("RagePivotools: Center Selection Change")
			//Do Something Here
	
	protected override def OnDrawInspectorGUI():
		EasyRow:
			LookLikeControls(38f, 30f)
			
			if _pivotools.CenterType != RagePivotools.CenterMode.Reference:
				EasyPopup "Mode", _pivotools.CenterType, MinHeight()
				return
				
			EasyPopup "Mode", _pivotools.CenterType, MinHeight(), MinWidth(120f), MaxWidth(120f)
			
			LookLikeControls(1f, 60f)			
			EasyGameObjectField "", _pivotools.ReferenceGO