//
//  ProfileView.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    
                    // Foto de perfil
                    AsyncImage(url: URL(string: session.userImage)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ZStack {
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                            ProgressView()
                        }
                    }
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.blue, lineWidth: 3)
                    )
                    .shadow(radius: 5)
                    
                    // Nombre de usuario
                    Text(session.userName)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Información adicional
                    VStack(spacing: 16) {
                        InfoRow(icon: "person.fill", title: "Username", value: session.userName)
                        InfoRow(icon: "key.fill", title: "Token", value: String(session.token?.prefix(20) ?? "") + "...")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    Spacer()
                    
                    // Botón de logout
                    Button(action: {
                        session.logout()
                    }) {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                            Text("Cerrar Sesión")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 32)
                }
                .padding(.top, 32)
            }
            .navigationTitle("Perfil")
        }
    }
}

// Componente auxiliar para mostrar información
struct InfoRow: View {
    let icon: String
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.body)
            }
            
            Spacer()
        }
    }
}
