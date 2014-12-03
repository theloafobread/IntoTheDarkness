using UnityEngine;
using System.Collections;

public class PlayButton : MonoBehaviour {

	// Use this for initialization
	void Start () {
		renderer.material.color = new Color(255, 255, 255, 0.65f);
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnMouseOver() {
		renderer.material.color = new Color(255, 255, 255, 1.0f);
	}

	void OnMouseExit() {
		renderer.material.color = new Color(255, 255, 255, 0.65f);
	}

	void OnMouseDown(){
		Application.LoadLevel ("Game");
	}
}
