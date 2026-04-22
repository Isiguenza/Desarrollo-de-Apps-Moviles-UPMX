//
//  HomeView.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var session: SessionManager
    @StateObject var viewModel = CommentsViewModel()
    
    @State private var showAdd = false
    @State private var newComment = ""
    
    var body: some View {
        
        NavigationStack {
            List(viewModel.comments) { comment in
                CommentCard(comment: comment)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
            }
            .listStyle(.plain)
            .navigationTitle("Forum")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAdd = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
            }
            .alert("Nuevo comentario", isPresented: $showAdd) {
                TextField("Comentario", text: $newComment)
                
                Button("Agregar") {
                    viewModel.addComment(
                        text: newComment,
                        userName: session.userName
                    )
                    newComment = ""
                }
                
                Button("Cancelar", role: .cancel) { }
            }
            .task {
                await viewModel.fetchComments()
            }
        }
    }
}

// Componente para mostrar cada comentario
struct CommentCard: View {
    let comment: Comment
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                Text(comment.user.username)
                    .font(.headline)
                
                Spacer()
            }
            
            Text(comment.body)
                .font(.body)
                .foregroundColor(.primary)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
