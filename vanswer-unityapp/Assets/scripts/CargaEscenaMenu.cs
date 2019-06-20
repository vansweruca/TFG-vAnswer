using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class CargaEscenaMenu : MonoBehaviour {

	public void OnMouseClick()
	{
        SceneManager.LoadScene("Inicio");
	}

	public void cargaEscenaARTest(){
		
		Debug.Log ("CargandoEscenaAR");
		SceneManager.LoadScene ("Escena_AR");
	}


	public void cargaCuestionario(){
        SceneManager.LoadScene("Cuestionario");
	}
}
