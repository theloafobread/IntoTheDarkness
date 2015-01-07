using UnityEngine;
using System.Collections;
public class PlayerScript : MonoBehaviour {

	public int playerHealth = 3;
	// Use this for initialization
	void Start () 
	{
	}
	
	// Update is called once per frame
	void Update () 
	{
		if (playerHealth <= 0)
			GameOver ();
	}
	public void GameOver()
	{
		Time.timeScale = 0;
	}
}
