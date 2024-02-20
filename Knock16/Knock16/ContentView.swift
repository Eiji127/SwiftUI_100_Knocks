//
//  ContentView.swift
//  Knock16
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var name = "Snowlax"
    
    var body: some View {
        VStack {
            Text(name)
            Button(action: {
                name = "Pikachu"
            }, label: {
                HStack {
                    Image("Pikachu")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text("Tap Me!!")
                }
                .padding()
                .border(Color.black, width: 2)
            })
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    ContentView()
}
