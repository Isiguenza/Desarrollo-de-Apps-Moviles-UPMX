//
//  ContentView.swift
//  app notas
//
//  Created by Iñaki Sigüenza on 12/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var notes: [Note] = [
        
        Note(title: "Clase SwiftUI", content: "Ver arrays y bindings"),
        
        Note(title: "Proyecto", content: "Preparar mi app")
        
    ]
    
    @State private var showAlert = false
    @State private var newTitle = ""
    
    var body: some View {
        NavigationStack{
            List{
                
                
                ForEach($notes) { $note in
                    
                    NavigationLink{
                        NoteEditor(note: $note)
                    } label: {
                        VStack(alignment: .leading, spacing: 5){
                            
                            Text(note.title)
                                .font(.headline)
                            
                            Text(!note.content.isEmpty ? note.content : "No content")
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .navigationTitle("Mis notas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert("Nueva Nota", isPresented: $showAlert){
                
                TextField("Titulo de la nota", text: $newTitle)
                
                Button("Cancelar", role: .cancel){
                    newTitle = ""
                }
                
                Button("Agregar"){
                    addNote(title: newTitle)
                    newTitle = ""
                }
                
            } message: {
                Text("Escribir el titulo de la nueva nota")
            }
        }
    }
    
    private func addNote(title: String){
        
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let newNote = Note(title: title, content: "")
        
        notes.insert(newNote, at: 0)
        
    }
}

#Preview {
    ContentView()
}
