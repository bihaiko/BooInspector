import System
import UnityEditor

[CustomEditor(typeof(RageCanvasAlign))]
public class RageCanvasAlignEditor (RageToolsEditor): 
	
	protected override def OnDrawInspectorHeaderLine ():
		cAlign = target as RageCanvasAlign
		
		EasyCol:
			Separator()
			EasyRow:
				LookLikeControls(40f,10f)
				EasyPopup "Horiz.", cAlign.HorizontalAlign
				EasyPopup "Vert.", cAlign.VerticalAlign