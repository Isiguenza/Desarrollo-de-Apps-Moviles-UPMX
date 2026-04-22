//
//  AuthViewModel.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import Foundation
import Combine

class AuthViewModel: ObservableObject {
    
    @Published var isLoading = false
    
    func login(username: String, password: String, session: SessionManager) async {
        
        guard let url = URL(string: "https://dummyjson.com/auth/login") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Body JSON
        let body = [
            "username": username,
            "password": password
        ]
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            isLoading = true
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            if let jsonString = String(data: data, encoding: .utf8) {
                print("📦 Respuesta del API:", jsonString)
            }
            
            let decoded = try JSONDecoder().decode(AuthResponse.self, from: data)
            
            DispatchQueue.main.async {
                
                session.saveSession(
                    token: decoded.accessToken,
                    name: decoded.firstName,
                    image: decoded.image
                )
                
                self.isLoading = false
            }
            
        } catch {
            print(error)
        }
    }
}
