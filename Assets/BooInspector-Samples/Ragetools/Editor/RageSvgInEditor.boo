import UnityEngine

[CustomEditor(typeof(RageSvgIn))]
public class RageSvgInEditor (RageToolsEditor): 
	
	private _svgIn as RageSvgIn
	
	protected override def OnDrawInspectorHeaderLine ():
		_svgIn = target if _svgIn==null	
		EasyToggle "On Start", _svgIn.ImportOnStart, MaxWidth(65f), MinWidth(65f)
		
		return if not GUILayout.Button("Import", MinHeight())
		Undo.RegisterSceneUndo("RageTools SVG Import")
		//Do Something Here
	

	protected override def OnDrawInspectorGUI():
		LookLikeControls(56f)
		EasyObjectField "Svg File", _svgIn.SvgFile
		
		EasyRow:
			LookLikeControls(50f, 10f)
			EasyIntField "Density Min", _svgIn.MinVertexDensity
			
			LookLikeControls(30f, 10f)
			EasyIntField  "Max", _svgIn.MaxVertexDensity
				
		EasySettings:		
			EasyRow:
				LookLikeControls(60f, 10f)
				EasyFloatField "AA Width ", _svgIn.AntialiasWidth
				EasyFloatField "Z Offset ", _svgIn.ZsortOffset
				
			EasyRow:
				LookLikeControls(85f, 20f)
				EasyFloatField "Merge Radius ", _svgIn.MergeRadius
				EasyToggle "Midline Controls ", _svgIn.MidlineControls		
						
			EasyRow:
				EasyToggle "Outline Behind Fill",_svgIn.OutlineBehindFill