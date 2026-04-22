//
//  models.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import Foundation

// MARK: - Auth Response

struct AuthResponse: Decodable {
    let id: Int
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let gender: String
    let image: String
    let accessToken: String
    let refreshToken: String
}

// MARK: - Comment

struct CommentResponse: Decodable {
    let comments: [Comment]
}

struct Comment: Decodable, Identifiable {
    let id: Int
    let body: String
    let user: CommentUser
}

struct CommentUser: Decodable {
    let username: String
}
