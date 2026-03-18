//
//  SubscriptionDetailView.swift
//  Examen 1363
//
//  Created by iOS Lab UPMX on 2/26/26.
//

//En la vista de detalle debe ser posible:
//
//Editar el nombre.
//
//Editar la plataforma.
//
//Editar el costo mensual.
//
//Activar o desactivar la suscripción usando un Toggle.
//
//No permitir que el costo mensual sea negativo.

import SwiftUI

struct SubscriptionDetailView: View {
    @Binding var subscription: Subscription
    
    var body: some View{
        ScrollView{
            VStack(alignment: .center, spacing: 30){
                
                HStack{
                    Text("Nombre: ")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    TextField("Nombre", text: $subscription.name)
                        .font(.headline)
                        .textFieldStyle(.roundedBorder)
                }
                
                HStack{
                    Text("Plataforma: ")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    TextField("Plataforma", text: $subscription.platform)
                        .font(.headline)
                        .textFieldStyle(.roundedBorder)
                }
                
                
                HStack{
                    
                    Text("Costo Mensual: ")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    TextField("Costo", value: $subscription.monthlyCost, format: .number)
                        .keyboardType(.decimalPad)
                    
                }
                
                
                
                HStack{
                    Text("Activada ?")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Toggle("", isOn: $subscription.isActive)
                        .tint(.indigo)
                    
                }
                
            }
            .padding()
            .background(Color(.secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .navigationTitle("Editor de Suscripcion")
        }
        }
}

