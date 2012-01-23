using UnityEngine;

[ExecuteInEditMode]
[AddComponentMenu("RageTools/Rage Magnet")]
public class RageMagnet : RageComponent {

    public Vector3 RestPosition;
    public float MinRadius;
	public bool GizmoVisible = true;
    public float UpdateDelay;
}