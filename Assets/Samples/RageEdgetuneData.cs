using UnityEngine;

public class RageEdgetuneData : ScriptableObject {

    public enum ReferenceType { GameView = 0, Custom };

    public float AaFactor = 1.0f;
    public float DensityFactor = 0.5f;
    public bool AutomaticLod = true;
    public int MaxDensity = 7;
    public bool Relative;
    public int[] CanvasSize = { 0, 0 };

    public ReferenceType Reference = ReferenceType.GameView;
    public RageEdgetuneData Clone(){ return (RageEdgetuneData) MemberwiseClone();}
}