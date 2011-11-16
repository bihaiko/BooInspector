import UnityEngine

[CustomEditor(typeof(RageEdgetune))]
public class RageEdgetuneEditor (RageToolsEditor): 

	private _edgetune as RageEdgetune
	
	protected override def OnDrawInspectorHeaderLine():
		_edgetune = target if _edgetune == null

		if _edgetune.Data == null:
			_edgetune.Data = ScriptableObject.CreateInstance(typeof(RageEdgetuneData))
		
		Undo.SetSnapshotTarget(target, "RageEdgetune Initialize")
		
		EasyToggle "On", _edgetune.On, GUILayout.MaxWidth(36f), GUILayout.MinWidth(36f), MinHeight()
		
		if GUILayout.Button("Initialize", MinHeight()):
			pass
		
				
	protected override def OnDrawInspectorGUI():
		return if _edgetune == null
		
		EasyRow:
			LookLikeControls(65f, 50f)			
			EasyPopup "Reference", _edgetune.Data.Reference, MinHeight()					
			if _edgetune.Data.Reference == RageEdgetuneData.ReferenceType.Custom:
				LookLikeControls(15f, 30f)			
				EasyIntField "X", _edgetune.Data.CanvasSize[0] , MinWidth(30f)
				EasyIntField "Y", _edgetune.Data.CanvasSize[1] , MinWidth(30f)
			
		EasyRow:
			EasyToggle "Auto Density", _edgetune.Data.AutomaticLod, MinWidth(100f), MaxWidth(100f)
			if _edgetune.Data.AutomaticLod:			
				LookLikeControls(30, 50f)		
				EasyIntField "Max", _edgetune.Data.MaxDensity  
		
		EasySettings:
			EasyRow:
				LookLikeControls(65f, 1f)		
				EasyIntField "AA Factor", _edgetune.Data.AaFactor						
				LookLikeControls(90f, 1f)
				EasyFloatField "Density Factor", _edgetune.Data.DensityFactor
			EasyRow:
				LookLikeControls(80f, 10f)
				EasyIntField "Update Size", _edgetune.UpdateRangeSize