using UnityEngine;
using System.Collections;
using UnityEngine.SceneManagement;

public class RepasoController : MonoBehaviour {

	public AudioClip nivelC;
	public AudioSource miSonido;

	void Awake(){
	
		miSonido = GetComponent<AudioSource> ();
		DontDestroyOnLoad (this.gameObject);

	}
	void Start () {
		miSonido.PlayOneShot (nivelC, 0.9f);
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void clickBtnVolverElegirTematica(){
		SceneManager.LoadScene ("EleccionModo");
	}
}
