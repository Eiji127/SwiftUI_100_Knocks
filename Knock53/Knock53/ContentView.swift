//
//  ContentView.swift
//  Knock53
//
//  Created by 白数叡司 on 2024/04/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pokemon")
                .font(.title2)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 12) {
                    ForEach(0..<8, id: \.self) { index in
                        Image("Pikachu")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                }
                .padding(.horizontal, 12)
            }
            .frame(height: 100)
        }
    }
}

#Preview {
    ContentView()
}
