import Com.Freakow.BooInspector
import UnityEngine

public abstract class RageToolsEditor (EasyEditor): 

	protected override def IconAssetName():
		return "ragetoolsicon"

	protected def MinHeight():
		return GUILayout.MinHeight(20f)