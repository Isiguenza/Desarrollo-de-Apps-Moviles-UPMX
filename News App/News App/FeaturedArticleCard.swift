//
//  FeaturedArticleCard.swift
//  News App
//
//  Created by Iñaki Sigüenza on 03/02/26.
//

import SwiftUI

struct FeaturedArticleCard: View {
    
    let imageName: String
    let category: String
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .clipped()
            
            VStack(alignment: .leading, spacing: 5){
                Text(category)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    FeaturedArticleCard(imageName: "news1", category: "DESIGN", title: "Preview Title", subtitle: "Preview Subtitle Text")
}
