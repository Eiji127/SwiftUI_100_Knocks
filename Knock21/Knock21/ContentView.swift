//
//  ContentView.swift
//  Knock21
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CardView {
                Text("Snorlax")
            }
            
            CardView {
                Image("Pikachu")
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            
            CardView(color: Color.red.opacity(0.4)) {
                Text("RedShadow")
            }
            
            CardView(color: Color.green.opacity(0.4), radius: 24) {
                Text("BigShadow")
            }
        }
    }
}

#Preview {
    ContentView()
}
