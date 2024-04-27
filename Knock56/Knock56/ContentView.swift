//
//  ContentView.swift
//  Knock56
//
//  Created by 白数叡司 on 2024/04/26.
//

import SwiftUI

struct ContentView: View {
    @State var showingSheet: Bool = false
    
    var body: some View {
        Button {
            showingSheet = true
        } label: {
            Text("Tap me!")
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(isPresented: $showingSheet)
        }
    }
}

#Preview {
    ContentView()
}
