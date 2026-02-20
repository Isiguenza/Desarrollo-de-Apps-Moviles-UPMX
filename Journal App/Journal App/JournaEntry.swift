//
//  JournaEntry.swift
//  Journal App
//
//  Created by Iñaki Sigüenza on 19/02/26.
//

import Foundation

struct JournalEntry: Identifiable{

    let id = UUID()
    
    var title: String
    var content: String
    
    var priority: Int
}
