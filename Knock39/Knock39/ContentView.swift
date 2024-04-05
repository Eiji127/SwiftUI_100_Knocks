//
//  ContentView.swift
//  Knock39
//
//  Created by 白数叡司 on 2024/04/05.
//

import SwiftUI

struct ContentView: View {
    let markdownText: String = "**Snorlax** is the **most** cute pokemon!\n[About Snorlax](https://en.wikipedia.org/wiki/Snorlax)"
    
    var body: some View {
        Text(markdownText)
    }
}

#Preview {
    ContentView()
}
