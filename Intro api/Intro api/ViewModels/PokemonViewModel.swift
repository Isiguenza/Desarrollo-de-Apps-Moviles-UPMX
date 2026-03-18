//
//  PokemonViewModel.swift
//  Intro api
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

import Foundation
import Combine

/*
========================================================
EXPLICACIÓN: ObservableObject
========================================================

ObservableObject es un protocolo que permite que una
clase sea "observada" por SwiftUI.

Cuando alguna propiedad marcada con @Published cambia,
las vistas que están observando esta clase se vuelven
a renderizar automáticamente.

Es la base para manejar datos externos como APIs.

Ejemplo conceptual:

class UserViewModel: ObservableObject {

    @Published var name: String = ""

}

Si "name" cambia, cualquier vista que observe este
ViewModel se actualizará automáticamente.
*/

class PokemonViewModel: ObservableObject {
    
    /*
    ========================================================
    EXPLICACIÓN: @Published
    ========================================================
    
    @Published marca una propiedad como observable.
    
    Cuando su valor cambia, SwiftUI vuelve a renderizar
    las vistas que están usando este ViewModel.
    
    Ejemplo:
    
    @Published var pokemons: [Pokemon] = []
    
    Cuando asignamos nuevos pokemons después de llamar
    la API, la List se actualiza automáticamente.
    */
    
    @Published var pokemons: [Pokemon] = []
    
    // Función que consume la API
    func fetchPokemons() async {
        
        // Endpoint de PokeAPI
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20") else {
            return
        }
        
        do {
            
            // URLSession descarga los datos de internet
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Convertimos el JSON en nuestros modelos Swift
            let decoded = try JSONDecoder().decode(PokemonResponse.self, from: data)
            
            // Actualizamos la propiedad observable
            DispatchQueue.main.async {
                self.pokemons = decoded.results
            }
            
        } catch {
            print("Error fetching pokemon:", error)
        }
    }
}
