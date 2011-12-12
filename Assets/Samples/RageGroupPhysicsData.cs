using UnityEngine;

public class RageGroupPhysicsData: ScriptableObject {
	
    public bool CreatePhysicsInEditor;
    public bool CreateConvexMeshCollider;
    public PhysicMaterial PhysicsMaterial;
    public int PhysicsColliderCount = 32;
    public float ColliderZDepth = 100f;
    public float BoxColliderDepth = 1f;
    public float ColliderNormalOffset;
}