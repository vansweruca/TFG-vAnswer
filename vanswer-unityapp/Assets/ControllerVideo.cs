using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Text;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Video;


public class ControllerVideo : MonoBehaviour {

    public Text sesion;
    private void Awake()
    {
        sesion.text = "Sesion iniciada: " + PlayerPrefs.GetString("usuario");
    }
    
    public GameObject gObj;
	// Use this for initialization
	void Start () {
        gObj = GameObject.Find("QuadVP");
        var videoP = gObj.GetComponent<UnityEngine.Video.VideoPlayer>();
        videoP.url = "http://ucalearn.uca.es/descarga/files/" + RemoveDiacritics(PlayerPrefs.GetString("tematica")) + ".mp4";
        Debug.Log(videoP.url);
	}

    static string RemoveDiacritics(string text)
    {
        var normalizedString = text.Normalize(NormalizationForm.FormD);
        var stringBuilder = new System.Text.StringBuilder();

        foreach (var c in normalizedString)
        {
            var unicodeCategory = CharUnicodeInfo.GetUnicodeCategory(c);
            if (unicodeCategory != UnicodeCategory.NonSpacingMark)
            {
                stringBuilder.Append(c);
            }
        }

        return stringBuilder.ToString().Normalize(NormalizationForm.FormC);
    }

    // Update is called once per frame
    void Update () {
		
	}
}
