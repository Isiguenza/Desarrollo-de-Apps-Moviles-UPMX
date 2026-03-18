//
//  PokeModel.swift
//  PokeAPI
//
//  Created by Iñaki Sigüenza on 10/03/26.
//


struct Pokemon: Decodable, Identifiable {
    
    let name: String
    let url: String
    
    var id: Int {
        let parts = url.split(separator: "/")
        return Int(parts.last(where: { !$0.isEmpty }) ?? "") ?? 0
    }
}


struct PokemonResponse: Decodable {
    let results: [Pokemon]
}



struct PokemonDetail: Decodable {
    
    let height: Int
    let weight: Int
    let types: [PokemonTypeEntry]
    
}

struct PokemonTypeEntry: Decodable {
    
    let type: PokemonType
    
}

struct PokemonType: Decodable {
    
    let name: String
    
}
