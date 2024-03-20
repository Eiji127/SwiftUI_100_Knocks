//
//  ContentView.swift
//  Knock29
//
//  Created by 白数叡司 on 2024/03/21.
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
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray)
        .fullScreenCover(isPresented: $isFullScreenPresented, content: {
            SecondView()
        })
    }
}

#Preview {
    ContentView()
}
