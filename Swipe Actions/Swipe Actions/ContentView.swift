//
//  ContentView.swift
//  Swipe Actions
//
//  Created by Iñaki Sigüenza on 03/03/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var subscriptions: [Subscription] = [
        Subscription(name: "Music Premium", platform: "Streaming", monthlyCost: 129.0, isActive: true),
        Subscription(name: "Cloud Storage", platform: "Productivity", monthlyCost: 59.0, isActive: false),
        Subscription(name: "Video Plus", platform: "Entertainment", monthlyCost: 199.0, isActive: true)
    ]
    
    @State private var showingAddAlert = false
    @State private var newName = ""
    @State private var newPlatform = ""
    @State private var newCost = ""
    
    var body: some View {
        NavigationStack {
            
            VStack {
                
                Text("Total mensual: $\(totalMonthlyCost, specifier: "%.2f")")
                    .font(.headline)
                    .padding(.top)
                
                List {
                    
                    ForEach($subscriptions) { $subscription in
                        
                        NavigationLink {
                            SubscriptionDetailView(subscription: $subscription)
                        } label: {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    
                                    Text(subscription.name)
                                        .font(.headline)
                                        .foregroundColor(
                                            subscription.isActive
                                            ? .primary
                                            : .secondary
                                        )
                                    
                                    Text(subscription.platform)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                                
                                Text("$\(subscription.monthlyCost, specifier: "%.2f")")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.vertical, 4)
                        }
                        
                        // 🔥 SWIPE ACTIONS
                        .swipeActions(edge: .trailing) {
                            
                            Button(role: .destructive) {
                                delete(subscription)
                            } label: {
                                Label("Eliminar", systemImage: "trash")
                            }
                        }
                        
                        .swipeActions(edge: .leading) {
                            
                            Button {
                                subscription.isActive.toggle()
                            } label: {
                                Label(
                                    subscription.isActive ? "Desactivar" : "Activar",
                                    systemImage: subscription.isActive ? "pause" : "play"
                                )
                            }
                            .tint(subscription.isActive ? .orange : .green)
                        }
                    }
                }
                .listStyle(.insetGrouped)
            }
            .navigationTitle("Subscriptions")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Nueva Suscripción", isPresented: $showingAddAlert) {
                
                TextField("Nombre", text: $newName)
                TextField("Plataforma", text: $newPlatform)
                TextField("Costo mensual", text: $newCost)
                    .keyboardType(.decimalPad)
                
                Button("Cancelar", role: .cancel) {
                    clearFields()
                }
                
                Button("Agregar") {
                    addSubscription()
                }
                
            } message: {
                Text("Completa todos los campos.")
            }
        }
    }
    
    // MARK: - Total mensual
    
    var totalMonthlyCost: Double {
        var total: Double = 0
        for item in subscriptions {
            total += item.monthlyCost
        }
        return total
    }
    
    // MARK: - Crear
    
    private func addSubscription() {
        
        guard
            let costValue = Double(newCost),
            costValue >= 0,
            !newName.trimmingCharacters(in: .whitespaces).isEmpty,
            !newPlatform.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return
        }
        
        let newSubscription = Subscription(
            name: newName,
            platform: newPlatform,
            monthlyCost: costValue,
            isActive: true
        )
        
        subscriptions.insert(newSubscription, at: 0)
        clearFields()
    }
    
    private func clearFields() {
        newName = ""
        newPlatform = ""
        newCost = ""
    }
    
    // MARK: - Delete
    
    private func delete(_ subscription: Subscription) {
        if let index = subscriptions.firstIndex(where: { $0.id == subscription.id }) {
            subscriptions.remove(at: index)
        }
    }
}

#Preview {
    ContentView()
}
