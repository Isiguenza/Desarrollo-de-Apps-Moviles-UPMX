//
//  ContentView.swift
//  Journal App
//
//  Created by Iñaki Sigüenza on 19/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var entries: [JournalEntry] = [
        
        JournalEntry(title: "SwiftUI", content: "Repasar States y Bindings", priority: 1),
        
        JournalEntry(title: "Proyecto", content: "Preparar mi proyexto", priority: 2),
        
        JournalEntry(title: "Leer", content: "Repasar Documentacion completo de SwiftUI", priority: 3)
        
        
        
    ]
    
    @State private var showAlert = false
    @State private var newTitle = ""
    @State private var newPriority = ""
    
    var body: some View {
        NavigationStack{
            List{
                
                ForEach(1...3, id: \.self){ level in
                    
                    let filtered = entries.indices.filter{
                        entries[$0].priority == level
                    }
                    
                    if !filtered.isEmpty {
                        
                        Section("Prioridad \(level)"){
                            
                            ForEach(filtered, id: \.self) { index in
                                
                                NavigationLink{
                                    EmptyView()
                                } label: {
                                    
                                    HStack{
                                        
                                        VStack(alignment: .leading){
                                            
                                            Text(entries[index].title)
                                                .font(.headline)
                                            
                                            Text(entries[index].content)
                                                .foregroundStyle(.secondary)
                                                .lineLimit(1)
                                            
                                        }
                                        
                                        Spacer()
                                        
                                        Text("P\(entries[index].priority)")
                                    }
                                    .padding(.vertical, 4)
                                    
                                }
                                
                            }
                            
                        }
                        
                        
                    }
                    
                }
                
            }
            .navigationTitle("Journal App")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("New Entry", isPresented: $showAlert) {
                
                TextField("Title", text: $newTitle)
                TextField("Priority", text: $newPriority)
                    .keyboardType(.numberPad)
                
                Button("Cancel", role: .cancel){
                    clearFields()
                }
                
                Button("Add"){
                    addEntry()
                }
                
                
                
            } message: {
                Text("Add title and priority from 1 to 3")
            }
            
        }
    }
    
    private func addEntry(){
        
        guard
            let priorityValue = Int(newPriority),
            (1...3).contains(priorityValue),
            !newTitle.trimmingCharacters(in: .whitespaces).isEmpty
        else{
            clearFields()
            return
        }
        
        let newEntry = JournalEntry(
            title: newTitle,
            content: "",
            priority: priorityValue
        )
        
        entries.insert(newEntry, at: 0)
        clearFields()
        
    }
    
    private func clearFields(){
        newTitle = ""
        newPriority = ""
    }
}

#Preview {
    ContentView()
}
