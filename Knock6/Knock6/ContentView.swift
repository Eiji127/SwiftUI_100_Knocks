//
//  ContentView.swift
//  Knock6
//
//  Created by 白数叡司 on 2023/10/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Image("Pikachu")
                        .resizable()
                        .frame(width: 150, height: 150)
                    
                    Text("Pikachu is the most popular Pokemon!")
                }
            }
            .navigationBarTitle("Pikachu")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
