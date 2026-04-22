//
//  LoginView.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionManager
    @StateObject var viewModel = AuthViewModel()
    
    @State private var username = "emilys"
    @State private var password = "emilyspass"
    
    var body: some View {
        
        ZStack {
            // Fondo con gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                
                Spacer()
                
                // Logo o título
                VStack(spacing: 10) {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white)
                    
                    Text("Forum App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Bienvenido de vuelta")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
                
                // Formulario de login
                VStack(spacing: 20) {
                    
                    // Campo de usuario
                    HStack {
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                        TextField("Username", text: $username)
                            .autocapitalization(.none)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    
                    // Campo de contraseña
                    HStack {
                        Image(systemName: "lock.fill")
                            .foregroundColor(.gray)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    
                    // Botón de login
                    Button(action: {
                        Task {
                            await viewModel.login(
                                username: username,
                                password: password,
                                session: session
                            )
                        }
                    }) {
                        HStack {
                            if viewModel.isLoading {
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            } else {
                                Text("Iniciar Sesión")
                                    .fontWeight(.semibold)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(12)
                    }
                    .disabled(viewModel.isLoading)
                }
                .padding(.horizontal, 32)
                
                Spacer()
                
                // Credenciales de prueba
                VStack(spacing: 8) {
                    Text("Credenciales de prueba:")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                    Text("emilys / emilyspass")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 32)
            }
        }
    }
}
