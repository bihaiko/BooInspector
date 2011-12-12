namespace Com.Freakow.BooInspector

macro EasyCol:
	yield [|		
		try:
			EditorGUILayout.BeginVertical()
			$(EasyCol.Body)
		ensure:
			EditorGUILayout.EndVertical()
	|]


macro EasyRow:
	yield [|
		try:
			EditorGUILayout.BeginHorizontal()
			$(EasyRow.Body)
		ensure:
			EditorGUILayout.EndHorizontal()
	|]
	

macro EasySettings:	
	
	macro EasyRow:
		yield [|
			try:
				EditorGUILayout.BeginHorizontal()
				GUILayout.Label("", EditorStyles.label, MaxWidth(10f), MinWidth(10f));
				$(EasyRow.Body)
			ensure:
				EditorGUILayout.EndHorizontal()
		|]	

	yield [|
		_settings = EditorGUILayout.Foldout(_settings, "Settings",  EasyStyles.Foldout())		
		if _settings:
			$(EasySettings.Body)
			EditorGUILayout.Separator()
	|]			


macro EasyFoldout:
	case [| EasyFoldout $label, $expression |]:					
		yield [|
			$expression = EditorGUILayout.Foldout($expression, $label,  EasyStyles.Foldout())		
			if $expression:
				$(EasyFoldout.Body)
		|]	



macro EasyUndo:
   case [| EasyUndo $label, $current, $lastValue |]:
       yield [| $current = RegisterUndo($lastValue, $current, $label) |]	



macro EasyVector3Field:
	case [| EasyVector3Field $label,  $expression |]:
		yield [| $expression = UndoableVector3Field($label, $expression) |]	
	
	case [| EasyVector3Field $label,  $expression, $opt1 |]:
		yield [| $expression = UndoableVector3Field($label, $expression, $opt1) |]	
	
	case [| EasyVector3Field $label,  $expression, $opt1, $opt2 |]:
		yield [| $expression = UndoableVector3Field($label, $expression, $opt1, $opt2) |]	
	
	case [| EasyVector3Field $label,  $expression, $opt1, $opt2, $opt3 |]:
		yield [| $expression = UndoableVector3Field($label, $expression, $opt1, $opt2, $opt3) |]	 
       
       

macro EasyGameObjectField:
   case [| EasyGameObjectField $label,  $expression |]:
       yield [| $expression = UndoableGameObjectField($label, $expression) |]	
       
   case [| EasyGameObjectField $label,  $expression, $opt1 |]:
       yield [| $expression = UndoableGameObjectField($label, $expression, $opt1) |]	
       
   case [| EasyGameObjectField $label,  $expression, $opt1, $opt2 |]:
       yield [| $expression = UndoableGameObjectField($label, $expression, $opt1, $opt2) |]	
       
   case [| EasyGameObjectField $label,  $expression, $opt1, $opt2, $opt3 |]:
       yield [| $expression = UndoableGameObjectField($label, $expression, $opt1, $opt2, $opt3) |]	  
   
           

macro EasyObjectField:
   case [| EasyObjectField $label,  $expression |]:
       yield [| $expression = UndoableObjectField($label, $expression) |]	
       
   case [| EasyObjectField $label,  $expression, $type |]:
       yield [| $expression = UndoableObjectField($label, $expression, $type) |]	



macro EasyPopup:
   case [| EasyPopup $label,  $expression |]:
       yield [| $expression = UndoablePopup($label, $expression) |]	
       
   case [| EasyPopup $label,  $expression, $opt1|]:
       yield [| $expression = UndoablePopup($label, $expression, $opt1) |]	
       
   case [| EasyPopup $label,  $expression, $opt1, $opt2 |]:
       yield [| $expression = UndoablePopup($label, $expression, $opt1, $opt2) |]	
       
   case [| EasyPopup $label,  $expression, $opt1, $opt2, $opt3 |]:
       yield [| $expression = UndoablePopup($label, $expression, $opt1, $opt2, $opt3) |]	  



macro EasyIntField:
   case [| EasyIntField $label,  $expression |]:
       yield [| $expression = UndoableIntField($label, $expression) |]	
       
   case [| EasyIntField $label,  $expression, $opt1 |]:
       yield [| $expression = UndoableIntField($label, $expression, $opt1) |]	
       
   case [| EasyIntField $label,  $expression, $opt1, $opt2 |]:
       yield [| $expression = UndoableIntField($label, $expression, $opt1, $opt2) |]	
       
   case [| EasyIntField $label,  $expression, $opt1, $opt2, $opt3 |]:
       yield [| $expression = UndoableIntField($label, $expression, $opt1, $opt2, $opt3) |]	  



macro EasyTextField:
   case [| EasyTextField $label,  $expression |]:
       yield [| $expression = UndoableTextField($label, $expression) |]	
       
   case [| EasyTextField $label,  $expression, $opt1 |]:
       yield [| $expression = UndoableTextField($label, $expression, $opt1) |]	
       
   case [| EasyTextField $label,  $expression, $opt1, $opt2 |]:
       yield [| $expression = UndoableTextField($label, $expression, $opt1, $opt2) |]	
       
   case [| EasyTextField $label,  $expression, $opt1, $opt2, $opt3 |]:
       yield [| $expression = UndoableTextField($label, $expression, $opt1, $opt2, $opt3) |]	



macro EasyFloatField:
   case [| EasyFloatField $label,  $expression |]:
       yield [| $expression = UndoableFloatField($label, $expression) |]	
       
   case [| EasyFloatField $label,  $expression, $opt1 |]:
       yield [| $expression = UndoableFloatField($label, $expression, $opt1) |]	
       
   case [| EasyFloatField $label,  $expression, $opt1, $opt2 |]:
       yield [| $expression = UndoableFloatField($label, $expression, $opt1, $opt2) |]	
       
   case [| EasyFloatField $label,  $expression, $opt1, $opt2, $opt3 |]:
       yield [| $expression = UndoableFloatField($label, $expression, $opt1, $opt2, $opt3) |]	



macro EasyToggle:
   case [| EasyToggle $label,  $expression |]:
       yield [| $expression = UndoableToggle($label, $expression) |]	
       
   case [| EasyToggle $label,  $expression, $opt1 |]:
       yield [| $expression = UndoableToggle($label, $expression, $opt1) |]	       
       
   case [| EasyToggle $label,  $expression, $opt1, $opt2 |]:
       yield [| $expression = UndoableToggle($label, $expression, $opt1, $opt2) |]	       
              
   case [| EasyToggle $label,  $expression, $opt1, $opt2, $opt3 |]:
       yield [| $expression = UndoableToggle($label, $expression, $opt1, $opt2, $opt3) |]	       