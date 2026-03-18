//
//  SubscriptionDetailView.swift
//  Examen 1363
//
//  Created by iOS Lab UPMX on 2/26/26.
//


import SwiftUI

struct SubscriptionDetailoView: View {
    
    @Binding var sub: Subscription
    
    var body: some View {
        VStack(spacing: 30) {
            
            // Textos informativos
            TextField(sub.name, text: $sub.name)
                .font(.largeTitle)
                .bold()
            
            TextField(sub.platform, text: $sub.platform)
                .font(.title3)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
            
            TextField(String(sub.monthlyCost), value: $sub.monthlyCost, format: .number)
                .font(.title3)
                .foregroundStyle(.secondary)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.center)
                .disabled(Double(sub.monthlyCost) < 0 )
            
            Toggle("Activar la subscripcion", isOn: $sub.isActive)

                HStack {
                    Image(systemName: "plus.circle.fill")
                    Text("Cambiar subscripcion")
                }
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .cornerRadius(15)
                .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Subscripcion")
        .navigationBarTitleDisplayMode(.inline)
    }
}
