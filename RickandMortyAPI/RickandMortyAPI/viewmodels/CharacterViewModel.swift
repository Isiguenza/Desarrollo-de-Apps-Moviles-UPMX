//
//  CharacterViewModel.swift
//  RickandMortyAPI
//
//  Created by Iñaki Sigüenza on 19/03/26.
//

import Foundation
import Combine

//Todo corre en el hilo principal
@MainActor
class CharacterViewModel: ObservableObject {
    
    @Published var characters: [Character] = []
    
    func fetchCharacters() async {
        
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {return}
        
        do {
            
            //URLSession descarga los datos de internet
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //Convertimos el JSON en nuestro modelo de Swift
            let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
            
            //Ya no usamos DispatchQueue.main.async por que estamos usando @MainActor en la clase
            self.characters = decoded.results
            
            
        } catch {
            print("Error al jalar pokemons")
        }
        
        
    }
}
