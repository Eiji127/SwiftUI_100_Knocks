//
//  ContentView.swift
//  Knock5
//
//  Created by 白数叡司 on 2023/10/01.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image("Pikachu")
                .resizable()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            Image("Pikachu")
                .resizable()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            Image("Pikachu")
                .resizable()
                .clipped()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            Image("Pikachu")
                .resizable()
                .frame(width: 50, height: 50)
            
            Spacer()
            
            Image("Pikachu")
                .resizable()
                .frame(width: 50, height: 50)
        }
        .padding(16)
    }
}

#Preview {
    ContentView()
}
