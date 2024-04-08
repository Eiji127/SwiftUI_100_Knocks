//
//  ContentView.swift
//  Knock45
//
//  Created by 白数叡司 on 2024/04/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Your favorite pokemon is Snorlax")
                .padding()
            
            Button {
                
            } label: {
                Text("Snorlax is my favorite pokemon.")
            }
            .padding()
            
            Button {
                
            } label: {
                Text("Slowpoke is my favorite pokemon.")
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
