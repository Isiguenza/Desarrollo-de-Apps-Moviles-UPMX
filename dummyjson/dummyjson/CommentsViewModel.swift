//
//  CommentsViewModel.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import Foundation
import Combine

class CommentsViewModel: ObservableObject {
    
    @Published var comments: [Comment] = []
    
    // GET comments
    func fetchComments() async {
        
        guard let url = URL(string: "https://dummyjson.com/comments") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoded = try JSONDecoder().decode(CommentResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.comments = decoded.comments
            }
            
        } catch {
            print(error)
        }
    }
    
    // POST comment (simulado)
    func addComment(text: String, userName: String) {
        
        let new = Comment(
            id: Int.random(in: 1000...9999),
            body: text,
            user: CommentUser(username: userName)
        )
        
        comments.insert(new, at: 0)
    }
}
