//
//  LoginView.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 24/03/26.
//

import SwiftUI


struct LoginView: View {
    
    @ObservedObject var authViewModel: AuthViewModel
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            Text("Pokedex Login")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Usuario", text: $username)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            
            SecureField("Contraseña", text: $password)
                .textFieldStyle(.roundedBorder)
            
            if authViewModel.isLoading {
                HStack{
                    ProgressView()
                    Text("Cargando...")
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                }
            } else {
                Button{
                    
                    Task{
                        await authViewModel.login(username: username, password: password)
                    }
                    
                } label: {
                    Text("Iniciar Sesión")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            
            if authViewModel.loginFailed {
                Text("Usuario o contraseña Incorrecto")
                    .foregroundStyle(.red)
                    .font(.footnote)
            }
            
        }
        .padding(.horizontal, 32)
    }
}
