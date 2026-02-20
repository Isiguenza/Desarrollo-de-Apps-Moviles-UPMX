//
//  ContentView.swift
//  Habit Tracker
//
//  Created by Iñaki Sigüenza on 20/02/26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Fuente de verdad
    
    @State private var habits: [Habit] = [
        Habit(name: "Leer", progress: 1, goal: 3),
        Habit(name: "Ejercicio", progress: 3, goal: 3),
        Habit(name: "Meditar", progress: 0, goal: 2)
    ]
    
    // Estados para alerta
    @State private var showingAddAlert = false
    @State private var newHabitName = ""
    @State private var newHabitGoal = ""
    
    var body: some View {
        NavigationStack {
            
            List {
                
                //Binding dentro del array
                ForEach($habits) { $habit in
                    
                    NavigationLink {
                        HabitDetailView(habit: $habit)
                    } label: {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 4) {
                                
                                Text(habit.name)
                                    .font(.headline)
                                
                                Text("\(habit.progress) / \(habit.goal)")
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            // Indicador visual
                            if habit.isCompleted {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingAddAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Nuevo Hábito", isPresented: $showingAddAlert) {
                
                TextField("Nombre", text: $newHabitName)
                TextField("Meta diaria", text: $newHabitGoal)
                    .keyboardType(.numberPad)
                
                Button("Cancelar", role: .cancel) {
                    clearFields()
                }
                
                Button("Agregar") {
                    addHabit()
                }
                
            } message: {
                Text("Ingresa un nombre y una meta mayor a 0.")
            }
        }
    }
    
    // MARK: - Crear hábito
    
    private func addHabit() {
        
        guard
            let goalValue = Int(newHabitGoal),
            goalValue > 0,
            !newHabitName.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return
        }
        
        let newHabit = Habit(
            name: newHabitName,
            progress: 0,
            goal: goalValue
        )
        
        habits.insert(newHabit, at: 0)
        clearFields()
    }
    
    private func clearFields() {
        newHabitName = ""
        newHabitGoal = ""
    }
}



