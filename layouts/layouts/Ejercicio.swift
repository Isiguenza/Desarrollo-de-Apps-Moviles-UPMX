//
//  Ejercicio.swift
//  layouts
//
//  Created by Iñaki Sigüenza on 29/01/26.
//

import SwiftUI

struct Ejercicio: View {
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack{
                Text("Productos")
                    .font(.largeTitle)
                    .bold()
                    
                    //.fontWeight(.bold)
                
                ProductCard(emoji: "🔥", titulo: "Audifonos", description: "Audifonos cool", price: "$500")
                
                
                
            }
            
        }
    }
    
    func ProductCard(
        emoji: String,
        titulo: String,
        description: String,
        price: String
        
    ) -> some View{
        //Vista principal de la tarjeta
        VStack(alignment: .leading){
            ZStack{
                
                Color.blue.opacity(0.1)
                
                //Emoji como imagen del producto
                Text(emoji)
                    .font(.system(size: 65))
            }
            .frame(height: 120)
            .cornerRadius(12)
            
            //Nombre del producto
            Text(titulo)
                .font(.headline)
            
            //Descripcion del producto
            Text(description)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
            HStack{
                Text(price)
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Button("Comprar"){
                    
                }
            }
            
        }
        .padding()
        .background(.white)
        .cornerRadius(16)
        .shadow(radius: 8)
        .padding()
        
    }
}

#Preview {
    Ejercicio()
}
