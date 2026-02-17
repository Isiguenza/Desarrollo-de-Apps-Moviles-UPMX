//
//  ProductFeaturedCard.swift
//  states
//
//  Created by Iñaki Sigüenza on 05/02/26.
//

import SwiftUI

struct ProductFeaturedCard: View {
    
    let imageName: String
    let productName: String
    let price: String
    
    @Binding var isFavoriteBinding: Bool
    
    var body: some View {
        VStack(spacing: 12){
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            HStack{
                VStack(alignment: .leading){
                    
                    Text(productName)
                        .font(.title3)
                        .bold()
                    
                    Text(price)
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                
                Spacer()
                
                Button{
                    isFavoriteBinding.toggle()
                } label: {
                    Image(systemName: isFavoriteBinding ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .font(.title)
                }
            }
            .padding()
        }
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}


