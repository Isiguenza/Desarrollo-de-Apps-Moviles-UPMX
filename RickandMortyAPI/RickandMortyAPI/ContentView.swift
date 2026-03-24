//
//  ContentView.swift
//  RickandMortyAPI
//
//  Created by Iñaki Sigüenza on 19/03/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = CharacterViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.characters) { character in
                
                NavigationLink {
                    EmptyView()
                } label: {
                    HStack(spacing: 12) {
                        
                        // Imagen con estilo
                        AsyncImage(url: URL(string: character.image)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            ZStack {
                                Color.gray.opacity(0.2)
                                ProgressView()
                            }
                        }
                        .frame(width: 70, height: 70)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.white.opacity(0.1), lineWidth: 1)
                        )
                        .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
                        
                        
                      
                        VStack(alignment: .leading, spacing: 6) {
                            Text(character.name)
                                .font(.headline)
                                .foregroundStyle(.primary)
                            
                            Text("Rick & Morty Character")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        
                        Spacer()
                        
                        
                    }
                    .padding(10)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(.systemBackground))
                            .shadow(color: .black.opacity(0.05), radius: 6, x: 0, y: 4)
                    )
                    .padding(.vertical, 6)
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Characters")
        }
        .task {
            await viewModel.fetchCharacters()
        }
    }
}

#Preview {
    ContentView()
}

