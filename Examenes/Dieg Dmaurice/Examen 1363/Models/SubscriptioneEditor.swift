//
//  SubscriptioneEditor.swift
//  Examen 1363
//
//  Created by iOS Lab UPMX on 2/26/26.
//
import SwiftUI

struct Editor: View {
    
    @Binding var subscription: Subscription
    @State var activa = false
    
    var body: some View {
        
        TextField("Ingresa tu nombre", text: $subscription.name)
            .font(.headline)
            .textFieldStyle(.roundedBorder)
        
        TextField("Ingresa la plataforma", text: $subscription.platform)
            .font(.headline)
            .textFieldStyle(.roundedBorder)
        
        TextField("Ingresa el costo mensual", value: $subscription.monthlyCost, format: .number)
            .keyboardType(.decimalPad)
        
        Toggle("Sigue activa?", isOn: $activa)
    }
}
