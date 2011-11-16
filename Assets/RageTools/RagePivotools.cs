using UnityEngine;

[RequireComponent(typeof(RageGroup))]
[AddComponentMenu("RageTools/Rage Pivotools")]
public class RagePivotools : MonoBehaviour{

    public enum CenterMode { Default = 0, Reference };

    public CenterMode CenterType;
    public GameObject ReferenceGO;
    public bool InPlace = true;
    public RageGroup RageGroup;
}
