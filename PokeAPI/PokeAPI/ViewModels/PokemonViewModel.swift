//
//  PokemonViewModel.swift
//  PokeAPI
//
//  Created by Iñaki Sigüenza on 10/03/26.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject{
    
    @Published var pokemons: [Pokemon] = []
    
    func fetchPokemons() async {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else {return}
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode(PokemonResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.pokemons = decoded.results
            }
            
        } catch {
            print("error al jalar a los bichitos")
        }
        
    }
    
    func imageURL(for pokemon: Pokemon) -> URL? {
          
          let urlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png"
          
          return URL(string: urlString)
      }
    
    
    @Published var selectedPokemon: PokemonDetail?

    func fetchPokemonDetail(id: Int) async {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
            return
        }
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode(PokemonDetail.self, from: data)
            
            DispatchQueue.main.async {
                self.selectedPokemon = decoded
            }
            
        } catch {
            print(error)
        }
    }
    
}
