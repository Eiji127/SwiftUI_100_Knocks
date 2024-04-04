//
//  ContentView.swift
//  Knock37
//
//  Created by 白数叡司 on 2024/04/04.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isPresented = true
            } label: {
                Text("Show Half Modal View")
            }
        }
        .sheet(isPresented: $isPresented) {
            Text("Showed Half Modal View!!")
                .presentationDetents([.medium])
        }
    }
}

#Preview {
    ContentView()
}
