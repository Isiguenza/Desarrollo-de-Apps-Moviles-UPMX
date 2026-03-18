//
//  SubscriptionDetail.swift
//  Swipe Actions
//
//  Created by Iñaki Sigüenza on 03/03/26.
//

import SwiftUI

struct SubscriptionDetailView: View {
    
    @Binding var subscription: Subscription
    
    var body: some View {
        VStack(spacing: 20) {
            
            TextField("Nombre", text: $subscription.name)
                .font(.title2)
                .textFieldStyle(.roundedBorder)
            
            TextField("Plataforma", text: $subscription.platform)
                .textFieldStyle(.roundedBorder)
            
            TextField(
                "Costo mensual",
                value: $subscription.monthlyCost,
                format: .number
            )
            .keyboardType(.decimalPad)
            .textFieldStyle(.roundedBorder)
            
            Toggle("Suscripción activa", isOn: $subscription.isActive)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
        
        // Validación para evitar costo negativo
        .onChange(of: subscription.monthlyCost) { newValue in
            if newValue < 0 {
                subscription.monthlyCost = 0
            }
        }
    }
}
