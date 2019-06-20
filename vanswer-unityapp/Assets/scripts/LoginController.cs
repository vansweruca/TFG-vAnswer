using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System.IO;
using UnityEngine.SceneManagement;
using System.Runtime.Serialization.Formatters.Binary;

public class LoginController : MonoBehaviour {

	string CreateUserURL = "http://ucalearn.uca.es/mydb/insertUsuario.php";
    public Text txtErr;
    [SerializeField]
	private InputField inputID;
    [SerializeField]
    private InputField inputPass;
    
    private void Start()
    {
        txtErr.gameObject.SetActive(false);
        inputID.characterLimit = 9;
    }

    private void activaErrTxt() {

        txtErr.gameObject.SetActive(true);
    }

    public void cargaIni()
    {
        SceneManager.LoadScene("Inicio");
    }

    public void badUser()
    {
        activaErrTxt();
        Invoke("cargaIni", 5f);
    }

	public void GetInput(){
        Debug.Log("hola");
		Debug.Log ("You entered: " + inputID.text);
        Debug.Log("You typed: " + inputPass.text);
		
        Debug.Log(inputID.text);
        Debug.Log(inputPass.text);

        string c = inputID.text;
        string p = inputPass.text;
        PlayerPrefs.SetString("usuario", inputID.text);

        StartCoroutine(Wait(c,p));
	}

	IEnumerator Wait(string c, string p){

        //Corutina
        Debug.Log("Esperando..");
        
        p = WWW.EscapeURL(p);
        WWW www = new WWW("http://ucalearn.uca.es:8080/restLearn-Ldap/rest/service/ldap/" + c + "/" + p);
        yield return www;

        Debug.Log(www.text);
        if (www.text == "1")
        {
            guardarDatosInicio(c);
            llamaInsercion(c);
            
        }
        else
        {
            badUser();
        }
    }

    public static void guardarDatosInicio(string c)
    {
        BinaryFormatter formatter = new BinaryFormatter();
        string path = Application.persistentDataPath + "/player.dat";
        FileStream stream = new FileStream(path, FileMode.Create);
        formatter.Serialize(stream, c);
        stream.Close();
    }

    public void llamaInsercion(string c)
    {
        WWWForm form = new WWWForm();
        form.AddField("clavePost", c);
        
        WWW www = new WWW(CreateUserURL, form);
        StartCoroutine(WaitFor());
        Debug.Log("Llamo rutina escribir usuario.");
       // SceneManager.LoadScene("EleccionModo");
    }

    IEnumerator WaitFor()
    {
        Debug.Log("Espero que acabe rutina escritura.");
        yield return new WaitForSeconds(5);
        
        SceneManager.LoadScene("EleccionModo");
    }
}
