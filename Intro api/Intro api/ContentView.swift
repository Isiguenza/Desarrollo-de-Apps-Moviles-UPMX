//
//  ContentView.swift
//  Intro api
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

import SwiftUI

struct ContentView: View {
    
    /*
    ========================================================
    EXPLICACIÓN: @StateObject
    ========================================================
    
    Usamos @StateObject cuando una vista CREA el ViewModel.
    
    Esto significa que la vista es dueña del ciclo de vida
    de ese objeto.
    
    SwiftUI se encarga de mantener esa instancia viva
    mientras la vista exista.
    */
    
    @StateObject var viewModel = PokemonViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(viewModel.pokemons) { pokemon in
                
                NavigationLink {
                    
                    // Navegamos a la pantalla de detalle
                    PokemonDetailView(pokemon: pokemon)
                    
                } label: {
                    
                    HStack {
                        
                        // Imagen del pokemon
                        AsyncImage(
                            url: URL(string: pokemonImageURL(from: pokemon.url))
                        ) { image in
                            
                            image
                                .resizable()
                                .scaledToFit()
                            
                        } placeholder: {
                            
                            ProgressView()
                        }
                        .frame(width: 60, height: 60)
                        
                        Text(pokemon.name.capitalized)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Pokémon")
        }
        
        // .task se ejecuta cuando la vista aparece
        .task {
            await viewModel.fetchPokemons()
        }
    }
    
    // Extraemos el ID del pokemon desde su URL
    func pokemonImageURL(from url: String) -> String {
        
        let parts = url.split(separator: "/")
        
        guard let id = parts.last(where: { !$0.isEmpty }) else {
            return ""
        }
        
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}

#Preview {
    ContentView()
}
