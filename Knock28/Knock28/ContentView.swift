//
//  ContentView.swift
//  Knock28
//
//  Created by 白数叡司 on 2024/03/18.
//

import SwiftUI

struct ContentView: View {
    @State var isFullScreenPresented: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isFullScreenPresented = true
            } label: {
                Text("Tap me!")
            }
        }.fullScreenCover(isPresented: $isFullScreenPresented, content: {
            SecondView()
        })
    }
}

#Preview {
    ContentView()
}
