//
//  ContentView.swift
//  Knock53
//
//  Created by 白数叡司 on 2024/04/22.
//

import SwiftUI

struct ContentView: View {
    
    let grids = [GridItem(.fixed(20))]
    
    var body: some View {
        LazyHGrid(rows: grids) {
            ForEach(0..<8, id: \.self) { index in
                Image("Pikachu")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
        }
    }
}

#Preview {
    ContentView()
}
