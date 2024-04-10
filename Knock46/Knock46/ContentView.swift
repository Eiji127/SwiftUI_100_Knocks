//
//  ContentView.swift
//  Knock46
//
//  Created by 白数叡司 on 2024/04/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image("Pikachu")
            .resizable()
            .frame(width: 200, height: 200)
            .overlay(
                Text("@cychow_app")
                    .foregroundColor(.white)
                    .font(.system(size: 20).bold())
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(.black)
                    .opacity(0.5)
            )
    }
}

#Preview {
    ContentView()
}
