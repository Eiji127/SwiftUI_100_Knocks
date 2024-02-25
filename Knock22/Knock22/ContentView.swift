//
//  ContentView.swift
//  Knock22
//
//  Created by 白数叡司 on 2024/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Snorlax")
                .padding(16)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Image("Pikachu")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(16)
            
            Text("RedShadow")
                .padding(16)
            
            Text("BigShadow")
                .padding(16)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
