using UnityEngine;
using Object = UnityEngine.Object;

[AddComponentMenu("RageTools/Rage SVG In")]
public class RageSvgIn : RageComponent {
	
    public Object SvgFile;
    public int MinVertexDensity = 3;
    public int MaxVertexDensity = 5;
    public float AntialiasWidth = 1f;
    public float ZsortOffset = -0.1f;
    public float MergeRadius = 0.01f;
    public bool ImportOnStart;
    public bool DebugMeshCreation;
    public bool DebugStyleCreation;
    public bool MidlineControls = true;
    public bool OutlineBehindFill;

}