//
//  ContentView.swift
//  Test
//
//  Created by Iñaki Sigüenza on 16/04/26.
//

import SwiftUI



struct ContentView: View {
    
    let items: [MenuItem] = [
        .init(icon: "house.fill", title: "Home"),
        .init(icon: "magnifyingglass", title: "Search"),
        .init(icon: "heart.fill", title: "Likes"),
        .init(icon: "person.fill", title: "Profile"),
        .init(icon: "bell.fill", title: "Alerts"),
        .init(icon: "gearshape.fill", title: "Settings")
    ]
    
    let ringSize: CGFloat = 300
    let buttonOrbit: CGFloat = 120
    
    var body: some View {
        ZStack {
            // Dona
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            .white.opacity(0.25),
                            .white.opacity(0.08)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 55
                )
                .frame(width: ringSize, height: ringSize)
            
            // Centro libre para modelo 3D
            Circle()
                .fill(Color.black.opacity(0.2))
                .frame(width: 140, height: 140)
                .overlay {
                    Text("Modelo 3D")
                        .foregroundStyle(.white)
                        .font(.headline)
                }
            
            // Botones alrededor
            ForEach(Array(items.enumerated()), id: \.element.id) { index, item in
                let angle = angleFor(index: index, total: items.count)
                let x = cos(angle) * buttonOrbit
                let y = sin(angle) * buttonOrbit
                
                Button {
                    print(item.title)
                } label: {
                    VStack(spacing: 6) {
                        Image(systemName: item.icon)
                            .font(.system(size: 18, weight: .semibold))
                        
                        Text(item.title)
                            .font(.caption2)
                    }
                    .foregroundStyle(.white)
                    .frame(width: 64, height: 64)
                    .background(.ultraThinMaterial, in: Circle())
                }
                .offset(x: x, y: y)
            }
        }
        .frame(width: 360, height: 360)
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
    
    func angleFor(index: Int, total: Int) -> Double {
        let step = (2 * Double.pi) / Double(total)
        return step * Double(index) - Double.pi / 2
    }
}

struct MenuItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}



#Preview {
    ContentView()
}
