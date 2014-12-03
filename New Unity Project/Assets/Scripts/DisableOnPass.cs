﻿using UnityEngine;
using System.Collections;

public class DisableOnPass : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnTriggerEnter(Collider c){
		if(c.gameObject.tag == "Player"){
			this.gameObject.SetActive(false);
		}
	}
}
