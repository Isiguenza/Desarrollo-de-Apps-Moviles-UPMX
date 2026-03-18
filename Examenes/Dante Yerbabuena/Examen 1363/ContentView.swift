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

 Activar o desactivar la suscripción usando un Toggle.

 No permitir que el costo mensual sea negativo.

 Agregar un botón "+" en la barra de navegación para crear una nueva suscripción.

 La nueva suscripción debe crearse mediante una alerta que solicite:

 Nombre

 Plataforma

 Costo mensual

 Validar que:

 El nombre no esté vacío.

 El costo sea un número válido mayor o igual a cero.

 En la lista principal:

 Mostrar el nombre en color secundario cuando la suscripción esté desactivada.
 
 
 Jesus Dante Yerbabuena Herrera
 0228221
 
 
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
    @State private var newPlat = ""
    @State private var newCost = 0.0
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Total mensual: $\(totalMonthlyCost, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top)
                
                List{
                    ForEach($subscriptions) { $subscription in
                        
                        NavigationLink {
                            SubscriptionDetailView(subscription: $subscription)
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    Text(subscription.name)
                                        .font(.headline)
                                        .foregroundColor(!subscription.isActive ? .red: .indigo)
                                    
                                    Text(subscription.platform)
                                    foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("$\(subscription.monthlyCost, specifier: "%.2f")")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Subscriptions")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        showAlert = true
                        
                    } label: {
                        Image(systemName: "plus").tint(.indigo)
                    }
                }
            }
            .alert("Nueva Suscripcion", isPresented: $showAlert){
                
                TextField("Nombre", text: $newName)
                
                TextField("Plataforma", text: $newPlat)
                
                TextField("Costo Mensual", value: $newCost, format: .number)
                    .keyboardType(.decimalPad)
                
                Button("Cancelar", role: .cancel){
                    newName = ""
                    newPlat = ""
                    newCost = 0
                }
                
                Button("Crear Subscripcion", role: .confirm){
                    addSubscription(name: newName, platform: newPlat, cost: newCost)
                    newName = ""
                    newPlat = ""
                    newCost = 0
                    
                }
                
            } message: {
                Text("Incluir informacion de la nueva suscripcion")
            }
        }
    }
    
    var totalMonthlyCost: Double {
        var total: Double = 0
        for item in subscriptions {
            if item.isActive {
                total += item.monthlyCost
            }
            
        }
        return total
    }
    
    private func addSubscription(name: String, platform: String, cost: Double){
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {return}
        guard !platform.trimmingCharacters(in: .whitespaces).isEmpty else {return}
        guard cost>0 else {return}
        
        
        let newSub = Subscription(name: name, platform: platform, monthlyCost: cost, isActive: true)
        
        subscriptions.insert(newSub, at: 0)
        
    }
}

#Preview {
    ContentView()
}

