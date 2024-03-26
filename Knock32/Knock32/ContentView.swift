//
//  ContentView.swift
//  Knock32
//
//  Created by 白数叡司 on 2024/03/26.
//

import SwiftUI

struct ContentView: View {
    @State var text = "Shake me!"
    
    var body: some View {
        VStack {
            Text(text)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
