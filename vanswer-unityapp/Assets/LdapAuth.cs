using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.DirectoryServices;
using UnityEngine.UI;

public class LdapAuth : MonoBehaviour {

    private void Start()
    {
        // build UID string
        string uid = "cn=45327753,dc=uca,dc=es";
        // assign password
        string password = "thisisnotmypass1";
        // define LDAP connection
        DirectoryEntry dir = new DirectoryEntry("ldap://ldap.uca.es", uid, password, AuthenticationTypes.None);
        Debug.Log("Autenticando usuario:");

        object obj = dir.NativeObject;
        Debug.Log("Parece autenticado?");
    }
    
}
