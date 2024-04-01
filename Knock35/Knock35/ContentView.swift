//
//  ContentView.swift
//  Knock35
//
//  Created by 白数叡司 on 2024/04/01.
//

import SwiftUI

struct ContentView: View {
    @State var isModalShow: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isModalShow = true
            } label: {
                Text("Show ModalView")
            }
        }
        .fullScreenCover(isPresented: $isModalShow, content: {
            Text("Showed Modal View")
        })
    }
}

#Preview {
    ContentView()
}
