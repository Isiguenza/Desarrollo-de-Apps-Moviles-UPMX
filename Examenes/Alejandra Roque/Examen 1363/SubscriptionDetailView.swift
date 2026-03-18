//
//  SuscriptionEditor.swift
//  Examen 1363
//
//  Created by iOS Lab UPMX on 2/26/26.
//

import SwiftUI

struct SubscriptionEditor : View {
    @Binding var subscription: Subscription
    
    var body: some View {
        
        // EDITOR: Name, Platform, Monthly Cost and Active Status
            VStack(spacing: 20){
                TextField("Name", text: $subscription.name)
                    .font(.headline)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Platform", text: $subscription.platform)
                    .textFieldStyle(.roundedBorder)
                TextField("Monthly Cost", value: $subscription.monthlyCost, format: .number)
                    .keyboardType(.decimalPad)
                //Toggle($subscription.isActive)
                
                NavigationStack{
                }
            }
            .padding()
            .navigationTitle(Text("Subscription Editor"))
        }
}
