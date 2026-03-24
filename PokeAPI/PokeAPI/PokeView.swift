//
//  PokeView.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 24/03/26.
//

import SwiftUI

struct PokeView: View {
    
    @StateObject var viewModel = PokemonViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.pokemons){ pokemon in
                
                NavigationLink{
                    PokemonDetailView(pokemon: pokemon, viewModel: viewModel)
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
                .navigationTitle("Pokemon")
                
            }
        }
        .task {
            await viewModel.fetchPokemons()
        }
    }
    
   
}

#Preview {
    PokeView()
}
