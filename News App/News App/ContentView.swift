//
//  ContentView.swift
//  News App
//
//  Created by Iñaki Sigüenza on 03/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack{
            ScrollView{
                VStack(spacing: 24){
                    
                    NavigationLink(destination: EmptyView()){
                        
                        FeaturedArticleCard(imageName: "news1", category: "DESIGN", title: "Designing with SwiftUI", subtitle: "Build interfaces change how we buiild apps.")
                    }
                    .buttonStyle(.plain)
                    
                    
                    
                    FeaturedArticleCard(imageName: "news2", category: "DEVELOPMENT", title: "Thinking in Views", subtitle: "Build interfaces change how we buiild apps.")
                }
                .padding()
            }
            .navigationTitle("Featured")
        }
    }
}

#Preview {
    ContentView()
}
