//
//  AuthViewModel.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 24/03/26.
//

import Foundation
import Combine

@MainActor //Corre en el main Thread
class AuthViewModel: ObservableObject{
    @Published var isLoggedIn: Bool = false
    @Published var isLoading: Bool = false
    @Published var loginFailed: Bool = false
    
    func login(username: String, password: String) async{
        
        guard let url = URL(string: "https://dummyjson.com/auth/login") else {return}
        
        var request = URLRequest(url: url)
        
        //Indicamos que es una peticion POST
        request.httpMethod = "POST"
        
        //Avisamos que enviaremos un JSON en el body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //Creamos el objeto que vamos a enviar
        let loginRequest = LoginRequest(
            username: username,
            password: password
        )
        
        //Convertimos el objeto a JSON
        guard let body = try? JSONEncoder().encode(loginRequest) else {return}
        
        //Asignamos nuestro objeto JSON al body de la petición
        request.httpBody = body
        
        isLoading = true
        
        do {
            
            //Descargamos la respuesta de Internet (lo que nos regresa dummy JSON)
            let (data, _) = try await URLSession.shared.data(for: request)
            //Decodeamos/Decodificamos la respyesta a nuestro model Login Response
            let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
            
            if decoded.accessToken != nil {
                //Imprimimos el token dle usuarios (por chismosos)
                print("Login Exitoso. Token: \(decoded.accessToken)")
                
                //Marcamos que el usuario ya esta loggeado
                isLoggedIn = true
            } else {
                
                loginFailed = true
            }
            
            
            
        } catch {
            print("Error en el login \(error)")
            
            loginFailed = true
        }
        
        isLoading = false
        
        
    }
}
