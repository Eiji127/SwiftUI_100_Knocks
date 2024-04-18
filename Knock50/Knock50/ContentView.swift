//
//  ContentView.swift
//  Knock50
//
//  Created by 白数叡司 on 2024/04/18.
//

import SwiftUI

struct ContentView: View {

    var text: String = "Pikachu"
    @State var showingModal: Bool = false
    
    var body: some View {
        Button {
            showingModal = true
        } label: {
            Text("Tap Me!!")
        }
        .sheet(isPresented: $showingModal) {
            Text(text)
        }
    }
}

#Preview {
    ContentView()
}
