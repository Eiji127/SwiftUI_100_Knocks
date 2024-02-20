//
//  ContentView.swift
//  Knock17
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var isAlertShown: Bool = false
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            TextField(" Input Number", text: $text)
                .border(Color.gray, width: 0.5)
            Button {
                if Int(text) != nil {
                    isPresented = true
                } else {
                    isAlertShown = true
                }
            } label: {
                Text("Show Sheet")
            }
        }
        .alert("Title", isPresented: $isAlertShown) {
            Button("Back", role: .none) {
                print("Tapped Alert Button.")
            }
        } message: {
            Text("This is Alert")
        }
    }
}

#Preview {
    ContentView()
}
