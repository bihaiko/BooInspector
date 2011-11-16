using UnityEngine;

[ExecuteInEditMode]
[RequireComponent(typeof(RageGroup))]
[AddComponentMenu("RageTools/Rage EdgeTune")]
public class RageEdgetune : MonoBehaviour {

    public GameObject TextMeshGO;
    public RageGroup Group;
    
    public float StartObjectHeight;
    public float StartDistance;
    public float StartResolutionHeight;
    public bool DebugFactors;
    public bool On;
	public int UpdateRangeSize = 8;
    public RageEdgetuneData Data;
}