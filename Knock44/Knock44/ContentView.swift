//
//  ContentView.swift
//  Knock44
//
//  Created by 白数叡司 on 2024/04/08.
//

import SwiftUI

struct ContentView: View {

    @State var text: String = ""
    @FocusState private var textFieldIsFocused: Bool
    
    var body: some View {
        VStack {
            Text(textFieldIsFocused ? "On Editing" : "Not On Editing")
            
            TextField("Placeholder", text: $text)
                .focused($textFieldIsFocused)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
