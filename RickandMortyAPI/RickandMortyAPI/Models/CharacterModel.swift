//
//  CharacterModel.swift
//  RickandMortyAPI
//
//  Created by Iñaki Sigüenza on 19/03/26.
//

import Foundation

struct Character: Identifiable, Decodable{
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let image: String
}


struct CharacterResponse: Decodable{
    let results: [Character]
}
