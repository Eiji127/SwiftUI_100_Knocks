//
//  ContentView.swift
//  Knock15
//
//  Created by 白数叡司 on 2024/02/19.
//

import SwiftUI

struct AlertItem {
    let buttonTitle: String
    let message: String
}

struct ContentView: View {
    
    @State var showingAlert = false
    @State var alertItem: AlertItem?
    
    var body: some View {
        VStack {
            Button(action: {
                showingAlert = true
                alertItem = AlertItem(buttonTitle: "Button 1", message: "This is Button 1!")
            }, label: {
                Text("Button1")
            })
            Button(action: {
                showingAlert = true
                alertItem = AlertItem(buttonTitle: "Button 2", message: "This is Button 2!")
            }, label: {
                Text("Button2")
            })
        }
        .alert("Alert Title", isPresented: $showingAlert, presenting: alertItem) { alertItem in
            Button(alertItem.buttonTitle, role: .none) {
                print(alertItem.buttonTitle)
            }
        } message: { alertItem in
            Text(alertItem.message)
        }
    }
}

#Preview {
    ContentView()
}
