﻿using UnityEngine;
using System.Collections;

public class Torch : MonoBehaviour {
	
	public GameObject flame;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	}

	void OnTriggerStay(Collider c){
		if(c.gameObject.tag == "Player")
		{
			transform.root.BroadcastMessage("TurnOff");
			flame.SetActive(true);
		}
	}

	void TurnOff(){
		flame.SetActive (false);
	}
}
