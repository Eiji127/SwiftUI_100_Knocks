//
//  ContentView.swift
//  Knock22
//
//  Created by 白数叡司 on 2024/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Snorlax")
                .card()
            
            Image("Pikachu")
                .resizable()
                .frame(width: 60, height: 60)
                .card()
            
            Text("RedShadow")
                .card(color: Color.red.opacity(0.4))
            
            Text("BigShadow")
                .card(color: Color.green.opacity(0.4), 
                      radius: 24)
        }
    }
}

#Preview {
    ContentView()
}
