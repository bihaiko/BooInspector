using UnityEngine;

[ExecuteInEditMode]
[RequireComponent(typeof(RageGroup))]
[AddComponentMenu("RageTools/Rage EdgeTune")]
public class RageEdgetune : MonoBehaviour {
	
    public GameObject TextMeshGO;
    public RageGroup ThisRageGroup;
    public float StartObjectHeight;
    public float StartDistance;
    public float StartResolutionHeight;
    public bool CameraIsOrtho;

    public bool On;
    public float AaFactor = 1.0f;
    public float DensityFactor = 0.5f;
    public bool AutomaticLod = true;
    public int MaxDensity = 7;

    public enum ReferenceType { GameView = 0, Custom };
    public ReferenceType Reference = ReferenceType.GameView;
    public int[] CanvasSize = { 0, 0 };
    public bool DebugFactor;

    public int X { set { CanvasSize[0] = value; } get { return CanvasSize[0]; } }
    public int Y { set { CanvasSize[1] = value; } get { return CanvasSize[1]; } }
}