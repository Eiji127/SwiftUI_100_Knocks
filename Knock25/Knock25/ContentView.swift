//
//  ContentView.swift
//  Knock25
//
//  Created by 白数叡司 on 2024/02/28.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    isPresented = true
                } label: {
                    Text("Present Second View")
                }
            }
            .navigationDestination(isPresented: $isPresented) {
                SecondView()
            }
        }
    }
}

#Preview {
    ContentView()
}
