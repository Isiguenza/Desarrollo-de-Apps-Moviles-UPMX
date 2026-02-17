//
//  ContentView.swift
//  states
//
//  Created by Iñaki Sigüenza on 05/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var isFavorite = false
    
    var body: some View {
        VStack {
            
            ProductFeaturedCard(imageName: "Producto2", productName: "Tenis", price: "300", isFavoriteBinding: $isFavorite)
            
            
            ProductFeaturedCard(imageName: "Producto3", productName: "Adifonos", price: "500", isFavoriteBinding: $isFavorite)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
