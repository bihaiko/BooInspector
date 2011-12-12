import System
import UnityEditor

[CustomEditor(typeof(RageCanvasAlign))]
public class RageCanvasAlignEditor (RageToolsEditor): 
	
	protected override def OnDrawInspectorHeaderLine ():
		cAlign = target as RageCanvasAlign
		
		LookLikeControls(40f,20f)
		EasyPopup "Horiz.", cAlign.HorizontalAlign
		EasyPopup "Vert.", cAlign.VerticalAlign
		
	protected override def OnDrawInspectorGUI():
		Separator()		