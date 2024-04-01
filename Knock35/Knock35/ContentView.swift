//
//  ContentView.swift
//  Knock35
//
//  Created by 白数叡司 on 2024/04/01.
//

import SwiftUI

struct ContentView: View {
    @State var isModalShown: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isModalShown = true
            } label: {
                Text("Show ModalView")
            }
        }
        .sheet(isPresented: $isModalShown) {
            Text("modal View is shown")
                .interactiveDismissDisabled()
        }
    }
}

#Preview {
    ContentView()
}
