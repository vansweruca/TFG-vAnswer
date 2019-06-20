using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class ResultController : MonoBehaviour {

	public Text txtResultado;
    string incUserURL = "http://ucalearn.uca.es/mydb/incVeces.php";
    bool permiso = false;
    // Use this for initialization
    void Start () {

		txtResultado.text = "Aciertos del jugador: " + PlayerPrefs.GetInt ("aciertos").ToString();
        WWWForm form = new WWWForm();
        form.AddField("idPost", PlayerPrefs.GetString("usuario").ToString());

        WWW www = new WWW(incUserURL, form);
        StartCoroutine(esperaEscritura());
    }

    IEnumerator esperaEscritura()
    {
        yield return new WaitForSeconds(3);
        permiso = true;
    }

	public void clickBtnPlayAgain(){
        if (permiso == true) { SceneManager.LoadScene("Portada"); }
		
	}

	public void clickBtnExit(){

        if(permiso == true) { Application.Quit(); }
		Application.Quit ();
	}

}
