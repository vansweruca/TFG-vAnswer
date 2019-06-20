using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections.Generic;

public class GameController : MonoBehaviour {
    public Text sesion;
	public int tipo;
	public Text txtTematica;
	public int pasa;
	public int id_Pregunta;
	string DeleteFalloURL = "http://ucalearn.uca.es/mydb/limpiaFallo.php";
	string InsertFalloURL = "http://ucalearn.uca.es/mydb/insertFallo.php";
	string InsertAciertosURL = "http://ucalearn.uca.es/mydb/insertAciertos.php";
	public int total = 0;
	public string usuario;
	public int modo;
	public bool comprueba;
	public AudioClip audioC;
	public AudioClip audioI;
	AudioSource mySound;
	public int aciertos = 0;
	public Text txtTitulo;
	public Text txtAciertos;
	public string s_Titulo;
	public string s_VF;
	public string s_Resp1;
	public string s_Resp2; 
	public string s_Resp3;
	public string s_Resp4;
	public Button btnV;
	public Button btnF;
	public Button btnA;
	public Button btnB;
	public Button btnC;
	public Button btnD;
	string tema;
	int iteraciones; //Almacenar cantidad de preguntas enlazadas a tematica elegida por el usuario.
	List<string> info;
	int index = 2;
	char[] splitters = { ';' };
	public string[] a_datos;

	void Awake(){
        sesion.text = "Sesion iniciada: " + PlayerPrefs.GetString("usuario");
        mySound = GetComponent<AudioSource> ();
		DontDestroyOnLoad (this.gameObject);
	}

	void Start()
	{
		usuario = PlayerPrefs.GetString ("usuario");
		modo = PlayerPrefs.GetInt ("modo");

		if (modo == 0 || modo == 1) {
			tipo = 0;
		}

		if (modo == 2) {
			tipo = 1;
		}

		txtTematica.text = PlayerPrefs.GetString ("tematica");
		txtAciertos.text = "Aciertos:" + aciertos.ToString();
		SecuenciaJuego ();
		btnV.gameObject.SetActive (false);
		btnF.gameObject.SetActive (false);
		btnA.gameObject.SetActive (false);
		btnB.gameObject.SetActive (false);
		btnC.gameObject.SetActive (false);
		btnD.gameObject.SetActive (false);
	}

	void Update(){
		
		txtAciertos.text = "Aciertos:" + aciertos.ToString();
	}
		
	public void SecuenciaJuego(){
		
		print ("Llamando a corutina");
		if (modo == 0 || modo == 2) {
			StartCoroutine (LoadDatos ());
		}

		if (modo == 1) {
			StartCoroutine (LoadRepaso ());
		}
	}

	IEnumerator LoadRepaso(){
		tema = PlayerPrefs.GetString ("tematica");
		tema = WWW.EscapeURL (tema);
		print ("http://ucalearn.uca.es/mydb/repaso.php?tematica=" + tema + "&usuario=" + usuario);
		WWW www = new WWW ("http://ucalearn.uca.es/mydb/repaso.php?tematica=" + tema + "&usuario=" + usuario + "&tipo=" + tipo);
		yield return www;
		Debug.Log (www.text);
		if (www.text == "99") {
			SceneManager.LoadScene ("RepasoNulo");
		}

		string concatS = www.text;
		a_datos = concatS.Split(splitters);
		info = new List<string> (a_datos);
		//print (info [0]);

		iteraciones = int.Parse (info [0].ToString()); //Ya tenemos cantidad de veces a generar juego...	

		int number = info.Count;
		//print (info [number - 1]);
		info.RemoveAt (number - 1);
		//print (info [number - 2]);
		int k = 0;
		foreach (string item in info) { print ("Posicion " + k + ":" + item); k++;}
		generaJuego (info);
	}

	IEnumerator LoadDatos(){
		tema = PlayerPrefs.GetString ("tematica");
		tema = WWW.EscapeURL (tema);
		print ("http://ucalearn.uca.es/mydb/secuencia.php?tematica=" + tema);
		WWW www = new WWW ("http://ucalearn.uca.es/mydb/secuencia.php?tematica=" + tema + "&tipo=" + tipo + "&modo=" + modo);
		yield return www;
		Debug.Log (www.text);

		if (www.text == "999") {
			SceneManager.LoadScene ("ExamenNoActivado");
		}

		string concatS = www.text;
		a_datos = concatS.Split(splitters);
		info = new List<string> (a_datos);
		//print (info [0]);

		iteraciones = int.Parse (info [0].ToString()); //Ya tenemos cantidad de veces a generar juego...	

		int number = info.Count;
		//print (info [number - 1]);
		info.RemoveAt (number - 1);
		//print (info [number - 2]);
		int k = 0;
		foreach (string item in info) { print ("Posicion " + k + ":" + item); k++;}
		generaJuego (info);
	}

