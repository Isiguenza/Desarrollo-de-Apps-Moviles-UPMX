//
//  sessionManager.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import Foundation
import Combine

/*
========================================================
SESSION MANAGER
========================================================

Esta clase se encarga de manejar la sesión del usuario.

Guardamos el token en UserDefaults para que:
- La sesión persista aunque la app se cierre
- El usuario no tenga que hacer login otra vez
*/

class SessionManager: ObservableObject {
    
    @Published var token: String? = nil
    @Published var userName: String = ""
    @Published var userImage: String = ""
    
    init() {
        loadSession()
    }
    
    // MARK: - Save session
    
    /*
    Guardamos datos en UserDefaults
    
    UserDefaults es un almacenamiento local simple
    para datos pequeños (como tokens o preferencias)
    */
    
    func saveSession(token: String, name: String, image: String) {
        
        UserDefaults.standard.set(token, forKey: "token")
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(image, forKey: "image")
        
        self.token = token
        self.userName = name
        self.userImage = image
    }
    
    // MARK: - Load session
    
    func loadSession() {
        
        let savedToken = UserDefaults.standard.string(forKey: "token")
        let savedName = UserDefaults.standard.string(forKey: "name")
        let savedImage = UserDefaults.standard.string(forKey: "image")
        
        self.token = savedToken
        self.userName = savedName ?? ""
        self.userImage = savedImage ?? ""
    }
    
    // MARK: - Logout
    
    func logout() {
        
        UserDefaults.standard.removeObject(forKey: "token")
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "image")
        
        token = nil
        userName = ""
        userImage = ""
    }
}
