using UnityEngine;
using System.Collections;

public class FallTrap : MonoBehaviour {

	protected Rigidbody rigBod;
	protected BoxCollider boxCol;

	// Use this for initialization
	void Start () {
		rigBod = GetComponent<Rigidbody> ();
		rigBod.useGravity = false;
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void Tripped(){
		rigBod.useGravity = true;

	}
}
