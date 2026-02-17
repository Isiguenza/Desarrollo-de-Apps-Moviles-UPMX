//
//  ContentView.swift
//  introduccion
//
//  Created by Iñaki Sigüenza on 27/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("Heo, world!")
            Text("Hello, wrld!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
