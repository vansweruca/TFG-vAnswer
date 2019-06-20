using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class ModeController : MonoBehaviour {

    public Text sesion;

    private void Awake()
    {
        sesion.text = "Sesion iniciada: " + PlayerPrefs.GetString("usuario");
    }
    // Use this for initialization
    void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void clickModoPracticaCompleto(){
		PlayerPrefs.SetInt ("modo", 0);
		SceneManager.LoadScene ("EleccionCategoria");
	
	}

	public void clickModoPracticaRepasar(){
		PlayerPrefs.SetInt ("modo", 1);
		SceneManager.LoadScene ("EleccionCategoria");
	
	}

	public void clickModoEvaluacion(){
		PlayerPrefs.SetInt ("modo", 2);
		SceneManager.LoadScene ("EleccionCategoria");
	
	}
}
