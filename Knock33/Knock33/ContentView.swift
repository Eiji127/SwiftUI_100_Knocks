//
//  ContentView.swift
//  Knock33
//
//  Created by 白数叡司 on 2024/03/28.
//

import SwiftUI

struct ContentView: View {
    
    let columns: [GridItem] = [GridItem(.fixed(80)),
                                GridItem(.fixed(80)),
                                GridItem(.fixed(80)),
                                GridItem(.fixed(80))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<100, id: \.self) { index in
                    Text("\(index)")
                        .foregroundStyle(Color.white)
                        .font(.title)
                        .frame(width: 80, height: 80)
                        .background(Color.gray)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
