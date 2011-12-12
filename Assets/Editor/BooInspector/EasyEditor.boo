namespace Com.Freakow.BooInspector

import UnityEditor
import UnityEngine

public class EasyEditor (Editor): 
""" Inherit this class to draw editor with RageTools Icon. """

	private _inspectorWidth as single
	private _icon as Texture
	private _undoable as bool
	
	protected static _settings as bool	

	public override def OnInspectorGUI():	
		_undoable = false
		StoreInspectorScale()

		return if target == null
		
		Separator()	
		EasyRow:
			AddIcon()
			OnDrawInspectorHeaderLine()
		
		OnDrawInspectorGUI()
		OnGuiRendered()
	
	protected abstract def IconAssetName() as string:
		pass
		
	protected abstract def OnDrawInspectorHeaderLine():
		pass

	protected virtual def OnDrawInspectorGUI():
		pass
		
	protected virtual def OnGuiRendered():
		SetDirtyIfNecessary(target)
				
	protected virtual def AddIcon():
		_icon = Resources.Load(IconAssetName()) if _icon == null
		return if _icon == null
        	
		GUILayout.Box(_icon, GUILayout.MinHeight(20f), MinWidth(20f), GUILayout.ExpandHeight(false), GUILayout.ExpandWidth(false))
								 	
	protected static def SetDirty(target as Object):
		EditorUtility.SetDirty(target)

	protected static def SetDirtyIfNecessary(target as Object):
		return if not GUI.changed
		SetDirty(target)	

	protected def InspectorWidth():
		return _inspectorWidth
		
	private def StoreInspectorScale():
		EasyRow:
			GUILayout.FlexibleSpace()
		
		return if GUILayoutUtility.GetLastRect().width <= 1		
		_inspectorWidth = GUILayoutUtility.GetLastRect().width
		
	protected def RegisterUndo(undoMsg as string): 
		return if _undoable
		return if not GUI.changed
		
		_undoable = true
		Undo.RegisterSceneUndo(undoMsg)
		
				
	protected def RegisterUndo[of T](currentValue as T, lastValue as T, undoMsg as string) as T: 
		return if _undoable
		return if not GUI.changed
		
		if currentValue == null:
			return currentValue if currentValue== lastValue		
		else:
			return currentValue if currentValue.Equals(lastValue)
	
		_undoable = true
		Undo.RegisterSceneUndo(undoMsg) 
		return currentValue
		
		
	protected static def CreateAndRegisterUndoSnapshot():
		Undo.CreateSnapshot()
		Undo.RegisterSnapshot()
		
	protected static def Separator():
		EditorGUILayout.Separator()
		
	protected static def LookLikeControls(size1 as single, size2 as single):		
		EditorGUIUtility.LookLikeControls(size1, size2)		
			
	protected static def LookLikeControls(size1 as single):		
		EditorGUIUtility.LookLikeControls(size1)	
			
	protected static def LookLikeControls():		
		EditorGUIUtility.LookLikeControls()	
				
	protected static def MinWidth(minWidth as single):
		return GUILayout.MinWidth(minWidth)		
		
	protected static def MaxWidth(maxWidth as single):
		return GUILayout.MaxWidth(maxWidth)
		
			
	protected def UndoablePopup(label as string, selection as System.Enum, *options as (GUILayoutOption)) as System.Enum:
		current = EditorGUILayout.EnumPopup(label, selection, *options)
		if ValueChanged(current, selection):
			Undo.RegisterSceneUndo(TargetName() + ": " + label + " Selection Change")
		return current		
					
	protected def UndoableToggle(label as string, lastValue as bool, *options as (GUILayoutOption)) as bool:
		current = GUILayout.Toggle(lastValue, label, *options)
		if ValueChanged(current, lastValue):
			Undo.RegisterSceneUndo(TargetName() + ": " + label + " Selection Change")
		return current		
					
	protected def UndoableIntField(label as string, lastValue as int, *options as (GUILayoutOption)) as int:
		current = EditorGUILayout.IntField(label, lastValue, *options)
		if ValueChanged(current, lastValue):
			Undo.RegisterSceneUndo(TargetName() + ": " + label + " Change")
		return current		
					
	protected def UndoableFloatField(label as string, lastValue as single, *options as (GUILayoutOption)) as single:
		current = EditorGUILayout.FloatField(label, lastValue, *options)
		if ValueChanged(current, lastValue):
			Undo.RegisterSceneUndo(TargetName() + ": " + label + " Change")
		return current
														
	protected def UndoableTextField(label as string, lastValue as string, *options as (GUILayoutOption)) as string:
		current = EditorGUILayout.TextField(label, lastValue, *options)
		if ValueChanged(current, lastValue):
			Undo.RegisterSceneUndo(TargetName() + ": " + label + " Change")
		return current																
														
	protected def UndoableVector3Field(label as string, lastValue as Vector3, *options as (GUILayoutOption)) as Vector3:
		current = EditorGUILayout.Vector3Field(label, lastValue, *options)
		if ValueChanged(current, lastValue):
			Undo.RegisterSceneUndo(TargetName() + ": " + label + " Change")
		return current
																																																																																																																																																																													
	protected def UndoableGameObjectField(label as string, lastValue as GameObject, *options as (GUILayoutOption)) as GameObject:
		return UndoableObjectField(label, lastValue, typeof(GameObject), *options)
				
	protected def UndoableObjectField(label as string, lastValue, *options as (GUILayoutOption)):
		return UndoableObjectField(label, lastValue, typeof(Object), *options)
														
	protected def UndoableObjectField(label as string, lastValue, type as System.Type, *options as (GUILayoutOption)):
		current = EditorGUILayout.ObjectField(label, lastValue, type, true, *options)
		
		if ValueChanged(current, lastValue):
			Undo.RegisterSceneUndo(TargetName() + ": " + label + " Reference Change")
		return current

	protected def TargetName() as string:
		return target.GetType().Name
	
	protected def Warning(text as string):
		GUILayout.Label(text, EasyStyles.Warning())		
		
	protected def ValueChanged(lastValue, currentValue) as bool:
		if currentValue == null:
			return false if currentValue== lastValue		
		else:
			return not currentValue.Equals(lastValue)		