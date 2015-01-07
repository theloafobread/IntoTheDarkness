using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class textUIScript : MonoBehaviour {

	GameObject player;
	PlayerScript playerScript;
	Text livesText;
	// Use this for initialization
	void Start () {
		player = GameObject.Find("Player");
		playerScript = player.GetComponent<PlayerScript>();
		livesText = GetComponent<Text> ();

	}
	
	// Update is called once per frame
	void Update () {
		if(playerScript.playerHealth <=0)
			livesText.text = "Game Over";
		else
			livesText.text = playerScript.playerHealth.ToString ();
	}
}
