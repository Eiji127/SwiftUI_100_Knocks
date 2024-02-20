//
//  ContentView.swift
//  Knock18
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button(action: {
                    isActive = true
                }, label: {
                    Text("Tap Me!!")
                })
            }
            .navigationDestination(isPresented: $isActive) {
                Text("Second View")
            }
        }
    }
}

#Preview {
    ContentView()
}
