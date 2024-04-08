//
//  ContentView.swift
//  Knock44
//
//  Created by 白数叡司 on 2024/04/08.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var onEditing: Bool = false
    
    var body: some View {
        VStack {
            Text(onEditing ? "On Editing" : "Not On Editing")
            
            TextField("Placeholder", text: $text, onEditingChanged: { onEditing in
                print("onEditingChanged: \(onEditing)")
                self.onEditing = onEditing
            }, onCommit: {
                print("onCommit")
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
