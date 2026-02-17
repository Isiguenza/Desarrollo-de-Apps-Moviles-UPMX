//
//  NoteModel.swift
//  app notas
//
//  Created by Iñaki Sigüenza on 12/02/26.
//

import Foundation


//MARK: - Modelo de datos

//Este struct represnta una nota dentro de nuestra app.
//No es una vista no tiene UI solo datos.
struct Note: Identifiable {
    
    //UUID -> Universal Unique Identifier
    let id = UUID()
    
    var title: String
    var content: String
}

