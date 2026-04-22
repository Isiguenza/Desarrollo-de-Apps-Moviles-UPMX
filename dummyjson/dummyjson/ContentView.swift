//
//  ContentView.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject var session = SessionManager()
        
        var body: some View {
            
            if session.token == nil {
                LoginView()
                    .environmentObject(session)
            } else {
                MainTabView()
                    .environmentObject(session)
            }
        }
}

#Preview {
    ContentView()
}
