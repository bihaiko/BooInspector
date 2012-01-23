import Com.Freakow.BooInspector
import UnityEngine

public abstract class RageToolsEditor (EasyEditor): 

	protected _target as IRageComponent
	
	protected override def IconAssetName():
		return "ragetoolsicon"

	protected def MinHeight():
		return GUILayout.MinHeight(20f)
		
	//public override def OnInspectorGUI():
		//_target = target if _target == null	
		//_target.IsPlaying = EditorApplication.isPlaying	
		//super.OnInspectorGUI();

		
	protected override def OnDrawInspectorHeaderLine():	
		_target = target if _target == null	
		EasyCol:
			EasyRow:		
				EasyToggle "On/Off", _target.On, MaxWidth(120f)
				EasyToggle "Fixed Update", _target.RunOnFixedUpdate, MaxWidth(100f)	

		
	//protected override def OnDrawInspectorFooterLine():	
		//_target = target if _target == null	
		//EasyToggle "Log Unity", _target.LogUnityMethods, MaxWidth(80f)
		//EasyToggle "Log RageTools", _target.LogRageToolsMethods			