//
//  SubscriptionModel.swift
//  Examen 1363
//
//  Created by Iñaki Sigüenza on 26/02/26.
//
import Foundation
//MARK: Modelo de datos

struct Subscription: Identifiable {
    
    let id = UUID()
    var name: String
    var platform: String
    let monthlyCost: Double
    let isActive: Bool
}
