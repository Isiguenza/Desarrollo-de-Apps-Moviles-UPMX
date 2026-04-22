//
//  MainTabView.swift
//  dummyjson
//
//  Created by Iñaki Sigüenza on 14/04/26.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var session: SessionManager
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
        .environmentObject(session)
    }
}
