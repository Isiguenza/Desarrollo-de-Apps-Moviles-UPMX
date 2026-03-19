//
//  PokemonDetail.swift
//  pokeapi
//
//  Created by Iñaki Sigüenza on 04/03/26.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    @ObservedObject var viewModel: PokemonViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            
            LinearGradient(
                
                colors:[
                    gradientColor(),
                    .white
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .frame(height: 300)
            .ignoresSafeArea()
            
            VStack(spacing: 20){
                
                AsyncImage(url: viewModel.imageURL(for: pokemon)){ image in
                    
                    image
                        .resizable()
                        .scaledToFit()
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250)
                .padding(.top, 40)
                
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let detail = viewModel.selectedPokemon {
                    
                    HStack{
                        ForEach(detail.types, id: \.type.name){ entry in
                            
                            Text(entry.type.name.capitalized)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                            
                        }
                    }
                    
                    
                    
                    
                    
                    VStack{
                        statRow(title: "Height", value: "\(detail.height)")
                        statRow(title: "Weight", value: "\(detail.weight)")
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(16)
                    .padding(.horizontal)
                    
                }
                
              
                
                Spacer()
                
            }
            
        }
        .navigationTitle("Detalle \(pokemon.name)")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.fetchPokemonDetail(id: pokemon.id)
        }
    }
    
    
    func statRow(title: String, value: String) -> some View {
        HStack{
            Text(title)
                .foregroundStyle(.secondary)
            
            Spacer()
            
            Text(value)
                .bold()
        }
    }
    
    
    func gradientColor() -> Color {
        
        guard let type = viewModel.selectedPokemon?.types.first?.type.name else {return .gray}
        
        
        switch type {
            
        case "fire":
            return .orange
            
        case "water":
            return .blue
            
        case "grass":
            return .green
            
        case"electric":
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


#Preview {
    ContentView()
}
