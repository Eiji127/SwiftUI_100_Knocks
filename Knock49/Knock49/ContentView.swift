//
//  ContentView.swift
//  Knock49
//
//  Created by 白数叡司 on 2024/04/16.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        Button {
            viewModel.playAudio()
        } label: {
            Text("Play")
        }
    }
}

#Preview {
    ContentView()
}
