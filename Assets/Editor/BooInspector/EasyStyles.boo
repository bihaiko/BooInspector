namespace Com.Freakow.BooInspector

import UnityEditor
import UnityEngine

public abstract class EasyStyles: 
	
	private static _listTitleStyle as GUIStyle
	private static _listItemStyle as GUIStyle
	private static _warningStyle as GUIStyle
	private static _foldoutStyle as GUIStyle
	
	public static def ListItem() as GUIStyle:
		return _listItemStyle if _listItemStyle != null
		
		_listItemStyle = GUIStyle(EditorStyles.miniLabel)
		_listItemStyle.fontSize = 9
		return _listItemStyle
			
	public static def ListTitle() as GUIStyle:
		return _listTitleStyle if _listTitleStyle != null
		
		_listTitleStyle = GUIStyle(EditorStyles.miniLabel)
		_listTitleStyle.fontSize = 9
		_listTitleStyle.fontStyle = FontStyle.Bold;
		return _listTitleStyle
		
	public static def Warning() as GUIStyle:
		return _warningStyle if _warningStyle != null
		
		_warningStyle = GUIStyle(EditorStyles.whiteMiniLabel)
		return _warningStyle
		
	public static def Foldout() as GUIStyle:
		return _foldoutStyle if _foldoutStyle != null
		
		_foldoutStyle = GUIStyle(EditorStyles.foldout)
		_foldoutStyle.fontSize = 9
		_foldoutStyle.fontStyle = FontStyle.Bold;
		return _foldoutStyle	