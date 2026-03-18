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
 
 
 TU NOMBRE Y ID AQUI
 
 Ana Luisa Villeda Anleu
 0266043
 
 
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
    @State private var newCost = 0.0
    @State private var newisActive: Bool = false
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Total mensual: $\(totalMonthlyCost, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top)
                
                List{
                    
                    ForEach($subscriptions) { $subscription in
                        
                        NavigationLink {
                            SubscriptionEditor()
                            
                            
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    Text(subscription.name)
                                        .font(.headline)
                                    
                                    Text(subscription.platform)
                                    foregroundStyle(.secondary)
                                    
                                    Text(subscription.isActive ? "Active" : "Inactive")
                                        .foregroundStyle(subscription.isActive ? .green : .red)
                                }
                                
                                Spacer()
                                
                                Text("$\(subscription.monthlyCost, specifier: "%.2f")")
                                    .foregroundStyle(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                    }
                }
            }
            .navigationTitle("Subscriptions")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("New Subscrition", isPresented: $showAlert) {
                TextField("Name", text: $newName)
                TextField("Platform", text: $newPlatform)
                TextField("Monthly Cost", value: $newCost, format: .number)
                
                Button("Add"){
                    addSubscription()
                }
                Button("Cancel", role: .cancel){
                    clearFields()
                }
                
            } message:{
                Text("Add name and platform please")
            }
        }
    }
    
    var totalMonthlyCost: Double {
        var total: Double = 0
        for item in subscriptions {
            total += item.monthlyCost
        }
        return total
    }
    
    private func addSubscription(){
            
        guard !newName.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        guard !newPlatform.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        guard (0.0...).contains(newCost) else { return }
        
        let newSubscription = Subscription(
            name: newName,
            platform: newPlatform,
            monthlyCost: newCost,
            isActive: true
        )
            
        subscriptions.insert(newSubscription, at: 0)
            
    }
    
    private func clearFields(){
        newName = ""
        newPlatform = ""
    }
}

#Preview {
    ContentView()
}

