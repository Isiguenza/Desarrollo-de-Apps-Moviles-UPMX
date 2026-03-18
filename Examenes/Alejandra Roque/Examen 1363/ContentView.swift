//
//  ContentView.swift
//  Examen 1363
//
//  Created by Iñaki Sigüenza on 26/02/26.
//

//MARK: - Instrucciones

/*
 Debes completar el proyecto para que cumpla con lo siguiente:

 Implementar la vista de detalle (SubscriptionDetailView).

 En la vista de detalle debe ser posible:
 Editar el nombre.
 Editar la plataforma.
 Editar el costo mensual.
 Activar o desactivar la suscripción usando un Toggle. *

 Agregar un botón "+" en la barra de navegación para crear una nueva suscripción.

 La nueva suscripción debe crearse mediante una alerta que solicite:
 Nombre
 Plataforma
 Costo mensual
 
 En la lista principal:
 Mostrar el nombre en color secundario cuando la suscripción esté desactivada. *
 
 Validar que:
 El nombre no esté vacío. *
 El costo sea un número válido mayor o igual a cero. *
 No permitir que el costo mensual sea negativo. *
 
 //MARK: - Nombre
 
 TU NOMBRE Y ID AQUI
 Alejandra Roque Gutiérrez - 0259187
 
 */

import SwiftUI

struct ContentView: View {
    
    @State private var subscriptions: [Subscription] = [
        Subscription(name: "Music Premium", platform: "Streaming", monthlyCost: 129.0, isActive: true),
        Subscription(name: "Cloud Storage", platform: "Productivity", monthlyCost: 59.0, isActive: false),
        Subscription(name: "Video Plus", platform: "Entertainment", monthlyCost: 199.0, isActive: true)
    ]
    @State private var showAlert = false
    @State private var newName = ""
    @State private var newPlatform = ""
    @State private var newMonthlyCost = 0.0
    @State private var toggleActive = true
    
    var body: some View {
        NavigationStack {
            VStack{
                Text("Total mensual: $\(totalMonthlyCost, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top)
                
                List{
                    ForEach ($subscriptions) { $subscription in
                        NavigationLink {
                            SubscriptionEditor(subscription: $subscription)
                        } label: {
                            HStack{
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(subscription.name)
                                        .font(.headline)
                                    Text(subscription.platform)
                                    Text("\(subscription.monthlyCost)")
                                    // isActive toggle {desired view}
                                }
                                
                                Spacer()
                                
                                Text("Monthly Cost: $\(subscription.monthlyCost, specifier: "%.2f")")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                        
                    }
                }
            }
            .navigationTitle("Subscriptions")
            .toolbar{
                ToolbarItem(placement:.topBarTrailing) {
                    Button{
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("New Subscription", isPresented: $showAlert){
                TextField("Name", text: $newName)
                TextField("Plataform", text: $newPlatform)
                TextField("Monthly Cost", value: $newMonthlyCost, format: .number)
                    .keyboardType(.decimalPad)
                
                Button("Cancel", role: .cancel){
                    newName = ""
                }
                Button("Agregar"){
                    addSubscription(name: newName)
                    newName = ""
                }
            } message: {
                Text("Add a new suscription")
            }
        }
        
        var totalMonthlyCost: Double {
            var total: Double = 0
            for item in subscriptions {
                total += item.monthlyCost
            }
            return total
        }
    }
    
    private func addSubscription(name: String){
            guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
                return
            }
            
        let newSubscription = Subscription(name: "", platform: "", monthlyCost: 0.0, isActive: true)
            
        subscriptions.insert(newSubscription, at: 0)
    }
}

#Preview{
    ContentView()
}
