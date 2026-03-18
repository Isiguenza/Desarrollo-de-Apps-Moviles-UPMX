//
//  Model.swift
//  Swipe Actions
//
//  Created by Iñaki Sigüenza on 03/03/26.
//

import Foundation

struct Subscription: Identifiable {
    let id = UUID()
    
    var name: String
    var platform: String
    var monthlyCost: Double
    var isActive: Bool
}
