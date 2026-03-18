//
//  SubscriptionModel.swift
//  Examen 1363
//
//  Created by Iñaki Sigüenza on 26/02/26.
//
import Foundation

struct Subscription: Identifiable {
    let id = UUID()
    var name: String
    var platform: String
    var monthlyCost: Double
    var isActive: Bool
}
