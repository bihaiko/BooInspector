import UnityEngine

[CustomEditor(typeof(RageGroup))]
public class RageGroupEditor (MySampleEditor): 

	private _tweak as bool
	private _showList as bool
	private _showPhysics as bool
	private _rageGroup as RageGroup

	protected override def OnDrawInspectorHeaderLine():
		_rageGroup = target if _rageGroup == null

		if _rageGroup.PhysicsData == null:
			_rageGroup.PhysicsData = ScriptableObject.CreateInstance(typeof(RageGroupPhysicsData))
		
		if GUILayout.Button("Reset", MaxWidth(60f), MinHeight()):
			RegisterUndo("RageGroup: Reset")
			
		if GUILayout.Button("Update", MinHeight()):
			RegisterUndo("RageGroup: Update")
			_rageGroup.AaMult = 1f
			_rageGroup.DensityMult = 1f
		

	protected override def OnDrawInspectorGUI():
		Separator()
				
		EasyRow:
			EasyToggle "Group Tweak", _rageGroup.GroupTweak, MaxWidth(100f)
			if _rageGroup.GroupTweak:
				EasyToggle "Proportional", _rageGroup.Proportional, MaxWidth(90f)
		
		AddAntiAliasAndDensityIfNecessary()
		AddProportionalWarningIfNecessary()
		AddPhysicsIfNecessary()
			
		Separator()
		AddMemberList()
		
						
	private def AddAntiAliasAndDensityIfNecessary():
		return if not _rageGroup.GroupTweak
		
		LookLikeControls(70f, 10f)	
		
		EasyRow:		
			if _rageGroup.Proportional:		
				EasyIntField "AntiAlias x", _rageGroup.AaMult, MinWidth(120f)
				EasyIntField "Density x", _rageGroup.DensityMult, MinWidth(120f)
				return
				
			EasyIntField "AntiAlias", _rageGroup.AntiAlias, MinWidth(120f)
			EasyIntField "Density", _rageGroup.Density, MinWidth(120f)
			
	private def AddPhysicsIfNecessary():
				
		EasyRow:
			EasyToggle "Physics", _showPhysics, MinWidth(70f), MaxWidth(70f)	
				
		EasyRow:			
			LookLikeControls(70f, 1f)
			EasyIntField "Split Count", _rageGroup.PhysicsData.PhysicsColliderCount  
			LookLikeControls(55f, 1f)
			EasyFloatField "Z Depth", _rageGroup.PhysicsData.ColliderZDepth


	private def AddProportionalWarningIfNecessary():
		return if not _rageGroup.GroupTweak
		return if not _rageGroup.Proportional
		EasyRow:
			Warning("* Proportional On. Click 'Update' when done.")


	private  def AddMemberList():
		EasyFoldout "Members (10)", _showList:	
			AddMemberRow("Name", "Def AA", "Def Dns", EasyStyles.ListTitle())
		
			i = 0
			while i < 10:
				AddMemberRow("name " + i, "AA " + i, "Density " + i, EasyStyles.ListItem())
				i++
				
			Separator()


	private def AddMemberRow(col1 as string, col2 as string, col3 as string, style as GUIStyle):		
		EasyRow:
			GUILayout.Label("", style, MaxWidth(13f), MinWidth(13f))
			GUILayout.Label(col1, style, ColWidth(.4f))
			GUILayout.Label(col2, style, ColWidth(.3f))
			GUILayout.Label(col3, style, ColWidth(.2f))


	private def ColWidth(percent as single):
		width = InspectorWidth()-13
		return MinWidth(width*percent)
		
	protected override def OnGuiRendered():		
		SetDirty(target) if GUI.changed or _rageGroup.GroupTweak