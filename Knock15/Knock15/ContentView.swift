//
//  ContentView.swift
//  Knock15
//
//  Created by 白数叡司 on 2024/02/19.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingAlert1 = false
    @State var showingAlert2 = false
    
    var body: some View {
        VStack {
            Button(action: {
                showingAlert1 = true
            }, label: {
                Text("Button1")
            })
            .alert("Alert Title1", isPresented: $showingAlert1) {
                Button("Done", role: .none) {
                    print("Done")
                }
                Button("Cancel", role: .cancel) {
                    print("Cancel")
                }
            } message: {
                Text("Message1")
            }
            Button(action: {
                showingAlert2 = true
            }, label: {
                Text("Button2")
            })
            .alert("Alert Title2", isPresented: $showingAlert2) {
                Button("Done", role: .none) {
                    print("Done")
                }
                Button("Cancel", role: .cancel) {
                    print("Cancel")
                }
            } message: {
                Text("Message2")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
