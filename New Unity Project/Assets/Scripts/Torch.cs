using UnityEngine;
using System.Collections;

public class Torch : MonoBehaviour {
	
	public GameObject flame;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	}

	void OnTriggerEnter(Collider col){
		if(col.gameObject.tag == "Player")
		{
			transform.root.BroadcastMessage("TurnOff");
			flame.SetActive(true);
		}
	}

	void TurnOff(){
		flame.SetActive (false);
	}
}
