//
//  ContentView.swift
//  Knock46
//
//  Created by 白数叡司 on 2024/04/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Pikachu")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Text("@cychow_app")
                    .frame(width: 200, height: 200)
                    .background(.black.opacity(0.5))
                    .foregroundStyle(.white)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
