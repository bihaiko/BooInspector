import UnityEngine

public abstract class MySampleEditor (EasyEditor): 

	protected override def IconAssetName():
		return "ragetoolsicon"

	protected def MinHeight():
		return GUILayout.MinHeight(20f)