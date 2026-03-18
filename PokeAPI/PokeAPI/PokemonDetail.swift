//
//  PokemonDetail.swift
//  PokeAPI
//
//  Created by Iñaki Sigüenza on 11/03/26.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    @ObservedObject var viewModel: PokemonViewModel
    var body: some View {
        
        ZStack(alignment: .top) {
            
            // MARK: Top Gradient
            
            LinearGradient(
                colors: [
                    gradientColor(),
                    .white
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 300)
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // MARK: Pokemon image
                
                AsyncImage(url: viewModel.imageURL(for: pokemon)) { image in
                    
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 180)
                .padding(.top, 40)
                
                // MARK: Name
                
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let detail = viewModel.selectedPokemon {
                    
                    // MARK: Types
                    
                    HStack {
                        ForEach(detail.types, id: \.type.name) { entry in
                            
                            Text(entry.type.name.capitalized)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    gradientColor().opacity(0.2)
                                )
                                .cornerRadius(12)
                        }
                    }
                    
                    // MARK: Stats Card
                    
                    VStack(spacing: 12) {
                        
                        statRow(title: "Height", value: "\(detail.height)")
                        
                        statRow(title: "Weight", value: "\(detail.weight)")
                        
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(16)
                    .shadow(radius: 8)
                    .padding(.horizontal)
                }
                
                Spacer()
            }
        }
        .task {
            await viewModel.fetchPokemonDetail(id: pokemon.id)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    // MARK: Stat Row
    
    func statRow(title: String, value: String) -> some View {
        
        HStack {
            Text(title)
                .foregroundColor(.secondary)
            
            Spacer()
            
            Text(value)
                .fontWeight(.bold)
        }
    }
    
    
    // MARK: Color based on type
    
    func gradientColor() -> Color {
        
        guard let type = viewModel.selectedPokemon?.types.first?.type.name else {
            return .gray
        }
        
        switch type {
            
        case "fire":
            return .red
            
        case "water":
            return .blue
            
        case "grass":
            return .green
            
        case "electric":
            return .yellow
            
        case "psychic":
            return .pink
            
        case "ice":
            return .cyan
            
        case "ground":
            return .brown
            
        default:
            return .gray
        }
    }
}
