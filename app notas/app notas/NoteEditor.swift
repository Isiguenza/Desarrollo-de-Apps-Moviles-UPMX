//
//  NoteEditor.swift
//  app notas
//
//  Created by Iñaki Sigüenza on 12/02/26.
//

import SwiftUI

struct NoteEditor: View {
    
    @Binding var note: Note
    
    var body: some View {
        VStack(spacing: 20){
            
            TextField("Titulo", text: $note.title)
                .font(.headline)
                .textFieldStyle(.roundedBorder)
            
            TextField("Contenido", text: $note.content)
                .textFieldStyle(.roundedBorder)
                .lineLimit(4, reservesSpace: true)
        }
        .padding()
        .navigationTitle("Editor de nota")
    }
}

