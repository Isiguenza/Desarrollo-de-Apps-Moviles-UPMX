//
//  ContentView.swift
//  PokeAPI
//
//  Created by Iñaki Sigüenza on 10/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    var body: some View {
        NavigationStack{
            List(viewModel.pokemons){ pokemon in
                
                NavigationLink{
                    PokemonDetailView(
                            pokemon: pokemon,
                            viewModel: viewModel
                        )
                } label: {
                    HStack{
                        
                        AsyncImage(url: viewModel.imageURL(for: pokemon)){ image in
                            
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
        }
        .task {
            await viewModel.fetchPokemons()
            
        
        }
    }
    
    func pokemonImageURL(from url: String) -> String {
        
        let parts = url.split(separator: "/")
        
        guard let id = parts.last(where: {!$0.isEmpty}) else {return ""}
        
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
    }
}

#Preview {
    ContentView()
}
