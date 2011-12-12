using UnityEngine;

[ExecuteInEditMode]
[AddComponentMenu("RageTools/Rage CanvasAlign")]
public class RageCanvasAlign : MonoBehaviour {
	
    public enum HorizontalAlignType { Left = 0, Right = 1, Center = 2 }
    public enum VerticalAlignType { Top = 0, Bottom = 1, Center = 2 }

    public HorizontalAlignType HorizontalAlign;
    public VerticalAlignType VerticalAlign;
}