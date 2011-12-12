import UnityEngine
import Com.Freakow.BooInspector

[CustomEditor(typeof(RageEdgetune))]
public class RageEdgetuneEditor (RageToolsEditor): 

	private _edgetune as RageEdgetune
	
	protected override def OnDrawInspectorHeaderLine():
		_edgetune = target if _edgetune == null
		
		Undo.SetSnapshotTarget(target, "RageEdgetune Initialize")
		
		EasyToggle "On", _edgetune.On, GUILayout.MaxWidth(36f), GUILayout.MinWidth(36f)
		
		if GUILayout.Button("Initialize"):
			CreateAndRegisterUndoSnapshot()
			//Do Something Here
		
				
	protected override def OnDrawInspectorGUI():
		return if _edgetune == null
		
		EasyRow:
			LookLikeControls(65f, 50f)			
			EasyPopup "Reference", _edgetune.Reference, MinHeight()					
			if _edgetune.Reference == RageEdgetune.ReferenceType.Custom:
				LookLikeControls(15f, 30f)			
				EasyIntField "X", _edgetune.X, MinWidth(30f)
				EasyIntField "Y", _edgetune.Y, MinWidth(30f)
			
		EasyRow:
			EasyToggle "Auto Density", _edgetune.AutomaticLod, MinWidth(100f), MaxWidth(100f)
			if _edgetune.AutomaticLod:			
				LookLikeControls(30, 50f)		
				EasyIntField "Max", _edgetune.MaxDensity  
		
		EasySettings:
			EasyRow:
				LookLikeControls(65f, 30f)		
				EasyIntField "AA Factor", _edgetune.AaFactor						
				LookLikeControls(90f, 30f)
				EasyIntField "Density Factor", _edgetune.DensityFactor