using UnityEngine;

[ExecuteInEditMode]
[AddComponentMenu("RageTools/Rage Group")]
public class RageGroup : MonoBehaviour {

    [SerializeField]
    public bool GroupTweak;
    public float AntiAlias = 1.0f;
    public int Density = 3;
    public float AaMult = 1.0f;
    public float DensityMult = 1.0f;
    public bool Proportional = true;
    public Rect Boundaries;
    public Vector3 Center;
}