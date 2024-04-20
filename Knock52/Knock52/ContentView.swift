//
//  ContentView.swift
//  Knock52
//
//  Created by 白数叡司 on 2024/04/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingPopUp: Bool = false
    
    var body: some View {
        Button {
            showingPopUp = true
        } label: {
            Text("Tap Me!!")
        }
        .popover(isPresented: $showingPopUp) {
            Text("Showed Pop Up")
        }
    }
}

#Preview {
    ContentView()
}
