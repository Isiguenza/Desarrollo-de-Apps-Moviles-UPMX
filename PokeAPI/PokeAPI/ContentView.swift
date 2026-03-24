//
//  ContentView.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some View {
        
        
        if authViewModel.isLoggedIn {
            PokeView()
        } else {
            LoginView(authViewModel: authViewModel)
        }
        
        
    }
    
    
}

#Preview {
    ContentView()
}
