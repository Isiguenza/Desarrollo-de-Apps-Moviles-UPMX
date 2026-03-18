//
//  PokemonDetailView.swift
//  Intro api
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

import SwiftUI

/*
========================================================
EXPLICACIÓN: @ObservedObject
========================================================

@ObservedObject se usa cuando una vista RECIBE un objeto
que es ObservableObject pero no es la dueña.

Es decir:

- @StateObject → crea el objeto
- @ObservedObject → lo recibe

Ejemplo conceptual:

struct ProfileView: View {

    @ObservedObject var viewModel: UserViewModel

}

Si el ViewModel cambia, la vista se actualiza.
*/

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            AsyncImage(
                url: URL(string: pokemonImageURL(from: pokemon.url))
            ) { image in
                
                image
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                
                ProgressView()
            }
            .frame(width: 150, height: 150)
            
            Text(pokemon.name.capitalized)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func pokemonImageURL(from url: String) -> String {
        
        let parts = url.split(separator: "/")
        
        guard let id = parts.last(where: { !$0.isEmpty }) else {
            return ""
        }
        
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}
