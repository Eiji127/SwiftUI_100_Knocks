//
//  ContentView.swift
//  Knock17
//
//  Created by 白数叡司 on 2024/02/21.
//

import SwiftUI

struct ContentView: View {
    @State var numberString: String = ""
    @State var showingAlert: Bool = false
    @State var showingSheet: Bool = false
    
    var body: some View {
        VStack {
            TextField("Input Number", text: $numberString)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button {
                guard Double(numberString) != nil else {
                    showingAlert = true
                    return
                }
                showingSheet = true
            } label: {
                Text("Show Sheet")
            }
        }
        .alert(Text("Error"), isPresented: $showingAlert) {
            Button("Close", role: .none) {
                print("Tapped Close Button.")
            }
        } message: {
            Text("Please input number")
        }
        .sheet(isPresented: $showingSheet, content: {
            Text("\(numberString) can convert to Double")
        })
    }
}

#Preview {
    ContentView()
}
