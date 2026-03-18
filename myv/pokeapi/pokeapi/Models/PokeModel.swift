//
//  PokeModel.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

/*
 
 
 {
 
    "name": "bullbasur",
    "url": "https://pokeapi.co/api/v2/pokemon/1"
 
 }
 
 Solo necesitamos estas dos propiedades para empezar
 
 */

struct Pokemon: Decodable, Identifiable {
    
    
    
    let name: String
    let url: String
    
    var id: Int {
        let parts = url.split(separator: "/")
        
        return Int(parts.last(where: {!$0.isEmpty}) ?? "") ?? 0
    }
    
    
}



//La API no devuelve un array directo
//Devulve un objeto que contiene "rsults"

/*
 
 {
    "results": [ ... ]
 }
 
 */

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}

struct PokemonDetail: Decodable {
    
    let height: Int
    let weight: Int
    let types: [PokemonTypeEntry]
    
}

struct PokemonTypeEntry: Decodable{
    let type: PokemonType
}

struct PokemonType: Decodable {
    let name: String
}
