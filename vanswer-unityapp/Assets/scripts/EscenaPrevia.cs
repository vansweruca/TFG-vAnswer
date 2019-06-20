using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using UnityEngine;
using UnityEngine.SceneManagement;

public class EscenaPrevia : MonoBehaviour {

    int indiceEscena;
    
	// Use this for initialization
	void Start () {

        indiceEscena = SceneManager.GetActiveScene().buildIndex;       
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            if (indiceEscena == 0)
            {
                Application.Quit();
            }
            else
            {
                SceneManager.LoadScene(indiceEscena - 1);
            }
        }
            

	}

    public void cargaDatosInicio()
    {

        string path = Application.persistentDataPath + "/player.dat";

        if (File.Exists(path))
        {
            BinaryFormatter formatter = new BinaryFormatter();
            FileStream stream = new FileStream(path, FileMode.Open);
            string id = formatter.Deserialize(stream) as string;
            stream.Close();
            PlayerPrefs.SetString("usuario", id);
            SceneManager.LoadScene("EleccionModo");
        }
        else
        {
            Debug.LogError("Fichero guardado no existe en:" + path);
            SceneManager.LoadScene("Inicio");
        }


    }
}
