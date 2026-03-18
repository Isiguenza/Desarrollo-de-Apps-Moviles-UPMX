//
//  ExcersiceModel.swift
//  Examen 1367
//
//  Created by Iñaki Sigüenza on 24/02/26.
//

import SwiftUI

struct Exercise: Identifiable {
    let id =  UUID()
    var name: String
    var type: String
    var goalReps: Int
    var completedReps: Int
}
