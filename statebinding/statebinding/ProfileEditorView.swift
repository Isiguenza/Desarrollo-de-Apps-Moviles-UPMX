//
//  ProfileEditorView.swift
//  statebinding
//
//  Created by Iñaki Sigüenza on 10/02/26.
//

import SwiftUI

struct ProfileEditorView: View {
    @Binding var nombre: String
    @Binding var aprobado: Bool
    @Binding var asistencias: Int
    
    var body: some View {
            
        VStack(alignment: .leading, spacing: 30){
            
            Text("Nombre")
                .font(.headline)
            
            TextField("Nombre", text: $nombre)
                .textFieldStyle(.roundedBorder)
            
            Text("Vista previa: \(nombre)")
                .foregroundStyle(.secondary)
            
            Toggle("Aprobado?", isOn: $aprobado)
            
            HStack(spacing: 12){
                Button("-"){
                    asistencias = max(0, asistencias - 1)
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Text("Asistencias: \(asistencias)")
                
                Spacer()
                
                Button("+"){
                    asistencias += 1
                }
                .buttonStyle(.borderedProminent)
            }
            
            Spacer()
        }
        .navigationTitle("Editor de perfil")
        .padding()
    }
}



