//
//  ContentView.swift
//  Knock44
//
//  Created by 白数叡司 on 2024/04/08.
//

import SwiftUI

struct ContentView: View {
    @State var text = ""
    
    var body: some View {
        TextField("Placeholder", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}

#Preview {
    ContentView()
}
