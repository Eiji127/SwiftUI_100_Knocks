//
//  ContentView.swift
//  Knock54
//
//  Created by 白数叡司 on 2024/04/23.
//

import SwiftUI

struct ContentView: View {
    @State var isToggleOn: Bool = false
    
    var body: some View {
        VStack {
            Toggle(isOn: $isToggleOn) {
                Text("isEnable: \(isToggleOn.description)")
            }
            Button {
                print("DEBUG: TAPPED BUTTON!!")
            } label: {
                Text("Tap Me!! \(isToggleOn ? "Enable" : "Disable")")
            }
            .foregroundStyle(.white)
            .frame(width: 150, height: 50)
            .background(isToggleOn ? .orange : .gray)
            .disabled(!isToggleOn)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
