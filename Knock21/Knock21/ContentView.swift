//
//  ContentView.swift
//  Knock21
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                
            }, label: {
                Text("Snorlax")
                    .padding()
            })
            .border(Color.gray)
            
            Button(action: {
                
            }, label: {
                Image("Pikachu")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .padding()
            })
            .border(Color.gray)
            
            Button(action: {
                
            }, label: {
                Text("RedShadow")
                    .padding()
            })
            .border(Color.gray)
            
            Button(action: {
                
            }, label: {
                Text("BigShadow")
                    .padding()
            })
            .border(Color.gray)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
