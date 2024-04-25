//
//  ContentView.swift
//  Knock55
//
//  Created by 白数叡司 on 2024/04/25.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    
    var body: some View {
        TextField("Input Number", text: $text)
            .padding()
            .keyboardType(.numberPad)
    }
}

#Preview {
    ContentView()
}
