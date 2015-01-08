using UnityEngine;
using System.Collections;

public class Enemy : MonoBehaviour {

	public bool dirFwd;
	public bool dirLeft;
	public bool dirRight;

	public float timer;

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		Vector3 fwd = transform.TransformDirection(Vector3.forward);
		Vector3 right = transform.TransformDirection(Vector3.right);
		Vector3 left = transform.TransformDirection(-Vector3.right);
		if (Physics.Raycast(transform.position, fwd, 10)){
			dirFwd = true;
		}
		else{
			dirFwd = false;
		}
		if (Physics.Raycast(transform.position, right, 10)){
			dirRight = true;
		}
		else{
			dirRight = false;
		}
		if (Physics.Raycast(transform.position, left, 10)){
			dirLeft = true;
		}
		else{
			dirLeft = false;
		}

		timer -=Time.deltaTime;

		if(timer < 0){
			if(dirFwd){
				Move(1);
			}
			if(dirRight){
				Move(2);
			}
			if(dirLeft){
				Move(3);
			}
			if(dirFwd && dirRight){
				Move(Random.Range(1,2));
			}
			if(dirFwd && dirLeft){
				Move(1);
			}
			if(dirLeft && dirRight){
				Move(Random.Range(2,3));
			}
			if(dirFwd && dirLeft && dirRight){
				Move (Random.Range(1,3));
			}

			timer = 3;
		}
	}

	void Move(int direction){
		//forward
		if(direction == 1){
			transform.Translate(-Vector3.right * 3);
			Debug.Log("forward");
		}
		//right
		if(direction == 2){
			transform.Translate(-Vector3.right * 3);
			Debug.Log("right");
		}
		//left
		if(direction == 3){
			transform.Translate(-Vector3.right * 3);
			Debug.Log("left");
		}
	}
}
