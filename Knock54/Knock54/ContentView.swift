//
//  ContentView.swift
//  Knock54
//
//  Created by 白数叡司 on 2024/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var isToggleOn: Bool = false
    @State var buttonCondition: String = ""
    @State var color = Color.orange
    
    var body: some View {
        VStack {
            HStack {
                Text("isEnable: ")
                Toggle(isOn: $isToggleOn) {
                    
                }
            }
            Button {
                
            } label: {
                Text("Tap Me!!")
            }
            .foregroundStyle(.white)
            .frame(width: 150, height: 50)
            .background(color)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
