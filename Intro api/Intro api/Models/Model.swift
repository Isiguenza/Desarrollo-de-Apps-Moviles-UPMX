//
//  Model.swift
//  Intro api
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

import Foundation

// Este modelo representa UN pokemon dentro de la lista.
// El JSON de la API tiene esta forma:
//
// {
//   "name": "bulbasaur",
//   "url": "https://pokeapi.co/api/v2/pokemon/1/"
// }
//
// Solo necesitamos estas dos propiedades para empezar.

struct Pokemon: Decodable, Identifiable {
    
    // Usamos name como id porque es único en la lista
    var id: String { name }
    
    let name: String
    let url: String
}


// La API no devuelve un array directo.
// Devuelve un objeto que contiene "results".
//
// {
//   "results": [ ... ]
// }

struct PokemonResponse: Decodable {
    let results: [Pokemon]
}
