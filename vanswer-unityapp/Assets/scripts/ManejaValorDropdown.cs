using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class ManejaValorDropdown : MonoBehaviour {

	//Attach this script to a Dropdown GameObject
	public Dropdown m_Dropdown;
    //This is the string that stores the current selection m_Text of the Dropdown
    //private string m_CategoriaElegida;
    //This Text outputs the current selection to the screen
    //private int m_DropdownValue;
    public Text sesion;

    void Awake(){
        sesion.text = "Sesion iniciada: " + PlayerPrefs.GetString("usuario");
        addListenerToDropdown ();
	}

	void addListenerToDropdown(){

		m_Dropdown.onValueChanged.AddListener (delegate {
			OnDropdownSelect (m_Dropdown);
		});

	}

	void OnDropdownSelect(Dropdown drop){

		int m_Dropdownvalue = m_Dropdown.value;
		PlayerPrefs.SetString ("tematica", m_Dropdown.options[m_Dropdownvalue].text);
		//m_DropdownValue = m_Dropdown.value;
		//m_CategoriaElegida = m_Dropdown.options[m_DropdownValue].text;
		//PlayerPrefs.SetString ("tematica", m_CategoriaElegida.ToString ());

	}
}
