//
//  HabitDetailView.swift
//  Habit Tracker
//
//  Created by Iñaki Sigüenza on 20/02/26.
//

import SwiftUI

struct HabitDetailView: View {
    
    @Binding var habit: Habit
    
    var body: some View {
        VStack(spacing: 24) {
            
            Text(habit.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Progreso: \(habit.progress) / \(habit.goal)")
                .foregroundColor(.secondary)
            
            HStack(spacing: 20) {
                
                Button {
                    // Evitar números negativos
                    habit.progress = max(0, habit.progress - 1)
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.bordered)
                
                Button {
                    //Evitar pasar la meta
                    habit.progress = min(habit.goal, habit.progress + 1)
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 44, height: 44)
                }
                .buttonStyle(.bordered)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}
