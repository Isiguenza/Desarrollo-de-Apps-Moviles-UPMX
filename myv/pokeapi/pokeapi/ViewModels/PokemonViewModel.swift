//
//  PokemonViewModel.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

import Foundation
import Combine

class PokemonViewModel: ObservableObject{
    
    @Published var pokemons: [Pokemon] = []
    @Published var selectedPokemon: PokemonDetail?
    
    func fetchPokemons() async {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else {return}
        
        do {
            
            //URLSession descarga los datos de internet
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //Convertimos el JSON en nuestro modelo de Swift
            let decoded = try JSONDecoder().decode(PokemonResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.pokemons = decoded.results
            }
            
        } catch {
            print("Error al jalar pokemons")
        }
        
        
    }
    
    func imageURL(for pokemon: Pokemon) -> URL?{
        
        
        let urlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png"
        
        
        return URL(string: urlString)
        
    }
    
    func fetchPokemonDetail(id: Int) async{
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {return}
        
        
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