	void generaJuego(List<string> info){

		if (iteraciones != 0) {
			
			id_Pregunta = int.Parse(info [index - 1].ToString ());
			s_Titulo = info [index].ToString ();

			//Comprueba si es del tipo V/F...
		
			if (info [index + 1].ToString () == "V" || info [index + 1].ToString () == "F") {
				
				s_VF = info [index + 1].ToString ();
				cargaVF (s_Titulo, s_VF);
				index = index + 3;
				goto done;
			} 

			//Comprueba si es del tipo MultipleRespuesta...
			index = index + 1;
			s_Resp1 = info [index].ToString ();
			index = index + 2;

			s_Resp2 = info [index].ToString ();
			index = index + 2;

			s_Resp3 = info [index].ToString ();
			index = index + 2;

			s_Resp4 = info [index].ToString ();
			cargaN (s_Titulo, s_Resp1, s_Resp2, s_Resp3, s_Resp4);
			index = index + 3;
		}
		done:

		if (iteraciones == 0) {
			PlayerPrefs.SetInt ("aciertos", aciertos);
			if (modo == 2) {
				print ("Envio aciertos a la BD");
				WWWForm formulario = new WWWForm ();
				formulario.AddField ("temaPost", WWW.UnEscapeURL(tema));
				formulario.AddField ("usuarioPost", usuario);
				formulario.AddField ("aciertosPost", aciertos);
				formulario.AddField ("totalPost", total);

				WWW xyz = new WWW (InsertAciertosURL, formulario);
			}
			SceneManager.LoadScene ("Fin");
		}
	}

	void cargaVF(string t_Pregunta, string t_RespVF){
		
		btnV.gameObject.SetActive (true);
		btnF.gameObject.SetActive (true);

		txtTitulo.text = t_Pregunta;
		//Seguir...

	}

	void cargaN(string t_Preg, string t_Resp1, string t_Resp2, string t_Resp3, string t_Resp4){

		btnA.gameObject.SetActive (true);
		btnB.gameObject.SetActive (true);
		btnC.gameObject.SetActive (true);
		btnD.gameObject.SetActive (true);

		txtTitulo.text = t_Preg;

		int rng = Random.Range (1, 4); //Para hacer asignaciones diferentes...

		switch (rng) {
		case 1: 
			btnA.GetComponentInChildren<Text> ().text = t_Resp1;
			btnB.GetComponentInChildren<Text> ().text = t_Resp2;
			btnC.GetComponentInChildren<Text> ().text = t_Resp3;
			btnD.GetComponentInChildren<Text> ().text = t_Resp4;
			break;
		case 2:
			btnA.GetComponentInChildren<Text> ().text = t_Resp2;
			btnB.GetComponentInChildren<Text> ().text = t_Resp3;
			btnC.GetComponentInChildren<Text> ().text = t_Resp4;
			btnD.GetComponentInChildren<Text> ().text = t_Resp1;
			break;
		case 3:
			btnA.GetComponentInChildren<Text> ().text = t_Resp3;
			btnB.GetComponentInChildren<Text> ().text = t_Resp4;
			btnC.GetComponentInChildren<Text> ().text = t_Resp1;
			btnD.GetComponentInChildren<Text> ().text = t_Resp2;
			break;
		case 4:
			btnA.GetComponentInChildren<Text> ().text = t_Resp4;
			btnB.GetComponentInChildren<Text> ().text = t_Resp1;
			btnC.GetComponentInChildren<Text> ().text = t_Resp2;
			btnD.GetComponentInChildren<Text> ().text = t_Resp3;
			break;
		}

		//Seguir...
	}

	public void pulsaBtnV(){

		if (s_VF == "V") {
			if (modo == 0 || modo == 1) {
				limpiaCorrecta (id_Pregunta, usuario, tema);
			}
			aciertos++;
			mySound.PlayOneShot (audioC, 0.8f);
		}
		if (s_VF != "V") {
			if (modo != 2) {
				insertaFallo (id_Pregunta, usuario, tema);
			}
			mySound.PlayOneShot (audioI, 0.8f);
		}
		total++;
		iteraciones--;
		desactivaBotones ();
		generaJuego (info);
	}

