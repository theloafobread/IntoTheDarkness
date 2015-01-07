using UnityEngine;
using System.Collections;

public class EnemyScript : MonoBehaviour 
{
	string info;
	float sDst = 0;
	GameObject player;
	public GameObject caster;
	Vector3 endPos;
	PlayerScript playerScript;
	bool calculate = true;
	float timer = 0;
	void Start () 
	{
		player = GameObject.Find("Player");
		playerScript = player.GetComponent<PlayerScript>();
	}

	void Update () 
	{
		endPos = Vector3.zero;
		info = "\n";
		sDst = 0;
		//Calculate ();
		//timer += 1 * Time.deltaTime;
		//if (timer >= 1) 
		//{
		//	timer = 0;
			CastAll ();
		//}
		//CastAll();
		endPos.y = 1.45f;
		caster.transform.Rotate(0,6*20*Time.deltaTime,0);
		transform.position = Vector3.MoveTowards(transform.position, endPos, 4*Time.deltaTime);
		//transform.LookAt (endPos);
		//Debug.Log (info);
	}
	void Cast()
	{
		RaycastHit hit;
		Ray ray = new Ray(caster.transform.position, caster.transform.forward);
		if (Physics.Raycast(ray, out hit)) 
		{
			//info +="Player: "+hit.distance.ToString();
			//Debug.DrawRay (transform.position, (player.transform.position-transform.position)*20, Color.cyan);
			Debug.DrawRay (caster.transform.position, caster.transform.forward*hit.distance, Color.green);

			if(hit.transform.tag == "Player")
				endPos = player.transform.position;

			if(hit.distance < 3)
			{
				if(hit.transform.tag == "Player")
				{
					playerScript.playerHealth--;
					Debug.Log("Game Over");
				}
			}
		}
		Debug.Log (hit.transform.name + " : " + hit.transform.tag + " : "+hit.distance);
	}

	void CastAll()
	{
//		RaycastHit hit1;
//		Ray ray = new Ray(caster.transform.position, (player.transform.position - transform.position));
//		if (Physics.Raycast(ray, out hit1)) 
//		{
//			//info +="Player: "+hit.distance.ToString();
//			//Debug.DrawRay (transform.position, (player.transform.position-transform.position)*20, Color.cyan);
//			Debug.DrawRay (caster.transform.position, caster.transform.forward*hit1.distance, Color.green);
//			
//			if(hit1.transform.tag == "Player"){
//				endPos = player.transform.position;
//				return;
//			}
//			
//			if(hit1.distance < 3)
//			{
//				if(hit1.transform.tag == "Player")
//				{
//					playerScript.playerHealth--;
//					Debug.Log("Game Over");
//				}
//			}
//		}
		//Debug.Log (hit.transform.name + " : " + hit.transform.tag + " : "+hit.distance);

		RaycastHit[] hits;
		hits = Physics.RaycastAll(caster.transform.position, (player.transform.position - caster.transform.position), 30.0F);
		Debug.DrawRay (caster.transform.position, (player.transform.position - caster.transform.position)*30, Color.cyan);
		int i = 0;
		while (i < hits.Length) {
			RaycastHit hit = hits[i];
			
			if(hit.transform.name == "Player" && i == 0)
			{
				info+="PLAYER-----------FIRST, TARGET--------------";
				endPos = hit.transform.position;
				if(hit.distance <= 3)
					//playerScript.playerHealth--
				return;
				//playerScript.playerHealth--;
			}
			else if(hit.transform.name == "Player" && i != 0)
			{
				info+="PLAYER--------------------------------------";
			}

			info+=hit.transform.name + " : " + hit.transform.tag + " : "+hit.distance+" ::: ";
			i++;
		}
		RaycastHit[] hits2;
		hits2 = Physics.RaycastAll(caster.transform.position, caster.transform.forward, 30.0F);
		Debug.DrawRay (caster.transform.position, caster.transform.forward*30, Color.cyan);
		int i2 = 0;
		while (i < hits2.Length) {
			RaycastHit hit2 = hits2[i];

			if(sDst < hit2.distance)
			{
				sDst = hit2.distance;
				endPos = hit2.transform.position;
			}

			info+=hit2.transform.name + " : " + hit2.transform.tag + " : "+hit2.distance+" ::: ";
			i++;
		}
		Debug.Log (info);
	}
}
