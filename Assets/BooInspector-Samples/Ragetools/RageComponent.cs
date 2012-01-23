using UnityEngine;

[ExecuteInEditMode]
public abstract class RageComponent : MonoBehaviour {

    public bool On { get; set; }
    public bool IsPlaying { get; set; }
    public bool RunOnFixedUpdate { get; set; }

    public bool Enabled {
        get { return enabled; }
        set { enabled = value; }
    }
}