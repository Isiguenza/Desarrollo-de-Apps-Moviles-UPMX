//
//  ContentView.swift
//  statebinding
//
//  Created by Iñaki Sigüenza on 10/02/26.
//

import SwiftUI

struct ContentView: View {
    
    @State private var nombre: String = ""
    @State private var aprobado: Bool = false
    @State private var asistencias: Int = 0
    
   
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                
                
            
                    Text("Nombre")
                        .font(.headline)
                    Text(nombre.isEmpty ? "N/A" : nombre)
                        .foregroundStyle(.secondary)
           
                
                    Text("Estado academico")
                        .font(.headline)
                Text(aprobado ? "aprobado" : "reprobado")
                    .foregroundStyle(aprobado ? .green : .red)
                
                Text("Asistencias registradas")
                    .font(.headline)
                
                Text("\(asistencias)")
                    .font(.title2)
                    .foregroundStyle(asistencias > 6 ? .green : .red)
                
            }
            .navigationTitle("Formulario principal")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    
                    NavigationLink {
                        
                        ProfileEditorView(nombre: $nombre, aprobado: $aprobado, asistencias: $asistencias)
                        
                    } label: {
                        Image(systemName: "square.and.pencil")

                    }
                    .tint(.blue)
                }
            }
        
        }
        
    }
}

#Preview {
    ContentView()
}
