//
//  HabitModel.swift
//  Habit Tracker
//
//  Created by Iñaki Sigüenza on 20/02/26.
//

import Foundation

// MARK: - Modelo

struct Habit: Identifiable {
    let id = UUID()
    
    var name: String
    var progress: Int
    var goal: Int
    
    // NUEVO: Propiedad computada
    // No guardamos si está completado,
    // lo calculamos en base a los datos.
    var isCompleted: Bool {
        progress >= goal
    }
}
