//
//  AuthModel.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 24/03/26.
//

import Foundation

struct LoginRequest: Encodable{
    let username: String
    let password: String
}

struct LoginResponse: Decodable{
    let accessToken: String?
}