	public void pulsaBtnF(){
	
		if (s_VF == "F") {
			if (modo == 0 || modo == 1) {
				print (tema);
				limpiaCorrecta (id_Pregunta, usuario, tema);
			}
			aciertos++;
			mySound.PlayOneShot (audioC, 0.8f);
		}

		if (s_VF != "F") {
			if (modo != 2) {
				insertaFallo (id_Pregunta, usuario, tema);
			}
			mySound.PlayOneShot (audioI, 0.8f);
		}
		total++;
		iteraciones--;
		desactivaBotones ();
		generaJuego (info);
	}

	public void pulsaBtnA(){
		if (btnA.GetComponentInChildren<Text> ().text == s_Resp1) {
			if (modo == 0 || modo == 1) {
				limpiaCorrecta (id_Pregunta, usuario, tema);
			}
			aciertos++;
			mySound.PlayOneShot (audioC, 0.8f);

		}
		if (btnA.GetComponentInChildren<Text> ().text != s_Resp1) {
			if (modo != 2) {
				insertaFallo (id_Pregunta, usuario, tema);
			}
			mySound.PlayOneShot (audioI, 0.8f);
		}
		total++;
		iteraciones--;
		desactivaBotones ();
		generaJuego (info);
	}

	public void pulsaBtnB(){
		if (btnB.GetComponentInChildren<Text> ().text == s_Resp1) {
			if (modo == 0 || modo == 1) {
				limpiaCorrecta (id_Pregunta, usuario, tema);
			}
			aciertos++;
			mySound.PlayOneShot (audioC, 0.8f);

		}
		if (btnB.GetComponentInChildren<Text> ().text != s_Resp1) {
			if (modo != 2) {
				insertaFallo (id_Pregunta, usuario, tema);
			}
			mySound.PlayOneShot (audioI, 0.8f);
		}
		total++;
		iteraciones--;
		desactivaBotones ();
		generaJuego (info);
	}

	public void pulsaBtnC(){
		if (btnC.GetComponentInChildren<Text> ().text == s_Resp1) {
			if (modo == 0 || modo == 1) {
				limpiaCorrecta (id_Pregunta, usuario, tema);
			}
			aciertos++;
			mySound.PlayOneShot (audioC, 0.8f);

		}
		if (btnC.GetComponentInChildren<Text> ().text != s_Resp1) {
			if (modo != 2) {
				insertaFallo (id_Pregunta, usuario, tema);
			}
			mySound.PlayOneShot (audioI, 0.8f);
		}

		total++;
		iteraciones--;
		desactivaBotones ();
		generaJuego (info);
	}

	public void pulsaBtnD(){
		if (btnD.GetComponentInChildren<Text> ().text == s_Resp1) {
			if (modo == 0 || modo == 1) {
				limpiaCorrecta (id_Pregunta, usuario, tema);
			}
			aciertos++;
			mySound.PlayOneShot (audioC, 0.8f);

		}

		if (btnD.GetComponentInChildren<Text> ().text != s_Resp1) {
			if (modo != 2) {
				insertaFallo (id_Pregunta, usuario, tema);
			}
			mySound.PlayOneShot (audioI, 0.8f);
		}
		total++;
		iteraciones--;
		desactivaBotones ();
		generaJuego (info);
	}

	void insertaFallo(int id, string usu, string temat){
	
		WWWForm formularioFallo = new WWWForm ();
		formularioFallo.AddField ("usuarioP", usu);
		formularioFallo.AddField ("temaPost", WWW.UnEscapeURL(temat));
		formularioFallo.AddField ("idPost", id);

		WWW xzz = new WWW (InsertFalloURL, formularioFallo);
	}

	void limpiaCorrecta(int id, string usu, string temat){

		print ("Limpiando en BD");
		WWWForm formularioLimpia = new WWWForm ();
		formularioLimpia.AddField ("usuarioDP", usu);
		formularioLimpia.AddField ("temaDP", WWW.UnEscapeURL(temat));
		formularioLimpia.AddField ("idDP", id);

		WWW zzz = new WWW (DeleteFalloURL, formularioLimpia);
	}

	void desactivaBotones(){
	
		btnV.gameObject.SetActive (false);
		btnF.gameObject.SetActive (false);
		btnA.gameObject.SetActive (false);
		btnB.gameObject.SetActive (false);
		btnC.gameObject.SetActive (false);
		btnD.gameObject.SetActive (false);
	}
}
