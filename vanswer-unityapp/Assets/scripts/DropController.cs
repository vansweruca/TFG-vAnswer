using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using System.Linq;

public class DropController : MonoBehaviour {

	public Dropdown myDropdown; // Make sure to assign this
	public List<string> data;
	public string[] datos;
	char[] splitters = { ';' };

	void Start(){
	
		StartCoroutine ("cargaCategoria");
	}

	IEnumerator cargaCategoria()
	{

		WWW catData = new WWW ("http://ucalearn.uca.es/mydb/cargaCategoria.php");

		while(!catData.isDone)
			yield return new WaitForEndOfFrame();
		
		string catDataString = catData.text;
		datos = catDataString.Split(splitters, System.StringSplitOptions.RemoveEmptyEntries);
		List<string> listado = new List<string> (datos);
		myDropdown.ClearOptions();
		myDropdown.AddOptions(listado);
	}
}

