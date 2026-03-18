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
 Eduardo Gutierrez Huerta
 0261687
 
 */

import SwiftUI

struct ContentView: View {
    
    @State private var subscriptions: [Subscription] = [
        Subscription(name: "Music Premium", platform: "Streaming", monthlyCost: 129.0, isActive: true),
        Subscription(name: "Cloud Storage", platform: "Productivity", monthlyCost: 59.0, isActive: false),
        Subscription(name: "Video Plus", platform: "Entertainment", monthlyCost: 199.0, isActive: true)
    ]
    
    @State private var showAlert = false
    @State private var newTitle = ""
    @State private var newCost = 0.0
    @State private var newP = ""
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Total mensual: $\(totalMonthlyCost, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top)
                List{
                    ForEach($subscriptions, id: \.self) { $subscription in
                        
                        NavigationLink {
                            SubscriptionDetailoView(sub: $subscription)
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .center, spacing: 4) {
                                    
                                    Text(subscription.name)
                                        .font(.subheadline)
                                        .foregroundStyle(subscription.isActive ? Color.green : Color.red)

                                    
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
                        Image (systemName: "plus")
                    }
                }
            }
            .alert("New Entry", isPresented: $showAlert){
                TextField("Nombre", text: $newTitle)
                TextField("Costo", value: $newCost, format: .number )
                    .keyboardType(.numberPad)
                TextField("Plataforma", text: $newP)
                Button("Cancel", role:.cancel){
                    clearFields()
                }
                Button("Add", role:.confirm){
                    addEntry()
                    clearFields()
                }
            }message: {
                Text("Add subscription ")
            }
        }
    }
    private func addEntry(){
                
    
        let newEntry = Subscription(
            name: newTitle,
            platform: newP,
            monthlyCost: newCost,
            isActive: false
        )
        subscriptions.insert(newEntry, at:0)
    }
    private func clearFields(){
        newTitle = ""
        newP = ""
        newCost = 0
    }
    
    var totalMonthlyCost: Double {
        var total: Double = 0
        for item in subscriptions {
            total += item.monthlyCost
        }
        return total
    }
}

#Preview {
    ContentView()
}
